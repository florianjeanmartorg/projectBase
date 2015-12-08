package be.lynk.server.util.exception;

import be.lynk.server.util.message.ErrorMessageEnum;

import java.util.Arrays;

/**
 * Created by florian on 10/11/14.
 */
public class MyRuntimeException  extends RuntimeException{

    private static final long serialVersionUID = 1L;
    private ErrorMessageEnum errorMessage=null;
    private Object[] params;

    public MyRuntimeException(ErrorMessageEnum errorMessage, Object... params) {
        super();

        this.errorMessage = errorMessage;
        this.params = params;
    }

    public MyRuntimeException(String message) {
        super(message);
    }

    public ErrorMessageEnum getErrorMessage() {
        return errorMessage;
    }

    public Object[] getParams() {
        return params;
    }

    @Override
    public String getMessage(){
        if(super.getMessage()!=null){
            return super.getMessage();
        }
        else if(errorMessage!=null){
            return errorMessage.name();
        }
        return "??";
    }

    @Override
    public String toString() {
        return "MyRuntimeException{" +super.toString()+","+
                "errorMessage=" + errorMessage +
                ", params=" + Arrays.toString(params) +
                '}';
    }

}

