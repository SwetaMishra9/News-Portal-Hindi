<%@ page import="java.sql.*,java.io.*"%>

<%@page pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="hdb" class="mybean.HindiPortal" />
<%
hdb.mkcon();

  
  String headabout=request.getParameter("headlineabout");
    String headline=request.getParameter("headline");
	  String headcontent=request.getParameter("content");
  // content=request.getCharacterEncoding("content");

 out.println("..............."+headabout+"................."+headline+".................."+headcontent);

int upd=hdb.dbupdate("insert into healines (name_of_headline,headlines,desc_of_headlines) value('"+headabout+"','"+headline+"','"+headcontent+"')");
if(upd>0)
{
//out.println("value updated");
  ResultSet rs=hdb.fetch("select id from healines where headlines='"+headline+"'");
  if(rs.next())
  {
    
    String id=rs.getString(1);
	//out.println(""+id);
response.sendRedirect("Headline_Img.jsp?id="+id);
}
}
/*int upd=hdb.dbupdate("update healines set name_of_headline='"+headabout+"' and headlines='"+headline+"' and desc_of_headlines='"+headcontent+"'");
out.println("hello");
if(upd>0)
{
out.println("value updated");
//response.sendRedirect("Headline_Img.jsp");
}*/

%>