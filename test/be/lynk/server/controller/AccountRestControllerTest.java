//package be.lynk.server.controller;
//
//import be.lynk.server.dto.AccountDTO;
//import be.lynk.server.dto.AddressDTO;
//import be.lynk.server.dto.CustomerInterestDTO;
//import be.lynk.server.dto.MyselfDTO;
//import be.lynk.server.dto.post.CustomerRegistrationDTO;
//import org.junit.FixMethodOrder;
//import org.junit.Test;
//import org.junit.runners.MethodSorters;
//import play.mvc.Result;
//
//import java.util.List;
//
//import static play.test.Helpers.status;
//
//import static play.test.Helpers.*;
//import static org.junit.Assert.*;
//
///**
//* Created by florian on 19/04/15.
// * Test for routes :
// * POST     /myself
// * PUT      /account/
// * GET      /customerInterest
// * POST     /address
// *
//*/
//@FixMethodOrder(MethodSorters.NAME_ASCENDING)
//public class AccountRestControllerTest extends AbstractControllerTest {
//
//    protected static final String FIRSTNAME2 = "firstname2";
//    protected static final String LASTNAME2 = "lastname2";
//    protected static final String EMAIL2 = "my@email2.com";
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
//
//    @Test
//    public void test1_readAccount() {
//
//        registration();
//
//        // ****
//        // *** TEST /myself
//        // ***
//        Result result = request(GET, "/myself");
//
//        assertEquals(printError(result), 200, status(result));
//
//        MyselfDTO dto = getDTO(result, MyselfDTO.class);
//
//        assertEquals(FIRSTNAME, dto.getFirstname());
//        assertEquals(LASTNAME, dto.getLastname());
//        assertEquals(EMAIL, dto.getEmail());
//    }
//
//    @Test
//    public void test2_editAccount() {
//        MyselfDTO account = registration();
//
//        // ****
//        // *** TEST PUT /account
//        // ***
//        account.setFirstname(FIRSTNAME2);
//        account.setLastname(LASTNAME2);
//        account.setEmail(EMAIL2);
//
//        //save
//        account = requestWithDTo(PUT, "/account/" + account.getId(), account, MyselfDTO.class);
//
//        //test
//        assertEquals(FIRSTNAME2, account.getFirstname());
//        assertEquals(LASTNAME2, account.getLastname());
//        assertEquals(EMAIL2, account.getEmail());
//    }
//
//    @Test
//    public void test3_customerInterest(){
//        MyselfDTO myself= registration();
//
//        // ****
//        // *** TEST GET     /customerInterest
//        // ***
//        Result result = request(GET, "/customerInterest");
//
//        assertEquals(printError(result), 200, status(result));
//
//        List<CustomerInterestDTO> customerInterestListDTO = extractList(result, CustomerInterestDTO.class);
//
//        // ****
//        // *** TEST PUT     /customer/interest/
//        // ***
//        assertEquals(0,myself.getCustomerInterests().size());
//
//
//        myself.getCustomerInterests().add(new CustomerInterestDTO(customerInterestListDTO.get(0).getName()));
//        myself.getCustomerInterests().add(new CustomerInterestDTO(customerInterestListDTO.get(1).getName()));
//        myself.getCustomerInterests().add(new CustomerInterestDTO(customerInterestListDTO.get(2).getName()));
//
//        //TODO use list instead CustomerRegistrationDTO
//        // Result result = request(GET, "/customerInterest");
//
//    }
//
//    @Test
//    public void test4_addresses(){
//
//        MyselfDTO myself= registration();
//
//        // ****
//        // *** TEST POST     /address
//        // ***
//        assertEquals(0,myself.getAddresses().size());
//
//        AddressDTO addressDTO  = new AddressDTO();
//        addressDTO.setName(ADDRESS_NAME_1);
//        addressDTO.setStreet(ADDRESS_STREET_1);
//        addressDTO.setZip(ADDRESS_ZIP_1);
//        addressDTO.setCity(ADDRESS_CITY_1);
//        addressDTO.setCountry(ADDRESS_COUNTRY);
//
//        Result result = request(POST, "/address",addressDTO);
//
//        assertEquals(printError(result), 200, status(result));
//
//        //add a second address
//        addressDTO  = new AddressDTO();
//        addressDTO.setName(ADDRESS_NAME_2);
//        addressDTO.setStreet(ADDRESS_STREET_2);
//        addressDTO.setZip(ADDRESS_ZIP_2);
//        addressDTO.setCity(ADDRESS_CITY_2);
//        addressDTO.setCountry(ADDRESS_COUNTRY);
//
//        result = request(POST, "/address",addressDTO);
//
//        assertEquals(printError(result), 200, status(result));
//
//        //TODO control address
//
//        //TODO control order
//
//        //TODO edit
//
//        //TODO delete
//
//
//    }
//
//
//}
