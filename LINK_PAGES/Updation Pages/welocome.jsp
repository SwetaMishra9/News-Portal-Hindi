
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
<div style="height:500px; width:900px; border:5px solid #666600; border-radius:2px; float:none; margin:auto; margin-top:100px ">

<div style="height:450px; width:500px; border:1px solid #666600; border-radius:2px; float: left; margin-left:20px; margin-top:18px ">

<form name="frm" action="../../newsupdate.jsp" method="post">
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


</div>
<div style="height:450px; width:340px; border:1px solid #666600; border-radius:2px; float: left; margin-left:20px;; margin-top:18px ">


<form name="form1" method="post" enctype="multipart/form-data" action="../../Photoupload.jsp"> 

<p> 
<input type="file" name="file"  /> 
</p> 
<p> 
<input type="submit" name="submit" value="submit" /> 
</p> 
</form> 

</div>

</div>

</body>
</html>












