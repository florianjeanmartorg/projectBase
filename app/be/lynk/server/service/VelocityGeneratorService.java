package be.lynk.server.service;

import java.util.Map;

/**
 * Created by florian on 3/12/14.
 */
public interface VelocityGeneratorService {

    String generate(String templateName, Map values);
}
