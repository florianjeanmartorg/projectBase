package be.lynk.server.util.message;

/**
 * Created by florian on 11/11/14.
 */
public enum EmailMessageEnum {
    FOOTER("--.email.default.footer"),
    FORGOT_PASSWORD_BODY("--.email.forgotPassword.body"),
    FORGOT_PASSWORD_SUBJECT("--.email.forgotPassword.subject"),
    REGISTRATION_BUSINESS_SUBJECT("--.email.registration.business.subject"),
    REGISTRATION_BUSINESS_BODY("--.email.registration.business.body"),
    REGISTRATION_CUSTOMER_SUBJECT("--.email.registration.customer.subject"),
    REGISTRATION_CUSTOMER_BODY("--.email.registration.customer.body"),
    PUBLICATION_EDIT_BY_ADMIN_SUBJECT("--.publication.editByAdmin.email.subject"),
    PUBLICATION_EDIT_BY_ADMIN_BODY("--.publication.editByAdmin.email.body");

    private final String key;

    EmailMessageEnum(String key) {
        this.key = key;
    }

    public String getKey() {
        return key;
    }

}
