<%-- 
    Document   : upload_handler
    Created on : May 5, 2017, 2:32:47 AM
    Author     : RDRL
--%>

<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String saveFile=new String();
            String contentType=request.getContentType();
            
            Connection myCon=null;
            PreparedStatement statement=null;
            ResultSet rs=null;
            
            String s=session.getAttribute("username").toString();
            long cur_size;
            try{
            
            Class.forName("com.mysql.jdbc.Driver");
            myCon=DriverManager.getConnection("jdbc:mysql://localhost:3306/cloud_storage","root","");
            statement=myCon.prepareStatement("SELECT cur_size FROM users WHERE username=?");
            statement.setString(1, s);
            rs=statement.executeQuery();
            rs.next();
            cur_size=(long)rs.getInt("cur_size");
            }catch(Exception e){
               out.print("Some error occurred, try again :(");
               out.print(e);
               out.print(" "+s);
               return;
            }
            
            if((contentType!=null) && (contentType.indexOf("multipart/form-data"))>=0){
                DataInputStream in=new DataInputStream(request.getInputStream());
                
                int formDataLength=request.getContentLength();
                byte[] dataBytes=new byte[formDataLength];
                int byteRead=0;
                int totalBytesRead=0;
                
                while(totalBytesRead<formDataLength){
                    byteRead=in.read(dataBytes,totalBytesRead,formDataLength);
                    totalBytesRead+=byteRead;
                }
                String file=new String(dataBytes);
                saveFile=file.substring(file.indexOf("filename=\"")+10);
                saveFile=saveFile.substring(0,saveFile.indexOf("\n"));
                saveFile=saveFile.substring(saveFile.lastIndexOf("\\")+1,saveFile.indexOf("\""));
                
                int lastIndex=contentType.lastIndexOf("=");
                
                String boundary=contentType.substring(lastIndex+1,contentType.length());
                
                int pos;
                
                pos=file.indexOf("filename=\"");
                pos=file.indexOf("\n",pos)+1;
                pos=file.indexOf("\n",pos)+1;
                pos=file.indexOf("\n",pos)+1;
                
                int boundaryLocation=file.indexOf(boundary,pos)-4;
                int startPos=((file.substring(0,pos)).getBytes()).length;
                int endPos=((file.substring(0, boundaryLocation)).getBytes()).length;
                double size=endPos-startPos+1;
                long sizeOfFile=(long)(size*0.000001);
                if(sizeOfFile>(1024-cur_size)){
                    out.print("Capacity exceeded");
                    return;
                }
                
                
                //FOR ENCRYPTION
                
                BigInteger one=new BigInteger("1");;
                SecureRandom random=new SecureRandom();
    
                BigInteger privateKey;
                BigInteger publicKey;
                BigInteger modulus;
                int n=512;
                BigInteger p=BigInteger.probablePrime(n/2, random);
                 BigInteger q=BigInteger.probablePrime(n/2, random);
                BigInteger phi=(p.subtract(one)).multiply(q.subtract(one));
        
                modulus=p.multiply(q);
                publicKey=new BigInteger("65537");
                privateKey=publicKey.modInverse(phi);
                
                
                
                
                saveFile="D:/cloud/"+session.getAttribute("username")+"/"+saveFile;
                File ff=new File(saveFile);
                try{
                    dataBytes=Arrays.copyOfRange(dataBytes,startPos,(endPos-startPos));
                    dataBytes=encrypt(dataBytes,privateKey,modulus);
                    FileOutputStream fileOut=new FileOutputStream(ff);
                    fileOut.write(dataBytes);//,startPos,(endPos-startPos)
                    fileOut.flush();
                    fileOut.close();
                    long x=sizeOfFile+cur_size;
                    statement=myCon.prepareStatement("UPDATE users SET cur_size="+x+ " WHERE username=?");
                    statement.setString(1, s);
                    statement.executeUpdate();
                }catch(Exception e){
                    out.println(e);
                    out.print("ERROR");
                    return;
                }
                out.print("Uploaded successfully");
            }
        %>
        <%!
            byte[] encrypt(byte[] message,BigInteger privateKey,BigInteger modulus){
            BigInteger msg=new BigInteger(message);
            return msg.modPow(privateKey, modulus).toByteArray();
            }
        %>
    </body>
</html>
