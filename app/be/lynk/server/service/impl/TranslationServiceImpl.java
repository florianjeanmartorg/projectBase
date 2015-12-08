package be.lynk.server.service.impl;

import be.lynk.server.dto.TranslationsDTO;
import be.lynk.server.model.entities.Translation;
import be.lynk.server.model.entities.TranslationValue;
import be.lynk.server.service.TranslationService;
import be.lynk.server.util.message.EmailMessageEnum;
import be.lynk.server.util.message.ErrorMessageEnum;
import be.lynk.server.util.message.NotificationMessageEnum;
import org.springframework.stereotype.Repository;
import play.Logger;
import play.api.Play;
import play.api.i18n.MessagesPlugin;
import play.db.jpa.JPA;
import play.i18n.Lang;
import play.i18n.Messages;
import scala.Option;
import scala.collection.JavaConverters;
import scala.collection.immutable.Map;

import java.util.Date;

/**
 * Created by florian on 11/11/14.
 */
@Repository
public class TranslationServiceImpl implements TranslationService {

    private static final String LANG_BASE = "fr";

    @Override
    public TranslationsDTO getTranslations(Lang lang) {

        long t = new Date().getTime();

        java.util.Map<String, String> m = new java.util.HashMap<>();

        if (lang != null) {
            Option<Map<String, String>> mapExpected = Play.current().plugin(MessagesPlugin.class).get().api().messages().get(lang.code());

            if (mapExpected.nonEmpty()) {
                //convert
                m.putAll(JavaConverters.mapAsJavaMapConverter(mapExpected.get()).asJava());
            }
        }

        if (!lang.code().equals(LANG_BASE)) {

            Option<Map<String, String>> mapDefaultLanguage = Play.current().plugin(MessagesPlugin.class).get().api().messages().get(LANG_BASE);

            java.util.Map<String, String> mapAsJavaDefault = JavaConverters.mapAsJavaMapConverter(mapDefaultLanguage.get()).asJava();

            for (java.util.Map.Entry<String, String> entry : mapAsJavaDefault.entrySet()) {
                if (!m.containsKey(entry.getKey())) {
                    m.put(entry.getKey(), entry.getValue());
                }
            }
        }

        for (java.util.Map.Entry<String, String> stringStringEntry : m.entrySet()) {
            stringStringEntry.setValue(stringStringEntry.getValue().replace("''", "'"));
        }

        Logger.info("TRANSLATION LOADING TIME : " + (new Date().getTime() - t));

        return new TranslationsDTO(m);
    }

    @Override
    public String getTranslation(NotificationMessageEnum notificationMessageEnum, Lang language, Object... params) {
        return translate(notificationMessageEnum.getKey(), language, params);
    }

    @Override
    public String getTranslation(ErrorMessageEnum errorMessage, Lang language, Object... params) {
        return translate(errorMessage.getKey(), language, params);
    }

    @Override
    public String getTranslation(String messageRef, Lang language, Object... params) {
        return translate(messageRef, language, params);
    }

    @Override
    public String getTranslation(EmailMessageEnum emailMessage, Lang language, Object... params) {
        return translate(emailMessage.getKey(), language, params);
    }

    @Override
    public String getTranslation(Translation translation, Lang language, Object... params) {
        String message = null;
        for (TranslationValue translationValue : translation.getTranslationValues()) {
            if (translationValue.getLang().equals(language)) {
                message = translationValue.getContent();
            }
        }

        if (message == null) {
            return "Message not found";
        }

        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                Object o = params[i];
                message = message.replace("{" + i + "}", o + "");

            }

        }
        return message;
    }

    @Override
    public void removeTranslationValue(Translation translation) {
        if (translation != null) {
            for (TranslationValue translationValue : translation.getTranslationValues()) {
                JPA.em().remove(JPA.em().find(TranslationValue.class, translationValue.getId()));
            }
            translation.getTranslationValues().clear();
        }
    }

    @Override
    public void removeTranslationValue(TranslationValue translation) {
        if (translation != null) {
            JPA.em().remove(translation);//JPA.em().find(TranslationValue.class, translation.getId()));

        }
    }

    private String translate(String key, Lang language, Object... params) {
        String message = Messages.get(language, key);

        if (params != null) {
            for (int i = 0; i < params.length; i++) {
                Object o = params[i];
                message = message.replace("{" + i + "}", o + "");
            }
        }
        return message;
    }
}
