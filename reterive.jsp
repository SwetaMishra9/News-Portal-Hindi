
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

<title>Untitled Document</title>
<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="db" class="mybean.Dbcon" />

    <script type="text/javascript" src="https://www.google.com/jsapi?key=YourKeyHere">
    </script>
    <script language="javascript" type="text/javascript">
        google.load("elements", "1", {
            packages: "transliteration"
        });
 
        function onLoad() {
            var options = {
                sourceLanguage: google.elements.transliteration.LanguageCode.ENGLISH,
                destinationLanguage: google.elements.transliteration.LanguageCode.HINDI, // available option English, Bengali, Marathi, Malayalam etc.
                shortcutKey: 'ctrl+g',
                transliterationEnabled: true
            };
 
            var control = new google.elements.transliteration.TransliterationControl(options);
            control.makeTransliteratable(['txtHindiContent']);
        }
        google.setOnLoadCallback(onLoad);
 
    </script>
 
</head>

<body>
<h3>How to save and fetch data into/from sql server database in other language(hindi, bengali, malayalam etc)</h3>
<form name="frm" action="insert.jsp" method="post">
    <table>
        <tr>
            <td>Type in Hindi : </td>
            <td>
            <textarea name="content"  id="txtHindiContent" cols="39" rows="10"></textarea>

            </td>
        </tr>
        <tr>
            <td>
                </td>
            <td><input type="submit"   value="Save"  /></td>
        </tr>
       
    </table>
   
</form>
<br />
<br />
<br />
<table>
<tr><th>Hindi Content</th></tr>
<%
db.mkcon();

ResultSet rs=db.fetch("select * from hindi_table");
while(rs.next())
{


%>

<tr><th><%=rs.getString(2)%></th></tr>

<%}%>
</table>
</body>
</html>
