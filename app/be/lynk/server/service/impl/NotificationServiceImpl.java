
package be.lynk.server.service.impl;

import be.lynk.server.dto.externalDTO.ParseNotificationDTO;
import be.lynk.server.model.entities.Account;
import be.lynk.server.service.NotificationService;
import be.lynk.server.service.TranslationService;
import be.lynk.server.util.httpRequest.HttpRequest;
import be.lynk.server.util.httpRequest.HttpRequestException;
import be.lynk.server.util.message.NotificationMessageEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import play.Configuration;
import play.i18n.Lang;
import play.libs.F;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by florian on 13/11/15.
 */
@Service
public class NotificationServiceImpl implements NotificationService {


    private static final String PARSE_PUSH_PATH = "https://api.parse.com/1/push";
    private String appStatus = Configuration.root().getString("app.status");

    @Autowired
    private TranslationService translationService;

    @Override
    public void sendNotification(NotificationMessage title, NotificationMessage content, List<Account> accounts) {

        if (appStatus.equals("PROD")) {

            F.Promise.promise(() -> {


                Map<String, String> headers = new HashMap<>();
                headers.put("X-Parse-Application-Id", "qUEDet4Q24JkiXhWTELqJFHeZ6bbvEcLw6WfXy5p");
                headers.put("X-Parse-REST-API-Key", "rsqv85DLrSbfpsBcWVv5605FPRMniQKDnzWx68Kp");


                //sort account by language
                for (Lang lang : Lang.availables()) {

                    ParseNotificationDTO parseNotificationDTO = new ParseNotificationDTO();

                    for (Account account : accounts.stream().filter((a) -> a.getLang().equals(lang)).collect(Collectors.toList())) {
                        parseNotificationDTO.getChannels().add("user" + account.getId());
                    }
                    if (parseNotificationDTO.getChannels().size() > 0) {

                        //load translation for key
                        String titleS, contentS;
                        if (title.notificationMessage != null) {
                            titleS = translationService.getTranslation(title.notificationMessage, lang, title.objects);
                        } else {
                            titleS = title.message;
                        }
                        if (content.notificationMessage != null) {
                            contentS = translationService.getTranslation(content.notificationMessage, lang, content.objects);
                        } else {
                            contentS = content.message;
                        }
                        parseNotificationDTO.getData().setAlert(contentS);
                        parseNotificationDTO.getData().setTitle(titleS);
                    }

                    HttpRequest httpRequest = new HttpRequest(HttpRequest.RequestMethod.POST, PARSE_PUSH_PATH);
                    httpRequest.setDto(parseNotificationDTO);
                    httpRequest.setHeader(headers);
                    try {
                        httpRequest.sendRequest();
                    } catch (HttpRequestException e) {
                        e.printStackTrace();
                    }
                }
                return null;
            });
        }

    }

    public static final class NotificationMessage {

        private String message;

        private NotificationMessageEnum notificationMessage;

        private Object[] objects;

        public NotificationMessage(String message) {
            this.message = message;
        }

        public NotificationMessage(NotificationMessageEnum notificationMessage, Object... objects) {
            this.notificationMessage = notificationMessage;
            this.objects = objects;
        }
    }

}
