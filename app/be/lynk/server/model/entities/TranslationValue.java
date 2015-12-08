package be.lynk.server.model.entities;

import be.lynk.server.model.entities.converter.I18NLangConverter;
import be.lynk.server.model.entities.technical.AbstractEntity;
import play.i18n.Lang;

import javax.persistence.*;

/**
 * Created by florian on 19/02/15.
 */
@Entity
public class TranslationValue extends AbstractEntity {

    @ManyToOne(fetch = FetchType.EAGER)
    private Translation translation;

    @Basic(optional = false)
    private String searchableContent;

    @Column(nullable = false, columnDefinition = "character varying(255) NOT NULL DEFAULT 'en'")
    @Convert(converter = I18NLangConverter.class)
    private Lang lang;

    @Column(columnDefinition = "TEXT")
    @Basic(optional = false)
    private String content;

    public TranslationValue() {
    }

    public TranslationValue(Translation translation, Lang lang, String content) {
        this.translation = translation;
        this.lang= lang;
        this.setContent(content);
    }

    public String getSearchableContent() {
        return searchableContent;
    }

    public void setSearchableContent(String searchableContent) {
        this.searchableContent = searchableContent;
    }

    public Translation getTranslation() {
        return translation;
    }

    public void setTranslation(Translation translation) {
        this.translation = translation;
    }

    public Lang getLang() {
        return lang;
    }

    public void setLang(Lang lang) {
        this.lang = lang;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
        this.searchableContent = normalize(content);
    }

    @Override
    public String toString() {
        return "Translation{" +
                "lang='" + lang+ '\'' +
                ", content='" + content + '\'' +
                '}';
    }


}
