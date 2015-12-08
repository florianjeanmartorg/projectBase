package be.lynk.server.controller.technical.security.annotation;
//

import be.lynk.server.controller.technical.security.CommonSecurityController;
import be.lynk.server.controller.technical.security.role.RoleEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import play.libs.F;
import play.mvc.Action;
import play.mvc.Http;
import play.mvc.SimpleResult;

@Service
public class SecurityAnnotationAction extends Action<SecurityAnnotation> {

    //controllers
    @Autowired
    protected CommonSecurityController securityController;


    @Override
    public F.Promise<SimpleResult> call(final Http.Context context) throws Throwable {

        if (securityController.isAuthenticated(context)) {
            RoleEnum role = securityController.getCurrentUser().getRole();
            RoleEnum expectedRole = configuration.role();
            if (testChildren(expectedRole, role)) {
                return delegate.call(context);

            }

        }

        return F.Promise.promise(new F.Function0<SimpleResult>() {
            @Override
            public SimpleResult apply() throws Throwable {
                return securityController.onUnauthorized(context);
            }
        });
    }

    private boolean testChildren(RoleEnum expectedRole, RoleEnum userRole) {
        if (userRole.equals(expectedRole)) {
            return true;
        }
        if (userRole.getChildren().size() > 0) {
            for (RoleEnum roleEnum : userRole.getChildren()) {
                if (testChildren(expectedRole, roleEnum)) {
                    return true;
                }
            }

        }
        return false;
    }
}