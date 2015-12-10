//delete from session;
//delete from logincredential where account_id = (select id from account where email ='john@snow.com' or email = 'paul@fire.com');
//delete from address WHERE  account_id  = (select id from account where email ='john@snow.com' or email = 'paul@fire.com');
//delete from account where email ='john@snow.com' or email = 'paul@fire.com';

describe('Customer test', function () {

    //var target = 'http://lynk-test.herokuapp.com/';
    var target = 'http://localhost:9000/';

    //variables
    //customer account
    var customerFirstName = 'John',
        customerLastName = 'Snow',
        customerGender = 'Homme',
        customerEmail = 'john@snow.com',
        customerPassword = 'password',
        customerFirstName2 = 'Paul',
        customerLastName2 = 'Fire',
        customerGender2 = 'Femme',
        customerEmail2 = 'paul@fire.com',
        customerPassword2 = 'password2';

    //address
    var customerAddressName = 'Mon domicile',
        customerAddressStreet = '1 Grand place',
        customerAddressCity = 'Brussel',
        customerAddressZip = '1000',
        customerAddressCountry = 'BELGIUM',
        customerAddress2Street = '3 rue des Bouchers',
        customerAddress2City = 'Brussel',
        customerAddress2Zip = '1000';

    //function
    var writeField = function(fieldName,content){
        element(by.name(fieldName)).clear().then(function () {
            element(by.name(fieldName)).sendKeys(content);
        });
    };

    it('Customer test web', function () {

        browser.get(target);


        // ********************
        // Registration
        // ********************

        //open modal
        element(by.id('welcome-btn-registration')).click();

        //complete form
        writeField('firstname',customerFirstName);
        writeField('lastname',customerLastName);
        element(by.cssContainingText('option', customerGender)).click();
        writeField('email',customerEmail);
        writeField('password',customerPassword);
        writeField('repeatPassword',customerPassword);

        //skip address and interest
        element(by.id('registration-modal-btn-save')).click();

        //control connection
        expect(element(by.css('.menu-connection-name')).getText()).toEqual(customerFirstName);
        element(by.css('.messenger-close')).click();

        //logout
        element(by.id('dropdownMenu1')).click();
        element(by.id('welcome-btn-logout')).click();

        // ********************
        // Login
        // ********************
        element(by.id('welcome-btn-login')).click();
        writeField('email',customerEmail);
        writeField('password',customerPassword);

        //login
        element(by.id('login-modal-btn-save')).click();
        element(by.css('.messenger-close')).click();

        //browser.pause();

        //control connection
        expect(element(by.css('.menu-connection-name')).getText()).toEqual(customerFirstName);

        // ********************
        // Edit profile
        // ********************

        //navigate to profile
        element(by.id('dropdownMenu1')).click();
        element(by.id('welcome-btn-profile')).click();



        // Edit personal data
        // ********************
        //edit
        element(by.id('profile-personal-btn-edit')).click();
        //edit data
        writeField('firstname',customerFirstName2);
        //cancel
        element(by.id('profile-personal-btn-cancel')).click();
        //control
        expect(element(by.name('firstname')).getAttribute('value')).toEqual(customerFirstName);
        //edit
        element(by.id('profile-personal-btn-edit')).click();
        writeField('firstname',customerFirstName2);
        writeField('lastname',customerLastName2);
        element(by.cssContainingText('option', customerGender2)).click();
        writeField('email',customerEmail2);
        //save
        element(by.id('profile-personal-btn-save')).click();
        //control
        expect(element(by.name('firstname')).getAttribute('value')).toEqual(customerFirstName2);
        expect(element(by.name('lastname')).getAttribute('value')).toEqual(customerLastName2);
        expect(element(by.name('gender')).$('option:checked').getText()).toEqual(customerGender2);
        expect(element(by.name('email')).getAttribute('value')).toEqual(customerEmail2);

        //reload
        browser.get(target+'profile');
        //control
        expect(element(by.name('firstname')).getAttribute('value')).toEqual(customerFirstName2);
        expect(element(by.name('lastname')).getAttribute('value')).toEqual(customerLastName2);
        expect(element(by.name('gender')).$('option:checked').getText()).toEqual(customerGender2);
        expect(element(by.name('email')).getAttribute('value')).toEqual(customerEmail2);

        // Edit password
        // ********************
        //open window
        element(by.id('profile-personal-btn-edit-password')).click();
        //change password
        element(by.id('change-password-input-password')).sendKeys(customerPassword);
        element(by.id('change-password-input-new-password')).sendKeys(customerPassword2);
        element(by.id('change-password-input-repeat-password')).sendKeys(customerPassword2);
        //save
        element(by.id('change-password-btn-save')).click();
        //logout
        element(by.id('dropdownMenu1')).click();
        element(by.id('welcome-btn-logout')).click();
        //login
        element(by.id('welcome-btn-login')).click();
        writeField('email',customerEmail2);
        writeField('password',customerPassword2);
        element(by.id('login-modal-btn-save')).click();
        element(by.css('.messenger-close')).click();

        //navigate to profile
        element(by.id('dropdownMenu1')).click();
        element(by.id('welcome-btn-profile')).click();

        // Test welcome
        // ********************


    });
});