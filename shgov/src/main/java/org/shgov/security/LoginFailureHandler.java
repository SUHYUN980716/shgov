package org.shgov.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler {
    
    private String loginidname;
    private String loginpwdname;
    private String errormsgname;
    private String defaultFailureUrl;
 
 
    public String getLoginidname() {
        return loginidname;
    }
 
    public void setLoginidname(String loginidname) {
        this.loginidname = loginidname;
    }
 
    public String getLoginpwdname() {
        return loginpwdname;
    }
 
    public void setLoginpwdname(String loginpwdname) {
        this.loginpwdname = loginpwdname;
    }
 
    public String getErrormsgname() {
        return errormsgname;
    }
 
    public void setErrormsgname(String errormsgname) {
        this.errormsgname = errormsgname;
    }
 
    public String getDefaultFailureUrl() {
        return defaultFailureUrl;
    }
 
    public void setDefaultFailureUrl(String defaultFailureUrl) {
        this.defaultFailureUrl = defaultFailureUrl;
    }
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception)
            throws IOException, ServletException {
        
        String username = request.getParameter(loginidname);
        String password = request.getParameter(loginpwdname);
        String errormsg = exception.getMessage();
        
        request.setAttribute(loginidname, username);
        request.setAttribute(loginpwdname, password);
        request.setAttribute(errormsgname, errormsg);
 
        request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
    }

}

