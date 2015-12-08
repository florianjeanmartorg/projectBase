//package be.lynk.server.controller;
//
//import be.lynk.server.dto.*;
//import be.lynk.server.dto.externalDTO.FacebookTokenAccessControlDTO;
//import be.lynk.server.dto.post.*;
//import be.lynk.server.model.GenderEnum;
//import be.lynk.server.model.entities.Address;
//import be.lynk.server.util.AccountTypeEnum;
//import be.lynk.server.util.exception.MyRuntimeException;
//import com.jayway.facebooktestjavaapi.testuser.FacebookTestUserAccount;
//import com.jayway.facebooktestjavaapi.testuser.FacebookTestUserStore;
//import com.jayway.facebooktestjavaapi.testuser.impl.HttpClientFacebookTestUserStore;
//import org.junit.Assert;
//import org.junit.FixMethodOrder;
//import org.junit.Test;
//import org.junit.runners.MethodSorters;
//import play.Configuration;
//import play.Logger;
//import play.libs.Json;
//import play.mvc.Controller;
//import play.mvc.Result;
//
//import java.util.Iterator;
//import java.util.List;
//
//import static org.junit.Assert.*;
//import static play.test.Helpers.*;
//
///**
// * Created by florian on 19/04/15.
// * Test for routes :
// * POST     /login
// * POST     /login/facebook
// * POST     /account/fusion
// * POST     /registration/customer
// * POST     /registration/business
// * GET      /email/test
// * POST     /address/test
// * PUT      /facebook/test
// * PUT      /forgot/password
// */
//@FixMethodOrder(MethodSorters.NAME_ASCENDING)
//public class LoginRestControllerTest extends AbstractControllerTest {
//
//
//    private static final String FACEBOOK_EMAIL = "face@book.com";
//    private static final String EMAIL2 = "email@aze.ev";
//
//    protected static final String BI_FIRSTNAME = "BI_firstname";
//    protected static final String BI_LASTNAME = "BI_lastname";
//    protected static final String BI_EMAIL = "my@mybusiness.com";
//    protected static final String BI_PASSWORD = "password";
//
//    private static final String ADDRESS_NAME_1 = "Home";
//    private static final String ADDRESS_STREET_1 = "1 grand place";
//    private static final String ADDRESS_ZIP_1 = "1000";
//    private static final String ADDRESS_CITY_1 = "BRUSELS";
//    private static final String ADDRESS_COUNTRY = "BELGIUM";
//
//    private static final String ADDRESS_NAME_2 = "Office";
//    private static final String ADDRESS_STREET_2 = "Brederodestraat 16";
//    private static final String ADDRESS_ZIP_2 = "B-1000 ";
//    private static final String ADDRESS_CITY_2 = "Brussel";
//    private static final String BI_DESCRIPTION = "BI dscription trzs long apofa zpokepo kzepok ze";
//    private static final String BI_NAME = "BI_NAME";
//    private static final String BI_PHONE = "09999239";
//
//    private static final AddressDTO ADDRESS_TEST_VALID = new AddressDTO("1 grand place", "1000", "Bruxelles", "BELGIUM");
//    private static final AddressDTO ADDRESS_TEST_NOT_VALID = new AddressDTO("gloubigoulba", "90800", "Là-bas", "BELGIUM");
//    private static final AddressDTO ADDRESS_TEST_NOT_VALID_2 = new AddressDTO("Chaussée de Charleroi, 899", "1000", "BXL", "BELGIUM");
//
//    @Test
//    public void test0_address() {
//        AddressDTO addressDTO = new AddressDTO();
//        addressDTO.setName(ADDRESS_NAME_1);
//        addressDTO.setStreet(ADDRESS_STREET_1);
//        addressDTO.setZip(ADDRESS_ZIP_1);
//        addressDTO.setCity(ADDRESS_CITY_1);
//        addressDTO.setCountry(ADDRESS_COUNTRY);
//
//        Result result = request(POST, "/address/test", addressDTO);
//
//        assertEquals(printError(result), 200, status(result));
//    }
//
//
//    @Test
//    public void test1_registration() {
//
//        // ****
//        // *** TEST /customerInterest
//        // ***
//        Result result = request(GET, "/customerInterest");
//
//        assertEquals(printError(result), 200, status(result));
//
//        List<CustomerInterestDTO> customerInterestListDTO = extractList(result, CustomerInterestDTO.class);
//
//        // ****
//        // *** TEST /registration/customer
//        // ***
//        CustomerRegistrationDTO dto = new CustomerRegistrationDTO();
//        AccountRegistrationDTO registrationDTO = new AccountRegistrationDTO();
//        dto.setAccountRegistration(registrationDTO);
//        registrationDTO.setFirstname(FIRSTNAME);
//        registrationDTO.setLastname(LASTNAME);
//        registrationDTO.setGender(GenderEnum.FEMALE);
//        registrationDTO.setEmail(EMAIL);
//        registrationDTO.setPassword(PASSWORD);
//
//        //address
////        AddressDTO addressDTO = new AddressDTO();
////        addressDTO.setName(ADDRESS_NAME_1);
////        addressDTO.setStreet(ADDRESS_STREET_1);
////        addressDTO.setZip(ADDRESS_ZIP_1);
////        addressDTO.setCity(ADDRESS_CITY_1);
////        addressDTO.setCountry(ADDRESS_COUNTRY);
////        dto.setAddress(addressDTO);
//
//        //interest
//        dto.getCustomerInterests().add(new CustomerInterestDTO(customerInterestListDTO.get(0).getName()));
//        dto.getCustomerInterests().add(new CustomerInterestDTO(customerInterestListDTO.get(1).getName()));
//        dto.getCustomerInterests().add(new CustomerInterestDTO(customerInterestListDTO.get(2).getName()));
//
//        result = request(POST, "/registration/customer", dto);
//        connected = true;
//
//        assertEquals(printError(result), 200, status(result));
//
//        // get LoginResultDTO
//        MyselfDTO formDTO = Json.fromJson(Json.parse(new String(contentAsBytes(result))), MyselfDTO.class);
//
//        assertEquals(FIRSTNAME, formDTO.getFirstname());
//        assertEquals(LASTNAME, formDTO.getLastname());
//        assertEquals(EMAIL, formDTO.getEmail());
//        assertFalse(formDTO.getFacebookAccount());
//        assertTrue(formDTO.getLoginAccount());
//
//        //interest
//        assertEquals(3, formDTO.getCustomerInterests().size());
//
////        //address
////        assertEquals(1, formDTO.getAddresses().size());
////        addressDTO = formDTO.getAddresses().get(0);
////        assertEquals(ADDRESS_NAME_1, addressDTO.getName());
////        assertEquals(ADDRESS_STREET_1, addressDTO.getStreet());
////        assertEquals(ADDRESS_ZIP_1, addressDTO.getZip());
////        assertEquals(ADDRESS_CITY_1, addressDTO.getCity());
////        assertEquals(ADDRESS_COUNTRY, addressDTO.getCountry());
//
//        // ****
//        // *** TEST is connected ?
//        // ***
//        result = request(GET, "/myself");
//        assertEquals(printError(result), 200, status(result));
//
//
//        // ****
//        // *** TEST /email/test
//        // ***
//        result = request(GET, "/email/test/" + EMAIL2, dto);
//
//        assertEquals(printError(result), 200, status(result));
//
//        BooleanDTO booleanDTO = Json.fromJson(Json.parse(new String(contentAsBytes(result))), BooleanDTO.class);
//        assertFalse(booleanDTO.getValue());
//
//
//        // ****
//        // *** TEST /logout
//        // ***
//        request(GET, "/logout");
//        connected = false;
//
//        // ****
//        // *** TEST is already connected ?
//        // ***
//        result = request(GET, "/myself");
//        assertNotEquals(printError(result), 200, status(result));
//
//        // ****
//        // *** TEST /login
//        // ***
//
//        /*Result*/
//        result = request(POST, "/login", new LoginDTO(EMAIL, PASSWORD));
//        connected = true;
//
//        assertEquals(printError(result), 200, status(result));
//
//        /*MyselfDTO*/
//        formDTO = Json.fromJson(Json.parse(new String(contentAsBytes(result))), MyselfDTO.class);
//
//        assertEquals(FIRSTNAME, formDTO.getFirstname());
//        assertEquals(LASTNAME, formDTO.getLastname());
//        assertEquals(EMAIL, formDTO.getEmail());
//        assertFalse(formDTO.getFacebookAccount());
//        assertTrue(formDTO.getLoginAccount());
//
//        // ****
//        // *** TEST is connected ?
//        // ***
//        result = request(GET, "/myself");
//        assertEquals(printError(result), 200, status(result));
//
//        // ****
//        // *** TEST /language
//        // ***
//        assertEquals("en", formDTO.getLang().getCode());
//
//        result = request(PUT, "/language/fr");
//        assertEquals(printError(result), 200, status(result));
//
//        result = request(GET, "/myself");
//        assertEquals(printError(result), 200, status(result));
//        AccountDTO accountDTO = getDTO(result, AccountDTO.class);
//
//        assertEquals("fr", accountDTO.getLang().getCode());
//
//        // ****
//        // *** TEST /forgot/password
//        // ***
//        ForgotPasswordDTO forgotPasswordDTO = new ForgotPasswordDTO();
//        forgotPasswordDTO.setEmail(EMAIL);
//        request(PUT, "/forgot/password", forgotPasswordDTO);
//    }
//
//    @Test
//    public void test3_registration() {
//
//
//        // ****
//        // *** TEST /businessCategory
//        // ***
//        Result result = request(GET, "/businessCategory");
//
//        assertEquals(printError(result), 200, status(result));
//
//        List<BusinessCategoryDTO> businessCategoryDTOs = extractList(result, BusinessCategoryDTO.class);
//
//        BusinessRegistrationDTO dto = new BusinessRegistrationDTO();
//
//        // ****
//        // *** TEST /registration/business
//        // ***
//        AccountRegistrationDTO registrationDTO = new AccountRegistrationDTO();
//        dto.setAccountRegistration(registrationDTO);
//        registrationDTO.setFirstname(BI_FIRSTNAME);
//        registrationDTO.setLastname(BI_LASTNAME);
//        registrationDTO.setGender(GenderEnum.FEMALE);
//        registrationDTO.setEmail(BI_EMAIL);
//        registrationDTO.setPassword(BI_PASSWORD);
//
//        //business
//        BusinessDTO business = new BusinessDTO();
//        dto.setBusiness(business);
//        business.setName(BI_NAME);
//        business.setPhone(BI_PHONE);
//        business.setDescription(BI_DESCRIPTION);
//
//        //address
//        AddressDTO addressDTO = new AddressDTO();
//        addressDTO.setStreet(ADDRESS_STREET_2);
//        addressDTO.setZip(ADDRESS_ZIP_2);
//        addressDTO.setCity(ADDRESS_CITY_2);
//        addressDTO.setCountry(ADDRESS_COUNTRY);
//        business.setAddress(addressDTO);
//
//        //business category
//        BusinessCategoryDTO next = businessCategoryDTOs.iterator().next();
//        Iterator<BusinessCategoryDTO> iterator = next.getChildren().iterator();
//        iterator = iterator.next().getChildren().iterator();
//        business.getBusinessCategories().add(iterator.next());
//        business.getBusinessCategories().add(iterator.next());
//
//        result = request(POST, "/registration/business", dto);
//        connected = true;
//
//        assertEquals(printError(result), 200, status(result));
//
//        // get LoginResultDTO
//        MyselfDTO formDTO = Json.fromJson(Json.parse(new String(contentAsBytes(result))), MyselfDTO.class);
//
//        assertEquals(BI_FIRSTNAME, formDTO.getFirstname());
//        assertEquals(BI_LASTNAME, formDTO.getLastname());
//        assertEquals(BI_EMAIL, formDTO.getEmail());
//        assertFalse(formDTO.getFacebookAccount());
//        assertTrue(formDTO.getLoginAccount());
//
//
//        result = request(GET, "/business/" + formDTO.getBusinessId(), dto);
//        assertEquals(printError(result), 200, status(result));
//        BusinessToDisplayDTO businessToDisplayDTO = Json.fromJson(Json.parse(new String(contentAsBytes(result))), BusinessToDisplayDTO.class);
//
//        //interest
////        businessToDisplayDTO.getCategories().entrySet().
////        assertEquals(2, getBusinessCategories().size());
//
//        //address
//        assertEquals(ADDRESS_STREET_2, businessToDisplayDTO.getAddress().getStreet());
//        assertEquals(ADDRESS_ZIP_2, businessToDisplayDTO.getAddress().getZip());
//        assertEquals(ADDRESS_CITY_2, businessToDisplayDTO.getAddress().getCity());
//        assertEquals(ADDRESS_COUNTRY, businessToDisplayDTO.getAddress().getCountry());
//
//        // ****
//        // *** TEST is connected ?
//        // ***
//        result = request(GET, "/myself");
//        assertEquals(printError(result), 200, status(result));
//
//    }
//
//    @Test
//    public void test4_registrationWithFacebook() {
//
//        // ****
//        // *** TEST /registration/customer with facebook authentication
//        // ***
//        String facebookAppId = Configuration.root().getString("facebook.app.id");
//        String facebookAppSecret = Configuration.root().getString("facebook.app.secret");
//
//
//        FacebookTestUserStore facebookStore = new HttpClientFacebookTestUserStore(facebookAppId, facebookAppSecret);
//        FacebookTestUserAccount facebookAccount = facebookStore.createTestUser(true, "email,read_stream");
//
//        FacebookTokenAccessControlDTO facebookTokenAccessControlDTO = Json.fromJson(Json.parse(facebookAccount.getUserDetails()), FacebookTokenAccessControlDTO.class);
//
//        //create facebook authentication dto
//        FacebookAuthenticationDTO facebookAuthenticationDTO = new FacebookAuthenticationDTO();
//        facebookAuthenticationDTO.setToken(facebookAccount.accessToken());
//        facebookAuthenticationDTO.setLang(new LangDTO("english", "en"));
//        facebookAuthenticationDTO.setUserId(facebookAccount.id());
//
//        //create account
//        CustomerRegistrationDTO dto = new CustomerRegistrationDTO();
//        AccountRegistrationDTO registrationDTO = new AccountRegistrationDTO();
//        dto.setAccountRegistration(registrationDTO);
//        registrationDTO.setFirstname(facebookTokenAccessControlDTO.getFirst_name());
//        registrationDTO.setLastname(facebookTokenAccessControlDTO.getLast_name());
//        registrationDTO.setGender(GenderEnum.FEMALE);
//        registrationDTO.setEmail(facebookTokenAccessControlDTO.getEmail());
//        dto.setFacebookAuthentication(facebookAuthenticationDTO);
//
//        //save
//        Result result = request(POST, "/registration/customer", dto);
//        connected = true;
//
//        assertEquals(printError(result), 200, status(result));
//
//        // get LoginResultDTO
//        MyselfDTO formDTO = Json.fromJson(Json.parse(new String(contentAsBytes(result))), MyselfDTO.class);
//
//        //control
//        assertEquals(facebookTokenAccessControlDTO.getFirst_name(), formDTO.getFirstname());
//        assertEquals(facebookTokenAccessControlDTO.getLast_name(), formDTO.getLastname());
//        assertEquals(facebookTokenAccessControlDTO.getEmail(), formDTO.getEmail());
//        assertTrue(formDTO.getFacebookAccount());
//        assertFalse(formDTO.getLoginAccount());
//
//        // ****
//        // *** TEST is connected ?
//        // ***
//        result = request(GET, "/myself");
//        assertEquals(printError(result), 200, status(result));
//
//        // ****
//        // *** TEST /login/facebook
//        // ***
//        result = request(POST, "/login/facebook", facebookAuthenticationDTO);
//
//        assertEquals(printError(result), 200, status(result));
//
//        // get LoginResultDTO
//        formDTO = Json.fromJson(Json.parse(new String(contentAsBytes(result))), MyselfDTO.class);
//
//        assertEquals(facebookTokenAccessControlDTO.getFirst_name(), formDTO.getFirstname());
//        assertEquals(facebookTokenAccessControlDTO.getLast_name(), formDTO.getLastname());
//        assertEquals(facebookTokenAccessControlDTO.getEmail(), formDTO.getEmail());
//        assertTrue(formDTO.getFacebookAccount());
//        assertFalse(formDTO.getLoginAccount());
//    }
//
//    @Test
//    public void test5_accountFusion() {
//
//        // ****
//        // *** TEST /registration/customer with credential login
//        // ***
//        String facebookAppId = Configuration.root().getString("facebook.app.id");
//        String facebookAppSecret = Configuration.root().getString("facebook.app.secret");
//
//        FacebookTestUserStore facebookStore = new HttpClientFacebookTestUserStore(facebookAppId, facebookAppSecret);
//        FacebookTestUserAccount facebookAccount = facebookStore.createTestUser(true, "email,read_stream");
//
//        FacebookTokenAccessControlDTO facebookTokenAccessControlDTO = Json.fromJson(Json.parse(facebookAccount.getUserDetails()), FacebookTokenAccessControlDTO.class);
//
//        //1) create an account with login credential
//        CustomerRegistrationDTO dto = new CustomerRegistrationDTO();
//        AccountRegistrationDTO registrationDTO = new AccountRegistrationDTO();
//        dto.setAccountRegistration(registrationDTO);
//        registrationDTO.setFirstname(facebookTokenAccessControlDTO.getFirst_name());
//        registrationDTO.setLastname(facebookTokenAccessControlDTO.getLast_name());
//        registrationDTO.setGender(GenderEnum.FEMALE);
//        registrationDTO.setEmail(facebookTokenAccessControlDTO.getEmail());
//        registrationDTO.setPassword(PASSWORD);
//
//        Result result = request(POST, "/registration/customer", dto);
//        connected = true;
//
//        assertEquals(printError(result), 200, status(result));
//
//        //try to connection with facebook credential
//
//        FacebookAuthenticationDTO facebookAuthenticationDTO = new FacebookAuthenticationDTO();
//        facebookAuthenticationDTO.setToken(facebookAccount.accessToken());
//        facebookAuthenticationDTO.setLang(new LangDTO("english", "en"));
//        facebookAuthenticationDTO.setUserId(facebookAccount.id());
//        facebookAuthenticationDTO.setAccountType(AccountTypeEnum.CUSTOMER);
//        result = request(POST, "/facebook/test", facebookAuthenticationDTO);
//
//        assertEquals(printError(result), 200, status(result));
//
//        // get LoginResultDTO
//        TestFacebookDTO testFacebookDTO = Json.fromJson(Json.parse(new String(contentAsBytes(result))), TestFacebookDTO.class);
//
//        assertEquals(TestFacebookDTO.TestFacebookStatusEnum.ACCOUNT_WITH_SAME_EMAIL, testFacebookDTO.getStatus());
//
//        // ****
//        // *** TEST is connected ?
//        // ***
//        result = request(GET, "/myself");
//        assertEquals(printError(result), 200, status(result));
//
//        // ****
//        // *** TEST /account/fusion
//        // ***
////        AccountFusionDTO accountFusionDTO = new AccountFusionDTO();
////        accountFusionDTO.setEmail(facebookTokenAccessControlDTO.getEmail());
////        accountFusionDTO.setFacebookToken(facebookAccount.accessToken());
////        accountFusionDTO.setFacebookUserId(facebookAccount.id());
////        accountFusionDTO.setPassword(PASSWORD);
//
////        result = request(POST, "/account/fusion", accountFusionDTO);
//
////        assertEquals(printError(result), 200, status(result));
////
////        // get LoginResultDTO
////        MyselfDTO myselfDTO = Json.fromJson(Json.parse(new String(contentAsBytes(result))), MyselfDTO.class);
////
////        //control
////        assertTrue(myselfDTO.getFacebookAccount());
////        assertTrue(myselfDTO.getLoginAccount());
////
////        // ****
////        // *** TEST is connected ?
////        // ***
////        result = request(GET, "/myself");
////        assertEquals(printError(result), 200, status(result));
//    }
//
//    @Test
//    public void test6_controlAddress() {
//
//        Result result = request(POST, "/address/test", ADDRESS_TEST_VALID);
//        assertEquals(printError(result), 200, status(result));
//
//        boolean error = false;
//        try {
//            result = request(POST, "/address/test", ADDRESS_TEST_NOT_VALID);
//            assertNotEquals(printError(result), 200, status(result));
//        } catch (RuntimeException e) {
//            error = true;
//        }
//        if (!error) {
//            Assert.fail();
//        }
//
//            result = request(POST, "/address/test", ADDRESS_TEST_NOT_VALID_2);
//            assertEquals(printError(result), 200, status(result));
//
//
//
//    }
//
//}
