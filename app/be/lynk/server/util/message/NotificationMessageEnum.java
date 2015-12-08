package be.lynk.server.util.message;

/**
 * Created by flo on 30/11/15.
 */
public enum NotificationMessageEnum {

    NEW_PROMOTION("--notification.message.newPublication"),
    NEW_BUSINESS_NOTIFICATION("--notification.message.newPublication");

    private final String key;

    NotificationMessageEnum(String key) {
        this.key = key;
    }

    public String getKey() {
        return key;
    }
}
