package be.lynk.server.model;

/**
 * Created by florian on 24/05/15.
 */
public class Position {

    private Double x;

    private Double y;

    public Position() {
    }

    public Position(Double x, Double y) {
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
