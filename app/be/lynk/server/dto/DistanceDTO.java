package be.lynk.server.dto;

import be.lynk.server.dto.technical.DTO;

/**
 * Created by florian on 29/06/15.
 */
public class DistanceDTO extends DTO  {

    private Long distance;

    public DistanceDTO() {
    }

    public DistanceDTO(Long distance) {
        this.distance = distance;
    }

    public Long getDistance() {
        return distance;
    }

    public void setDistance(Long distance) {
        this.distance = distance;
    }
}
