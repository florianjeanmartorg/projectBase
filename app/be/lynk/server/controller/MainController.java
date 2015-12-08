package be.lynk.server.controller;

import be.lynk.server.controller.rest.LoginRestController;
import be.lynk.server.controller.technical.AbstractController;
import be.lynk.server.dto.InterfaceDataDTO;
import be.lynk.server.service.SessionService;
import be.lynk.server.util.AppUtil;
import org.springframework.beans.factory.annotation.Autowired;
import play.db.jpa.Transactional;
import play.mvc.Result;

import java.io.File;


/**
 * Created by florian on 23/03/15.
 */
@org.springframework.stereotype.Controller
public class MainController extends AbstractController {

    @Autowired
    private LoginRestController loginRestController;
    @Autowired
    private SessionService sessionService;

    /**
     * access to resource from external
     *
     * @param path
     * @param file
     * @return
     */
    public Result externalPath(String path, String file) {
        response().setHeader("Access-Control-Allow-Origin", "*");
        response().setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE");
        response().setHeader("Access-Control-Max-Age", "3600");
        response().setHeader("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization, X-Auth-Token");
        response().setHeader("Access-Control-Allow-Credentials", "true");
        return ok(new File(path + file));
    }


    @Transactional
    public Result admin(String url) {

        String facebookAppId = AppUtil.getFacebookAppId();

        //try with param
        InterfaceDataDTO interfaceDataDTO = generateInterfaceDTO(false);


        return ok(be.lynk.server.views.html.template_admin.render(getAvaiableLanguage(), interfaceDataDTO));
    }

    @Transactional
    public Result mainPage(String url) {
        return generateDefaultPage(url, false);
    }

    public Result generateDefaultPage(String url, boolean forceMobile) {

        if (url != null && url.equals("app")) {
            return redirect("market://details?id=" + APP_PACKAGE_NAME);
        }

        boolean isMobile = (isMobileDevice() || forceMobile) && mobileDisabled == null;


        InterfaceDataDTO interfaceDataDTO = generateInterfaceDTO(isMobile);


        initialization();


        //try with param
        return ok(be.lynk.server.views.html.template.render(getAvaiableLanguage(), interfaceDataDTO));


    }
}
