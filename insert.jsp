<%@ page import="java.sql.*,java.io.*"%>

<%@page pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="db" class="mybean.Dbcon" />
<%
db.mkcon();

  String contect= request.getParameter("content");
  // content=request.getCharacterEncoding("content");

  
//out.println(contect);

int upd=db.dbupdate("insert into hindi_table (hindi_content) value('"+contect+"')");
if(upd>0)
{
//out.println("value updated");
response.sendRedirect("reterive.jsp");
}

%>