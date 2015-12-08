package be.lynk.server.dto;

import be.lynk.server.dto.technical.DTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by florian on 29/12/14.
 */
public class InterfaceDataDTO extends DTO  {

    private AccountDTO mySelf;

    private TranslationsDTO translations;

    private String langId;

    private List<LangDTO> languages;

    private String appId;

    private String fileBucketUrl;
    private String urlBase;

    private String projectLastVersion;
    private String addStatus;

    private Map<String, String> constants = new HashMap<>();
    private boolean isMobile;

    public InterfaceDataDTO() {
    }

    public Map<String, String> getConstants() {
        return constants;
    }

    public void setConstants(Map<String, String> constants) {
        this.constants = constants;
    }

    public String getProjectLastVersion() {
        return this.projectLastVersion;
    }

    public void setProjectLastVersion(String projectLastVersion) {
        this.projectLastVersion = projectLastVersion;
    }

    public String getFileBucketUrl() {
        return fileBucketUrl;
    }

    public void setFileBucketUrl(String fileBucketUrl) {
        this.fileBucketUrl = fileBucketUrl;
    }

    public List<LangDTO> getLanguages() {
        return languages;
    }

    public void setLanguages(List<LangDTO> languages) {
        this.languages = languages;
    }

    public String getLangId() {
        return langId;
    }

    public void setLangId(String langId) {
        this.langId = langId;
    }

    public AccountDTO getMySelf() {
        return mySelf;
    }

    public void setMySelf(AccountDTO mySelf) {
        this.mySelf = mySelf;
    }

    public TranslationsDTO getTranslations() {
        return translations;
    }

    public void setTranslations(TranslationsDTO translations) {
        this.translations = translations;
    }


    public void addLanguage(LangDTO language) {
        if(languages == null){
            languages = new ArrayList<>();
        }
        languages.add(language);
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getAppId() {
        return appId;
    }

    public void setUrlBase(String urlBase) {
        this.urlBase = urlBase;
    }

    public String getUrlBase() {
        return urlBase;
    }

    public void setAddStatus(String addStatus) {
        this.addStatus = addStatus;
    }

    public String getAddStatus() {
        return addStatus;
    }

    public void setIsMobile(boolean isMobile) {
        this.isMobile = isMobile;
    }

    public boolean isMobile() {
        return isMobile;
    }

    public void setMobile(boolean isMobile) {
        this.isMobile = isMobile;
    }

    @Override
    public String toString() {
        return "InterfaceDataDTO{" +
                "mySelf=" + mySelf +
                ", translations=" + translations +
                ", langId='" + langId + '\'' +
                ", languages=" + languages +
                ", appId='" + appId + '\'' +
                ", fileBucketUrl='" + fileBucketUrl + '\'' +
                ", urlBase='" + urlBase + '\'' +
                ", projectLastVersion='" + projectLastVersion + '\'' +
                ", addStatus='" + addStatus + '\'' +
                ", constants=" + constants +
                ", isMobile=" + isMobile +
                "} " + super.toString();
    }
}
