/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author c0647015
 */
public class login {

    private String username;
    private String password;
    private String errorMsg;

    public login() {
        username = "";
        password = "";
        errorMsg = "";
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public static boolean checkLogin(String username, String password) {
        boolean res = false;
        if ("admin".equals(username) && "admin".equals(password)) {
            res = true;
        }
        return res;
    }
}
