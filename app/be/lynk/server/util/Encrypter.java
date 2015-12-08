package be.lynk.server.util;

import org.jasypt.util.password.StrongPasswordEncryptor;

/**
 * Created by florian on 3/05/15.
 */
public class Encrypter {


    public static String generateEncryptingPassword(final String password) {

        return new StrongPasswordEncryptor().encryptPassword(password);
    }
}
