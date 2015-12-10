package be.lynk.server.controller.rest;

import be.lynk.server.controller.technical.security.annotation.SecurityAnnotation;
import be.lynk.server.controller.technical.security.role.RoleEnum;
import be.lynk.server.dto.AccountDTO;
import be.lynk.server.dto.ChangePasswordDTO;
import be.lynk.server.dto.MyselfDTO;
import be.lynk.server.model.entities.Account;
import be.lynk.server.service.AccountService;
import be.lynk.server.service.LoginCredentialService;
import be.lynk.server.service.SessionService;
import be.lynk.server.util.exception.MyRuntimeException;
import be.lynk.server.util.message.ErrorMessageEnum;
import org.springframework.beans.factory.annotation.Autowired;
import play.db.jpa.Transactional;
import play.i18n.Lang;
import play.mvc.Result;

/**
 * Created by florian on 26/03/15.
 * Used to recover myself / edit my account
 */
@org.springframework.stereotype.Controller
public class
MyselfRestController extends AbstractRestController {

    //service
    @Autowired
    private AccountService accountService;
    @Autowired
    private LoginCredentialService loginCredentialService;

    /* --------------------------------------
        READ FUNCTION
     --------------------------------------- */

    /**
     * Get the myself object
     *
     * @return MyselfDTO
     * @secutiry USER
     */
    @Transactional
    @SecurityAnnotation(role = RoleEnum.USER)
    public Result myself() {

        MyselfDTO myselfDTO = accountToMyself(securityController.getCurrentUser());

        return ok(myselfDTO);
    }

    /* --------------------------------------
        UPDATE FUNCTION
     --------------------------------------- */

    /**
     * Edit the account of the connected user
     * Field editable : firstname,lastname,gender,email,lang
     * If the lang is changed, the language of the server session is changed
     *
     * @return MyselfDTO
     * @secutiry USER
     * @dto AccountDTO
     */
    @Transactional
    @SecurityAnnotation(role = RoleEnum.USER)
    public Result edit() {

        AccountDTO dto = initialization(AccountDTO.class);

        Account account = securityController.getCurrentUser();

        //edit
        account.setFirstname(dto.getFirstname());
        account.setLastname(dto.getLastname());
        account.setGender(dto.getGender());
        account.setEmail(dto.getEmail().toLowerCase());

        if (dto.getLang() != null) {
            Lang lang = Lang.forCode(dto.getLang().getCode());
            if (lang != null) {
                account.setLang(dozerService.map(dto.getLang(), Lang.class));
                changeLang(lang.code());
            }
        }

        //storage
        securityController.storeAccount(ctx(), account);

        //save
        accountService.saveOrUpdate(account);

        return ok(accountToMyself(account));
    }

    /**
     * Change the password of the current connected user
     * Control the old password before accept the new one
     *
     * @return MyselfDTO
     * @secutiry USER
     * @dto ChangePasswordDTO
     * @commonException if the old password doesn't watch
     */
    @Transactional
    @SecurityAnnotation(role = RoleEnum.USER)
    public Result changePassword() {

        ChangePasswordDTO changePasswordDTO = initialization(ChangePasswordDTO.class);

        Account account = securityController.getCurrentUser();

        //control last password
        if (account.getLoginCredential() == null || !loginCredentialService.controlPassword(changePasswordDTO.getOldPassword(), account.getLoginCredential())) {
            throw new MyRuntimeException(ErrorMessageEnum.WRONG_OLD_PASSWORD);
        }

        account.getLoginCredential().setPassword(changePasswordDTO.getNewPassword());

        //operation
        accountService.saveOrUpdate(account);

        return ok(accountToMyself(account));
    }
}
