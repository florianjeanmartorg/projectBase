package be.lynk.server.dto;

import be.lynk.server.dto.technical.DTO;

/**
 * Created by florian on 24/05/15.
 */
public class PositionDTO extends DTO  {

    private Double x;

    private Double y;

    public PositionDTO() {
    }

    public PositionDTO(Double x, Double y) {
        this.x = x;
        this.y = y;
    }

    public Double getX() {
        return x;
    }

    public void setX(Double x) {
        this.x = x;
    }

    public Double getY() {
        return y;
    }

    public void setY(Double y) {
        this.y = y;
    }
}
