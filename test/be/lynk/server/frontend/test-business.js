//delete from session;
//delete from logincredential where account_id = (select id from account where email ='john@snow.com' or email = 'paul@fire.com');
//delete from address WHERE  account_id  = (select id from account where email ='john@snow.com' or email = 'paul@fire.com');
//delete from account where email ='john@snow.com' or email = 'paul@fire.com';

describe('Business test', function () {

    var generateDate = function () {
        var ds, ms,
            d = new Date().getUTCDay(),
            y = new Date().getUTCFullYear(),
            m = new Date().getUTCMonth() + 2;

        if (d < 10) {
            ds = "0" + d;
        }
        else {
            ds = d;
        }

        if (m < 10) {
            ms = "0" + m;
        }
        else {
            ms = m;
        }
        return y + "-" + m + "-" + d + " 00:00";
    };

    var path = require('path');

    //var target = 'http://lynk-test.herokuapp.com/';
    var target = 'http://localhost:9000/',
        adminTarget = 'http://localhost:9000/admin/';

    var adminPassword = 'password',
        adminEmail = 'florian.jeanmart@gmail.com';

    //variables
    //customer account
    var businessAccountFirstName = 'Roy',
        businessAccountLastName = 'Thebig',
        businessAccountGender = 'Homme',
        businessAccountEmail = 'roy@belgique.be',
        businessAccountPassword = 'password';

    //business
    var businessName = 'My rol society',
        businessDescription = 'Nous sommes le pouvoir de la Belgique!! éèàÊê ôö123=:;$$ù$',
        businessPhone = '+32.478.23.12.12',
        businessEmail = 'king@belgium.com',
        businessWeb = 'http://king.be',
        businessName2 = 'My royal society',
        businessDescription2 = 'Nous sommes le pouvoir de la Belgique!! éèàÊê ôö123=:;$$ù$ ;=:;=:;',
        businessPhone2 = '+32.478.23.65.12',
        businessEmail2 = 'king@belgique.com',
        businessWeb2 = 'http://kingandqueen.be',
        businessAddressStreet = 'Rue Brederode 16',
        businessAddressCity = 'Bruxelles',
        businessAddressZip = '1000',
        businessAddressStreet2 = 'Avenue du Parc Royal',
        businessAddressCity2 = 'Bruxelles',
        businessAddressZip2 = '1020',
        businessAddressCountry = 'BELGIUM',
        businessCategory = 'servicespubliques',
        businessSubCategory = 'servicespubliques_fedeintern',
        businessSubSubCategory = 'servicespubliques_fedeintern_ambassade',
        businessSubSubCategoryB = 'servicespubliques_fedeintern_justice',
        businessSubSubCategory2 = 'servicespubliques_fedeintern_emploi',
        businessSubSubCategory2B = 'servicespubliques_fedeintern_mobilite',
        businessSubSubCategoryTranslate = 'Ambassade',
        businessSubSubCategoryBTranslate = 'Justice',
        businessSubSubCategory2Translate = 'Mobilité',
        businessSubSubCategory2BTranslate = 'Emploi',
        businessFacebook = 'https://www.facebook.com/groups/979844295380681/?fref=ts',
        businessTwitter = 'https://twitter.com/twitter',
        businessInstagram = 'https://instagram.com/instagram/',
        businessDelivery = 'http://www.takeeateasy.be/fr/livraison-bruxelles/restaurant/yen';

    var promotionTitle = 'couronne à prix cassé !',
        promotionDescription = 'vente expresse de couronnes pour cause de crise économique! cette couronne est pleine de truc qui brille et qui valent de l\'argent',
        promotionEndDate = generateDate(),
        promotionQuantity = "1",
        promotionOriginalPrice = "5000000",
        promotionOffPercent = "99,99";

    //function
    var writeField = function (fieldName, content) {
        element(by.name(fieldName)).clear().then(function () {
            element(by.name(fieldName)).sendKeys(content);
        });
    };

    var closeModal = function (id) {
        element(by.id(id)).click();
        browser.executeScript('window.scrollTo(0,0);');
        browser.waitForAngular();
    };

    it('Business test web', function () {

        var width = 1200;
        var height = 1400;
        browser.driver.manage().window().setSize(width, height);
        browser.get(target+'home');

        //control page name
        expect(browser.getTitle()).toEqual('Gling');

        // ********************
        // Registration
        // ********************

        //open modal
        element(by.id('welcome-btn-registration')).click();
        element(by.css(".modal-login-link")).click();

        //complete form
        writeField('firstname', businessAccountFirstName);
        writeField('lastname', businessAccountLastName);
        element(by.cssContainingText('option', businessAccountGender)).click();
        writeField('email', businessAccountEmail);
        writeField('password', businessAccountPassword);
        writeField('repeatPassword', businessAccountPassword);
        element(by.name('sla')).click();
        element(by.id('business-registration-btn-next')).click();

        //add busines data
        writeField('name', businessName);
        writeField('description', businessDescription);
        writeField('phone', businessPhone);
        writeField('website', businessWeb);
        writeField('business-email', businessEmail);
        writeField('street', businessAddressStreet);
        writeField('zip', businessAddressZip);
        writeField('city', businessAddressCity);
        element(by.id('business-registration-btn-next')).click();

        //select category
        element(by.name(businessCategory)).click();
        element(by.name(businessSubCategory)).click();
        element(by.name(businessSubSubCategory)).click();
        element(by.name(businessSubSubCategoryB)).click();
        element(by.id('business-registration-btn-save')).click();

        //control connection
        expect(element(by.id('dropdownMenu1')).getText()).toEqual(businessAccountFirstName + " " + businessAccountLastName);
        element(by.css('.messenger-close')).click();

        //logout
        element(by.id('dropdownMenu1')).click();
        element(by.id('welcome-btn-logout')).click();

        // ********************
        // Login
        // ********************
        element(by.id('welcome-btn-login')).click();
        writeField('email', businessAccountEmail);
        writeField('password', businessAccountPassword);

        //login
        element(by.id('login-modal-btn-save')).click();
        element(by.css('.messenger-close')).click();

        //control connection
        expect(element(by.id('dropdownMenu1')).getText()).toEqual(businessAccountFirstName + " " + businessAccountLastName);

        // ********************
        // Edit business
        // ********************

        //navigate to business
        element(by.id('dropdownMenu1')).click();
        element(by.id('welcome-btn-business')).click();

        //control
        expect(element(by.css('.business-page-name span')).getText()).toEqual(businessName);
        expect(element(by.css('.business-page-description span')).getText()).toEqual(businessDescription);
        expect(element(by.id('welcome-contact-data-phone')).getText()).toContain(businessPhone);
        expect(element(by.id('welcome-contact-data-website')).getText()).toContain(businessWeb);
        expect(element(by.id('welcome-contact-data-email')).getText()).toContain(businessEmail);
        //category
        expect(element(by.css('.category-line-tree table td:nth-child(2)')).getText()).toContain(businessSubSubCategoryTranslate);
        expect(element(by.css('.category-line-tree table td:nth-child(2)')).getText()).toContain(businessSubSubCategoryBTranslate);
        //address
        expect(element(by.css('.business-address div:nth-child(1)')).getText()).toEqual(businessAddressStreet + ", " + businessAddressZip + ", " + businessAddressCity);

        //edit illustration
        element(by.id("business-btn-illustration-edit")).click();
        var illustrationToUpload = path.resolve(__dirname, 'img/illustration.png');
        $('input[type="file"]').sendKeys(illustrationToUpload);
        closeModal("basic-modal-btn-save");
        //TODO control ?

        browser.waitForAngular();

        //edit landscape
        element(by.id("business-btn-landscape-edit")).click();
        var landscapeToUpload = path.resolve(__dirname, 'img/landscape.jpg');
        $('input[type="file"]').sendKeys(landscapeToUpload);
        closeModal("basic-modal-btn-save");
        //TODO control ?

        //edit business
        browser.executeScript('window.scrollTo(1000,0);');
        element(by.id("business-btn-contact-edit")).click();
        writeField('name', businessName2);
        writeField('description', businessDescription2);
        writeField('phone', businessPhone2);
        writeField('website', businessWeb2);
        writeField('business-email', businessEmail2);
        closeModal("basic-modal-btn-save");

        //control
        expect(element(by.css('.business-page-name span')).getText()).toEqual(businessName2);
        expect(element(by.css('.business-page-description span')).getText()).toEqual(businessDescription2);
        expect(element(by.id('welcome-contact-data-phone')).getText()).toContain(businessPhone2);
        expect(element(by.id('welcome-contact-data-website')).getText()).toContain(businessWeb2);
        expect(element(by.id('welcome-contact-data-email')).getText()).toContain(businessEmail2);

        //edit address
        element(by.id("business-btn-address-edit")).click();
        writeField('street', businessAddressStreet2);
        writeField('zip', businessAddressZip2);
        writeField('city', businessAddressCity2);
        closeModal("basic-modal-btn-save");

        //controll
        expect(element(by.css('.business-address div:nth-child(1)')).getText()).toEqual(businessAddressStreet2 + ", " + businessAddressZip2 + ", " + businessAddressCity2);

        //edit category
        element(by.id("business-btn-category-edit")).click();
        element(by.name(businessSubSubCategory)).click();
        element(by.name(businessSubSubCategoryB)).click();
        element(by.name(businessSubSubCategory2)).click();
        element(by.name(businessSubSubCategory2B)).click();
        closeModal("basic-modal-btn-save");

        //control
        expect(element(by.css('.category-line-tree table td:nth-child(2)')).getText()).toContain(businessSubSubCategory2Translate);
        expect(element(by.css('.category-line-tree table td:nth-child(2)')).getText()).toContain(businessSubSubCategory2BTranslate);

        //edit social network
        element(by.id("business-btn-social-network-edit")).click();
        writeField('facebook', businessFacebook);
        writeField('twitter', businessTwitter);
        writeField('instagram', businessInstagram);
        writeField('delivery', businessDelivery);
        closeModal("basic-modal-btn-save");

        expect(element(by.id("welcome-link-facebook")).getAttribute('href')).toContain(businessFacebook);
        expect(element(by.id("welcome-link-twitter")).getAttribute('href')).toContain(businessTwitter);
        expect(element(by.id("welcome-link-instagram")).getAttribute('href')).toContain(businessInstagram);
        expect(element(by.id("welcome-link-delivery")).getAttribute('href')).toContain(businessDelivery);


        //edit schedule
        element(by.id("business-btn-schedule-edit")).click();
        element(by.css(".editable tr:nth-child(2) td:nth-child(14) button")).click();
        element(by.css(".editable tr:nth-child(2) td:nth-child(15) button")).click();
        element(by.css(".editable tr:nth-child(2) td:nth-child(16) button")).click();
        element(by.css(".editable tr:nth-child(2) td:nth-child(17) button")).click();


        element(by.id("schedule-edit-btn-attendance-moderate")).click();
        element(by.css(".editable tr:nth-child(4) td:nth-child(14) button")).click();
        element(by.css(".editable tr:nth-child(4) td:nth-child(15) button")).click();
        element(by.css(".editable tr:nth-child(4) td:nth-child(16) button")).click();
        element(by.css(".editable tr:nth-child(4) td:nth-child(17) button")).click();
        closeModal("basic-modal-btn-save");

        var lightTotal = 0, moderateTotal = 0;

        expect(element.all(by.css(".attendance-light")).count()).toEqual(4);
        expect(element.all(by.css(".attendance-moderate")).count()).toEqual(4);

        //edit gallery
        browser.executeScript('window.scrollTo(0,0);');
        browser.waitForAngular();
        element(by.id("welcome-btn-gallery-edit")).click();

        var fileToUpload1 = path.resolve(__dirname, 'img/1.jpg'),
            fileToUpload2 = path.resolve(__dirname, 'img/2.jpg');

        $('input[type="file"]').sendKeys(fileToUpload1);
        $('input[type="file"]').sendKeys(fileToUpload2);
        closeModal("basic-modal-btn-save");

        expect(element.all(by.css(".gallery-picture")).count()).toEqual(2);
        element(by.css(".gallery-picture")).click();

        expect(element(by.id("gallery-modal-span-number-page")).getText()).toContain('1 / 2');

        element(by.id("gallery-modal-btn-next")).click();
        element(by.id("gallery-modal-btn-next")).click();
        element(by.id("gallery-modal-btn-previous")).click();
        element(by.id("gallery-modal-btn-previous")).click();
        element(by.name("modal-btn-close")).click();
        browser.waitForAngular();
        //scroll
        browser.executeScript('window.scrollTo(0,0);');
        browser.waitForAngular();

        //publish
        element(by.id("business-btn-publish")).click();
        element(by.id("modal-message-btn-valid")).click();

        //switch to admin interface
        browser.get(adminTarget);

        //login with admin
        writeField('email', adminEmail);
        writeField('password', adminPassword);
        element(by.id('login-modal-btn-save')).click();
        element(by.css('.messenger-close')).click();

        //accept business request
        element(by.id('admin-welcome-btn-to-business-list')).click();
        element(by.name('admin-business-btn-confirm-publication')).click();
        element(by.id("modal-message-btn-valid")).click();

        //logout, login with business, to go commerce page
        browser.get(target);
        element(by.id('dropdownMenu1')).click();
        element(by.id('welcome-btn-logout')).click();
        element(by.id('welcome-btn-login')).click();
        writeField('email', businessAccountEmail);
        writeField('password', businessAccountPassword);

        //login
        element(by.id('login-modal-btn-save')).click();
        element(by.css('.messenger-close')).click();
        //navigate to business
        element(by.id('dropdownMenu1')).click();
        element(by.id('welcome-btn-business')).click();

        //edit data editable

        //control non-editable option

        //create a publication
        element(by.id('business-btn-promotion-add')).click();
        writeField('title', promotionTitle);
        writeField('description', promotionDescription);
        writeField('endDate', promotionEndDate);
        writeField('quantity', promotionQuantity);
        writeField('originalPrice', promotionOriginalPrice);
        writeField('offPercent', promotionOffPercent);
        var landscapeToUpload = path.resolve(__dirname, 'img/couronne.jpg');
        $('input[type="file"]').sendKeys(landscapeToUpload);
        closeModal("promotion-modal-btn-save");

        browser.pause();

        //edit (?)

        //create a promotion

        //edit (?)

        //cancel page publication

        //try to edit something

        //try to find publication and business, test result


    });
});