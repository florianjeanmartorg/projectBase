package be.lynk.server.dto;

import be.lynk.server.dto.technical.DTO;

/**
 * Created by florian on 17/05/15.
 */
public class BooleanDTO extends DTO  {
    private Boolean value;

    public BooleanDTO() {
    }

    public BooleanDTO(Boolean value) {
        this.value = value;
    }

    public Boolean getValue() {
        return value;
    }

    public void setValue(Boolean value) {
        this.value = value;
    }
}
