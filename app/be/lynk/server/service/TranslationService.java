package be.lynk.server.service;

import be.lynk.server.dto.TranslationsDTO;
import be.lynk.server.model.entities.Translation;
import be.lynk.server.model.entities.TranslationValue;
import be.lynk.server.util.message.EmailMessageEnum;
import be.lynk.server.util.message.ErrorMessageEnum;
import be.lynk.server.util.message.NotificationMessageEnum;
import play.i18n.Lang;

/**
 * Created by florian on 6/12/14.
 */
public interface TranslationService {

    TranslationsDTO getTranslations(Lang lang);

    String getTranslation(NotificationMessageEnum notificationMessageEnum, Lang language, Object... params);

    String getTranslation(ErrorMessageEnum errorMessage, Lang language, Object... params);

    String getTranslation(String messageRef, Lang language, Object... params);

    String getTranslation(EmailMessageEnum emailMessage, Lang language, Object... params);

    String getTranslation(Translation translation, Lang language, Object... params);

    void removeTranslationValue(Translation translationName);

    void removeTranslationValue(TranslationValue translation);

}
