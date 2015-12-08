package be.lynk.server.util.message;

/**
 * Created by florian on 11/11/14.
 */
public enum ErrorMessageEnum {

    WRONG_AUTHORIZATION("--.error.wrong_authorization"),
    NOT_CONNECTED("--.error.not_connected"),
    EMAIL_ALREADY_USED("--.error.email_already_used"),
    FATAL_ERROR("--.error.fatal_error"),
    JSON_CONVERSION_ERROR("--.error.json_conversion_error"),
    VALIDATION_SIZE("--.error.validation.size"),
    VALIDATION_NOT_NULL("--.error.validation.not_null"),
    VALIDATION_PATTERN("--.error.validation.pattern"),
    VALIDATION_EMAIL("--.error.validation.email"),
    VALIDATION_PASSWORD("--.error.validation.password"),
    NOT_YOUR_OLD_PASSWORD("--.error.wrong_old_password"),
    FACEBOOK_AUTHENTICATION_FAIL("--.error.facebook.authentication_fail"),
    WRONG_PASSWORD_OR_LOGIN("--.error.wrong_password_or_login"),
    FACEBOOK_FUSION_DIFFERENT_ACCOUNT_TYPE("--.error.facebookFusion.differentAccountType"),
    FACEBOOK_NOT_ACCOUNT_FOUND("--.error.facebook.notAccountFound"),
    EMAIL_UNKNOWN("--.error.account.emailUnknown"),
    ACCOUNT_WITHOUT_LOGIN_CREDENTIAL("--.error.account.withoutLoginCredential"),
    GOOGLE_MAP_ERROR("--.error.googleMap"),
    WRONG_ADDRESS("--.error.wrongAddress"),
    BUSINESS_MUST_BE_PUBLISHED("--.error.business.mustBePublished"),
    SEARCH_WRONG_CRITERIA("--.error.search.wrongCriteria"),
    WRONG_ADDRESS_NAME_ALREADY_USED("--.error.address.nameAlreadyUsed"),
    WRONG_ADDRESS_NAME("--.error.address.nameNotExists"),
    WRONG_OLD_PASSWORD("--.error.address.wrongOldPassword"),
    ADDRESS_WRONG_NAME_TECHNICAL_NAME("--.error.address.TechnicalName"),
    ERROR_CONTACT_NO_EMAIL("--.error.contact.no.email"),
    ERROR_PROMOTION_DURATION_TOO_LONG("--.error.promotion.duration.tooLong"),
    ERROR_NOTIFICATION_DURATION_TOO_LONG("--.error.notification.duration.tooLong"),
    ERROR_PUBLICATION_TOO_MUCH_TODAY("--.error.promotion.TooMuchToday"),
    ERROR_PUBLICATION_STARTDATE_BEFORE_NOW("--.error.publication.startDateBeforeNow"),
    ERROR_BUSINESS_HIDDEN_AND_NOT_MINE("--.error.business.hiddenAndNotMine"),
    ERROR_NOT_YOUR_BUSINESS("--.error.business.notYours"),
    ERROR_PICTURE_WRONG_SIZE("--.error.picture.wrongSize"),
    ERROR_PICTURE_WRONG_SIZE_Y("--.error.picture.wrongSizeY"),
    ERROR_PICTURE_WRONG_SIZE_X("--.error.picture.wrongSizeX"),
    ERROR_NOT_BUSINESS_ACCOUNT("--.error.businessApplication.notBusinessAccount"),
    ERROR_CUSTOMER_TO_BUSINESS_ALREADY_BUSINESS("--.error.customerToBusiness.alreadyBusiness"),
    FACEBOOK_NO_EMAIL("--.error.facebook.neededInformationEmpty"),
    ERROR_LOGIN_FACEBOOK_LINK_ALREADY_USED("--.error.login.facebookLink.alreadyUsed"),
    ERROR_LOGIN_FACEBOOK_LINK_ALREADY_LINKED("--.error.login.facebookLink.alreadyLinked"),
    ERROR_FACEBOOK_IMPORT_NOT_OFFICIAL_PAGE("--.error.facebook.import.notOfficialPage"),
    ERROR_FACEBOOK_IMPORT_WRONG_URL("--.error.facebook.import.wrongUrl"),
    ERROR_BUSINESS_CLAIM_ALREADY_HAVE_BUSINESS("--.error.business.claim.alreadyHaveBusiness"),
    ERROR_BUSINESS_CLAIM_ALREADY_HAVE_CLAIMS("--.error.business.claim.alreadyHaveClaims"),
    ERROR_REGISTRATION_IMPORT_FACEBOOK("--.error.registration.import.facebook"),
    ERROR_CONFIRM_CLAIM_BUSINESS_NOT_CLAIMED("--.error.confirmClaim.notClaimed"),
    ERROR_CONFIRM_CLAIM_BUSINESS_NOT_PUBLISHED("--.error.confirmClaim.businessNotPublished");

    private final String key;

    ErrorMessageEnum(String key) {
        this.key = key;
    }

    public String getKey() {
        return key;
    }

}
