package sessioncheck;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author RDRL
 */


import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class SessionCheckFilter implements Filter{
    private String contextPath;
    @Override
    public void init(FilterConfig fc) throws ServletException {
        contextPath = fc.getServletContext().getContextPath();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain fc) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;   
        
        if (req.getSession().getAttribute("LOGIN_USER") == null) { //checks if there's a LOGIN_USER set in session...
        res.sendRedirect(contextPath + "/sign_in.jsp"); //or page where you want to redirect
        }else{
            String userType = (String) req.getSession().getAttribute("LOGIN_USER");
        if (!userType.equals("user")){ //check if user type is not user
            res.sendRedirect(contextPath + "/login.jsp"); //or page where you want to  
        }
        fc.doFilter(request, response);
    }
        }
    

    @Override
    public void destroy(){
        //do nothing
    }
    
}
