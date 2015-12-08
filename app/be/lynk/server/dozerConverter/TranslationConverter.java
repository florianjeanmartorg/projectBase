package be.lynk.server.dozerConverter;

import be.lynk.server.model.entities.Translation;
import be.lynk.server.model.entities.TranslationValue;
import org.dozer.CustomConverter;
import org.dozer.DozerConverter;
import play.i18n.Lang;
import play.mvc.Http;

/**
 * Created by florian on 20/07/15.
 */
public class TranslationConverter extends DozerConverter<Translation, String> implements CustomConverter {
    public TranslationConverter() {
        super(Translation.class, String.class);
    }

    @Override
    public String convertTo(Translation translation, String s) {

        String defaultText = null;
        String text = null;

        Lang lang = Http.Context.current().lang();
        for (TranslationValue translationValue : translation.getTranslationValues()) {
            if (translationValue.getLang().equals(lang)) {
                text = translationValue.getContent();
            }
            if (translationValue.getLang().equals(lang)) {
                defaultText = translationValue.getContent();
            }
        }
        if (text == null) {
            return defaultText;
        }
        return text;
    }

    @Override
    public Translation convertFrom(String s, Translation translation) {
        return null;
    }
}
