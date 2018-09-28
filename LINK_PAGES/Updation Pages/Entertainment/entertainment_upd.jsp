<%@ page import="java.sql.*,java.io.*"%>

<%@page pageEncoding="UTF-8" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="hdb" class="mybean.HindiPortal" />
<%
hdb.mkcon();

  
  String news_about=request.getParameter("news_about");
    String news_topic=request.getParameter("news_topic");
	  String news_headline=request.getParameter("news_headline");
	   String news_desc=request.getParameter("news_desc");
  // content=request.getCharacterEncoding("content");

 // out.println("..............."+headabout+"................."+headline+".................."+headcontent);
//out.println(headabout);
int upd=hdb.dbupdate("insert into entertainment (News1,bolly_topic,bolly_headline,bolly_desc) values('"+news_about+"','"+news_topic+"','"+news_headline+"','"+news_desc+"')");
//int upd=hdb.dbupdate("update healines set name_of_headline='"+headabout+"' and headlines='"+headline+"' and desc_of_headlines='"+headcontent+"'");
if(upd>0)
{
  ResultSet rs=hdb.fetch("select news_id from entertainment where News1='"+news_about+"'");
  if(rs.next())
  {
    
    String id=rs.getString(1);
   
//out.println(id);
response.sendRedirect("entertainment_Img.jsp?id="+id);
}
}

%>