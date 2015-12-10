package be.lynk.server.dto.technical;

import be.lynk.server.controller.technical.security.source.SourceEnum;
import be.lynk.server.util.exception.MyRuntimeException;
import be.lynk.server.util.message.ErrorMessageEnum;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import play.Logger;
import play.mvc.Content;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by florian on 10/11/14.
 */
@JsonIgnoreProperties(ignoreUnknown = true,value = {"parsingDate"})
public class DTO implements Content{

    @javax.persistence.Id
    @JsonIgnoreProperties
    protected Date parsingDate = new Date();

    @JsonIgnoreProperties
    protected Map<String, String> requestParams = new HashMap<>();

    @JsonIgnoreProperties
    protected String sessionId;

    @JsonIgnoreProperties
    @Enumerated(value = EnumType.STRING)
    private SourceEnum device;

    @JsonIgnoreProperties
    protected Long currentAccountId;


    private String __type;
    private String __class;

    public static <T extends DTO> T getDTO(JsonNode data, Class<T> type) {

        if (data != null) {
            ObjectMapper mapper = new ObjectMapper();
            JsonParser jp = data.traverse();
            try {
                T dto = mapper.readValue(jp, type);

                if (dto == null) {
                    Logger.error("ERROR into DTO convertion : DTO is null");
                    throw new MyRuntimeException(ErrorMessageEnum.JSON_CONVERSION_ERROR);
                }

                //dto.validate();
                return dto;

            } catch (IOException e) {
                Logger.error("ERROR into DTO convertion : " + data.asText());
                e.printStackTrace();
                throw new MyRuntimeException(ErrorMessageEnum.JSON_CONVERSION_ERROR);
            }
        }
        Logger.error("ERROR into DTO convertion : Data is null");
        throw new MyRuntimeException(ErrorMessageEnum.JSON_CONVERSION_ERROR);
    }

    public String get__type() {
        return this.getClass().getCanonicalName();
    }

    public void set__type(String __type) {
//        if (!get__type().equals(__type)) {
//            throw new MyRuntimeException(ErrorMessageEnum.FATAL_ERROR, get__type()+" instead of "+__type);
//        }
    }

    @Override
    public String body() {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.writeValueAsString(this);
        } catch (JsonProcessingException e) {
            throw new MyRuntimeException(ErrorMessageEnum.FATAL_ERROR, e.getMessage());
        }
    }

    @Override
    public String contentType() {
        return "application/json; charset=utf-8";
    }


    public Date getParsingDate() {
        return parsingDate;
    }

    public void setParsingDate(Date parsingDate) {
        this.parsingDate = parsingDate;
    }

    public Long getCurrentAccountId() {
        return currentAccountId;
    }

    public void setCurrentAccountId(Long currentAccountId) {
        this.currentAccountId = currentAccountId;
    }

    public Map<String, String> getRequestParams() {
        return requestParams;
    }

    public void setRequestParams(Map<String, String> requestParams) {
        this.requestParams = requestParams;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public void setDevice(SourceEnum device) {
        this.device = device;
    }

    public SourceEnum getDevice() {
        return device;
    }
}
