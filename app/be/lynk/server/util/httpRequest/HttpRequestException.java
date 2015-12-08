package be.lynk.server.util.httpRequest;

/**
 * Created by florian on 3/05/15.
 */
public class HttpRequestException  extends Exception{

    private static final long serialVersionUID = 1L;

    private final String toClientMessage;

    public HttpRequestException(String message) {
        super(message);
        toClientMessage = message;
    }

    public HttpRequestException(Throwable cause, String toClientMessage) {
        super(cause);
        this.toClientMessage = toClientMessage;
    }

    public String getToClientMessage() {
        return toClientMessage;
    }
}
