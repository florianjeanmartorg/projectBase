package be.lynk.server.controller.rest;

import be.lynk.server.controller.EmailController;
import be.lynk.server.controller.technical.security.annotation.SecurityAnnotation;
import be.lynk.server.controller.technical.security.role.RoleEnum;
import be.lynk.server.dto.BooleanDTO;
import be.lynk.server.dto.MyselfDTO;
import be.lynk.server.dto.externalDTO.FacebookTokenAccessControlDTO;
import be.lynk.server.dto.post.AccountRegistrationDTO;
import be.lynk.server.dto.post.ForgotPasswordDTO;
import be.lynk.server.dto.post.LoginDTO;
import be.lynk.server.dto.technical.DTO;
import be.lynk.server.dto.technical.ResultDTO;
import be.lynk.server.model.GenderEnum;
import be.lynk.server.model.entities.Account;
import be.lynk.server.model.entities.FacebookCredential;
import be.lynk.server.model.entities.LoginCredential;
import be.lynk.server.model.entities.Session;
import be.lynk.server.service.*;
import be.lynk.server.util.KeyGenerator;
import be.lynk.server.util.exception.MyRuntimeException;
import be.lynk.server.util.httpRequest.FacebookRequest;
import be.lynk.server.util.message.ErrorMessageEnum;
import org.jasypt.util.password.StrongPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import play.Logger;
import play.db.jpa.Transactional;
import play.i18n.Lang;
import play.mvc.Result;
import play.mvc.Results;

/**
 * Created by florian on 25/03/15.
 * This class is used to connect / register / logout an account.
 * Functions doesn't required an authentication.
 */
@org.springframework.stereotype.Controller
public class LoginRestController extends AbstractRestController {

    @Autowired
    private AccountService            accountService;
    @Autowired
    private SessionService            sessionService;
    @Autowired
    private EmailController           emailController;
    @Autowired
    private FacebookCredentialService facebookCredentialService;
    @Autowired
    private LoginCredentialService    loginCredentialService;


    /* --------------------------------------
        CREATE FUNCTION
     --------------------------------------- */

    /**
     * login with facebook
     * The facebookToken / userId are send to Facebook to be authenticated
     * if the accessToken come from a user already registered, logging him
     * if not, create a new customer account and send an email
     * if not and the user is currently logged, fusion the facebook account and the currently logged user
     *
     * @secutiry none
     * @param facebookToken the facebook token of the user
     * @param userId        the userId
     * @return MyselfDTO
     * @commonException if the Facebook account have no email / the email is owned by an other account
     */
    @Transactional
    public Result loginFacebook(String facebookToken, String userId) {

        initialization();

        //authentication by Facebook
        FacebookTokenAccessControlDTO facebookTokenAccessControlDTO = facebookCredentialService.controlFacebookAccess(facebookToken,userId);

        //test if the user already exists
        FacebookCredential facebookCredential = facebookCredentialService.findByUserId(facebookTokenAccessControlDTO.getId());
        Account            account;

        if (facebookCredential != null) {
            //the user already exists : connect him
            account = facebookCredential.getAccount();
        } else {

            //if the account doesn't exist, create one
            facebookCredential = new FacebookCredential();
            facebookCredential.setUserId(facebookTokenAccessControlDTO.getId());

            //the user is logged ?
            if (securityController.isAuthenticated(ctx())) {
                //fusion !
                account = securityController.getCurrentUser();
                account.setFacebookCredential(facebookCredential);
                facebookCredential.setAccount(account);

                //save
                accountService.saveOrUpdate(account);

            } else {

                //test email : if the email is null, impossible to create an account
                if (facebookTokenAccessControlDTO.getEmail() == null) {
                    throw new MyRuntimeException(ErrorMessageEnum.FACEBOOK_NO_EMAIL);
                }

                //Control email
                if (accountService.findByEmail(facebookTokenAccessControlDTO.getEmail().toLowerCase()) != null) {
                    //fusion !
                    account = accountService.findByEmail(facebookTokenAccessControlDTO.getEmail().toLowerCase());
                    account.setFacebookCredential(facebookCredential);
                    facebookCredential.setAccount(account);

                    facebookCredentialService.saveOrUpdate(facebookCredential);
                } else {
                    //create new account
                    account = new Account();
                    account.setEmail(facebookTokenAccessControlDTO.getEmail().toLowerCase());
                    account.setFirstname(facebookTokenAccessControlDTO.getFirst_name());
                    account.setLastname(facebookTokenAccessControlDTO.getLast_name());
                    account.setFacebookCredential(facebookCredential);
                    account.setGender(GenderEnum.getByText(facebookTokenAccessControlDTO.getGender()));
                    account.setRole(RoleEnum.USER);
                    facebookCredential.setAccount(account);

                    //define a language
                    if (facebookTokenAccessControlDTO.getLocale() != null) {
                        for (Lang lang : Lang.availables()) {
                            if (facebookTokenAccessControlDTO.getLocale().equals(lang.code())) {
                                account.setLang(lang);
                                break;
                            }
                        }
                    } else {
                        account.setLang(Lang.forCode("fr"));
                    }

                    //change lang interface
                    if (account.getLang() != null) {
                        account.setLang(lang());
                    }
                }

                //send email
                emailController.sendApplicationRegistrationCustomerEmail(account);

                accountService.saveOrUpdate(account);


            }

        }
        return ok(finalizeConnection(account));
    }

    /**
     * Register a new account
     * Create a account, session, store the account into the session and send an email
     *
     * @secutiry none
     * @dto post.AccountRegistrationDTO
     * @return MyselfDTO
     * @commonException the email is owned by an other account
     */
    @Transactional
    public Result registration() {

        AccountRegistrationDTO accountDTO = initialization(AccountRegistrationDTO.class);
        Account                account    = createNewAccount(accountDTO);


        //send email
        emailController.sendApplicationRegistrationCustomerEmail(account);

        accountService.saveOrUpdate(account);

        return ok(finalizeConnection(account));
    }


    /* ////////////////////////////////////////////////////
     * UPDATE FUNCTION
     /////////////////////////////////////////////////// */

    /**
     * generate a new password and send a mail with it
     *
     * @dto post.ForgotPasswordDTO
     * @secutiry none
     * @return none
     * @commonException  the email is not owned by an account / this account doesn't use a loginCredential
     */
    @Transactional
    public Result forgotPassword() {

        ForgotPasswordDTO dto = initialization(ForgotPasswordDTO.class);

        Account byEmail = accountService.findByEmail(dto.getEmail().toLowerCase());

        if (byEmail == null) {
            throw new MyRuntimeException(ErrorMessageEnum.EMAIL_UNKNOWN);
        }
        if (byEmail.getLoginCredential() == null) {
            throw new MyRuntimeException(ErrorMessageEnum.ACCOUNT_WITHOUT_LOGIN_CREDENTIAL);
        }

        byEmail.getLoginCredential().setPassword(KeyGenerator.generateRandomPassword());

        //send email
        emailController.sendNewPasswordEmail(byEmail);

        accountService.saveOrUpdate(byEmail);

        return ok(new ResultDTO());
    }

    /**
     * Try to log the user to an account with the password / email
     *
     * @secutiry none
     * @dto post.LoginDTO
     * @return MyselfDTO
     * @commonException the couple login - password doesn't match
     */
    @Transactional
    public Result login() {

        //extract DTO
        LoginDTO dto = initialization(LoginDTO.class);

        //control account
        Account account = accountService.findByEmail(dto.getEmail());

        if (account == null || account.getLoginCredential() == null || !loginCredentialService.controlPassword(dto.getPassword(), account.getLoginCredential())) {
            //if there is no account for this email or the password doesn't the right, throw an exception
            throw new MyRuntimeException(ErrorMessageEnum.WRONG_PASSWORD_OR_LOGIN);
        }

        DTO result = finalizeConnection(account);

        return ok(result);
    }

    /**
     * log out the user
     *
     * @secutiry none
     * @dto none
     * @return a redirection to the home page
     */
    @Transactional
    public Result logout() {
        securityController.logout(ctx());
        return Results.redirect("/");
    }

    /**
     * change the language of the server. If the user if logged, change also his language
     *
     * @param code : the code of the lang ('en','fr',...)
     * @secutiry none
     * @dto none
     * @return none
     */
    @Transactional
    public Result changeLanguage(String code) {

        initialization();

        Lang lang = Lang.forCode(code);
        if (lang != null) {
            changeLang(lang.code());


            if (securityController.isAuthenticated(ctx())) {
                Account account = securityController.getCurrentUser();
                account.setLang(lang);
                accountService.saveOrUpdate(account);
            }
        }


        return ok(new ResultDTO());
    }

    /* ////////////////////////////////////////////////////
     * READ FUNCTION
     /////////////////////////////////////////////////// */

    /**
     * Test if a email address is already owned by an account
     *
     * @param email : the email address to test
     * @secutiry none
     * @dto none
     * @return true if the email is already owned, false if not
     */
    @Transactional
    public Result testEmail(String email) {
        return ok(new BooleanDTO(accountService.findByEmail(email) != null));
    }


    /* ////////////////////////////////////////////////////
     * PRIVATE FUNCTION
     /////////////////////////////////////////////////// */


    private DTO finalizeConnection(Account account) {


        sessionService.saveOrUpdate(new Session(account, getDevice()));

        MyselfDTO myselfDTO = accountToMyself(account);


        //storage
        securityController.storeAccount(ctx(), account);

        return myselfDTO;


    }

    private Account createNewAccount(AccountRegistrationDTO accountDTO) {

        //Control email
        if (accountService.findByEmail(accountDTO.getEmail()) != null) {
            throw new MyRuntimeException(ErrorMessageEnum.EMAIL_ALREADY_USED);
        }

        //account
        Account account = dozerService.map(accountDTO, Account.class);
        account.setRole(RoleEnum.USER);
        account.setEmail(account.getEmail().toLowerCase());


        //define a language
        if (account.getLang() == null) {
            account.setLang(lang());
        }

        //credential
        account.setLoginCredential(new LoginCredential(account, accountDTO.getPassword()));

        return account;
    }

    private String generateEncryptingPassword(final String password) {
        return new StrongPasswordEncryptor().encryptPassword(password);
    }

}
