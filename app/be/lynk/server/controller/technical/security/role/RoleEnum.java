package be.lynk.server.controller.technical.security.role;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by florian on 18/04/15.
 */
public enum RoleEnum {

    USER,
    OPERATOR(),
    SUPERADMIN(OPERATOR);


    private List<RoleEnum> children;

    RoleEnum(RoleEnum... children) {
        this.children = new ArrayList<>();
        for (RoleEnum child : children) {
            this.children.add(child);
        }
    }

    public List<RoleEnum> getChildren() {
        return children;
    }
}
