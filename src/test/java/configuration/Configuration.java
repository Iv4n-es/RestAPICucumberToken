package configuration;

import java.util.Base64;
public class Configuration {

    public static final String HOST="http://todo.ly/";
    //  user:pwd ---> Basic base64
    //public static String BASIC_AUTHENTICATION;//="Basic dWNiQHVjYi5jb206dWNiMTIz";
    public static final String BASIC_AUTHENTICATION_HEADER="Authorization";
    public static final String TOKEN_AUTHENTICATION_HEADER="Token";


    public static String getBasicAuthentication(String user, String pwd){
        String authString = user + ":" + pwd;
        String authStringEnc = Base64.getEncoder().encodeToString(authString.getBytes());
        return  "Basic "+authStringEnc;
    }
}
