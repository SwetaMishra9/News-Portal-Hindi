<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%

System.out.println("JSP PAGE FOR GET PHOTO");
Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/hindi_portal";
ResultSet rs = null;
PreparedStatement psmnt = null;  
                         
               try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
connection = DriverManager.getConnection(connectionURL, "root", "admin");
                        //HttpSession session=req.getSession(true);
                        //String id="1";//(String)session.getAttribute("nid");
                       //int idn=Integer.parseInt(id);
					   int idn=2;
                           //int a=13;
 psmnt= connection.prepareStatement("select * from main_img1  where id= ?");
psmnt.setInt(1,idn);
rs=psmnt.executeQuery();

if(rs.next())
{
Blob photo=rs.getBlob("image");
byte[] imgData=photo.getBytes(1,(int)photo.length());
 response.setContentType("image/gif");
OutputStream o=response.getOutputStream();
o.write(imgData);
o.flush();
o.close();

}
}catch(Exception e)
{
System.out.println("ggg"+e);
}
%>