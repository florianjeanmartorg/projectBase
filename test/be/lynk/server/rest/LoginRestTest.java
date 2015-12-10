package be.lynk.server.rest;

import be.lynk.server.dto.ChangePasswordDTO;
import be.lynk.server.dto.MyselfDTO;
import be.lynk.server.dto.post.AccountRegistrationDTO;
import be.lynk.server.dto.post.LoginDTO;
import be.lynk.server.model.GenderEnum;
import be.lynk.server.util.httpRequest.HttpRequestException;
import org.junit.Assert;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by florian on 19/07/15.
 */
public class LoginRestTest {


    private static final String EMAIL = "florian.jeanmart@gmail.com";
    private static final String FIRST_NAME = "florian";
    private static final String LAST_NAME = "jean";
    private static final GenderEnum GENDER = GenderEnum.MALE;


    private static final String EMAIL2 = "florian.2@gmail.com";
    private static final String PASSWORD = "password";
    private static final String PASSWORD2 = "password2";


    @org.junit.Test
    public void test() throws HttpRequestException {

        //registration
        AccountRegistrationDTO  accountRegistrationDTO = new AccountRegistrationDTO();
        accountRegistrationDTO.setEmail(EMAIL);
        accountRegistrationDTO.setFirstname(FIRST_NAME);
        accountRegistrationDTO.setLastname(LAST_NAME);
        accountRegistrationDTO.setGender(GENDER);
        accountRegistrationDTO.setPassword(PASSWORD);

        HttpRequestTest httpRequestTest = new HttpRequestTest(HttpRequestTest.RequestMethod.POST, "/rest/registration");
        httpRequestTest.setReturnExcepted(MyselfDTO.class);
        httpRequestTest.setDto(accountRegistrationDTO);
        httpRequestTest.sendRequest();


        //loggin
        MyselfDTO myselfDTO = loggin(EMAIL, PASSWORD);
        String authenticationKey = myselfDTO.getAuthenticationKey();

        //test connection
        testIsLogger(true, authenticationKey);



        //change password
        changePassword(myselfDTO,authenticationKey,PASSWORD,PASSWORD2);

        //edit
        edit(myselfDTO,authenticationKey,EMAIL2);

        //logout
        HttpRequestTest httpRequestTest3 = new HttpRequestTest(HttpRequestTest.RequestMethod.GET, "/rest/logout");
        httpRequestTest3.addHeader("authenticationKey", authenticationKey);
        httpRequestTest3.sendRequest();

        //new login
        myselfDTO = loggin(EMAIL2, PASSWORD2);

        //edit profile
        edit(myselfDTO,authenticationKey,EMAIL);
        changePassword(myselfDTO,authenticationKey,PASSWORD2,PASSWORD);


    }

    private void changePassword(MyselfDTO myselfDTO, String authenticationKey, String oldPassword, String newPassword) throws HttpRequestException {
        ChangePasswordDTO changePasswordDTO = new ChangePasswordDTO();
        changePasswordDTO.setOldPassword(oldPassword);
        changePasswordDTO.setNewPassword(newPassword);
        HttpRequestTest httpRequestTest5 = new HttpRequestTest(HttpRequestTest.RequestMethod.PUT, "/rest/myself/password");
        httpRequestTest5.setDto(changePasswordDTO);
        httpRequestTest5.addHeader("authenticationKey", authenticationKey);
        httpRequestTest5.sendRequest();
    }

    private void edit(MyselfDTO myselfDTO,String authenticationKey,String newEmail) throws HttpRequestException {
        //edit profile
        myselfDTO.setEmail(newEmail);
        HttpRequestTest httpRequestTest4 = new HttpRequestTest(HttpRequestTest.RequestMethod.PUT, "/rest/myself");
        httpRequestTest4.setDto(myselfDTO);
        httpRequestTest4.addHeader("authenticationKey", authenticationKey);
        httpRequestTest4.sendRequest();

        myselfDTO = testIsLogger(true, authenticationKey);
        Assert.assertEquals(myselfDTO.getEmail(), newEmail);
    }

    private MyselfDTO loggin(String login, String password) throws HttpRequestException {
        //loggin
        LoginDTO loginDTO = new LoginDTO();
        loginDTO.setEmail(login);
        loginDTO.setPassword(password);
        HttpRequestTest httpRequestTest = new HttpRequestTest(HttpRequestTest.RequestMethod.POST, "/rest/login");
        httpRequestTest.setDto(loginDTO);
        httpRequestTest.setReturnExcepted(MyselfDTO.class);
        MyselfDTO myselfDTO = (MyselfDTO) httpRequestTest.sendRequest();
        Assert.assertEquals(myselfDTO.getEmail(), login);
        return myselfDTO;
    }


    private MyselfDTO testIsLogger(boolean expectedLogger, String authenticationKey) {
        //test connection
        boolean testFail = false;
        try {
            HttpRequestTest httpRequestTest = new HttpRequestTest(HttpRequestTest.RequestMethod.GET, "/rest/myself");
            httpRequestTest.setReturnExcepted(MyselfDTO.class);
            httpRequestTest.addHeader("authenticationKey", authenticationKey);
            MyselfDTO myselfDTO = (MyselfDTO) httpRequestTest.sendRequest();
            return myselfDTO;
        } catch (HttpRequestException e) {
            testFail = true;
        }
        if (expectedLogger) {
            Assert.assertFalse(testFail);
        }
        return null;
    }
}
