package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;

public final class create_005fuser_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Sign Up</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String email=request.getParameter("e_mail");
        if(username.length()<2||username.length()>15 || password.length()<6||password.length()>15 || email.length()<5||email.length()>30){
            out.print("Username must be between 2 to 15 characters long, Password must be between 6 to 15 characters long, E-mail must be between 5 to 30 characters long");
            return;
        }
        Connection myCon=null;
        PreparedStatement statement=null;
        ResultSet rs=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            myCon=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_storage","root","");
            statement=myCon.prepareStatement("INSERT INTO users(username,password,email_id,cur_size) VALUES (?,?,?,0);");
            
            statement.setString(1,username);
            statement.setString(2,password);
            statement.setString(3,email);
            
            statement.execute();
            myCon.close();
            File dir=new File("D:/cloud/"+username);
            boolean success=dir.mkdir();
            if(!success)throw new Exception();
            out.print("Signed up successfully");
        }catch(Exception e){
            out.print("Some error occurred, try again :(");
            out.print(e);
        }
        
        
      out.write("\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
