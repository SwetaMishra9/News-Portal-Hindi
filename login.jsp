
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="hdb" class="mybean.HindiPortal" />
</head>

<body>
<%
   hdb.mkcon();
   String username=request.getParameter("usernme");
   String password=request.getParameter("userpass");
   
   out.println(".......user name ......."+username+"....................password........."+password);
   
   ResultSet rs=hdb.fetch("select * from login where userid='"+username+"' and password='"+password+"'");
   if(rs.next())
   {
     	//response.sendRedirect("reterive.jsp");
		System.out.println(" System connected ");
		response.sendRedirect("portal.jsp");
	 
   }
out.println("userid and password is wrong");

%>
</body>
</html>
