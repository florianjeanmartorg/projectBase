package be.lynk.server.dto.externalDTO;

import be.lynk.server.dto.technical.DTO;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by florian on 13/11/15.
 */
public class ParseNotificationDTO extends DTO {

    private Data data = new Data();

    private List<String> channels = new ArrayList<>();

    public Data getData() {
        return data;
    }

    public void setData(Data data) {
        this.data = data;
    }

    public List<String> getChannels() {
        return channels;
    }

    public void setChannels(List<String> channels) {
        this.channels = channels;
    }

    public static class Data {
        private String alert;
        private String title;

        public String getAlert() {
            return alert;
        }

        public void setAlert(String alert) {
            this.alert = alert;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }
    }
}
