
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

<title>Untitled Document</title>
<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="hdb" class="mybean.Dbcon" />

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
			 control.makeTransliteratable(['txtHindiContent1']);
			  control.makeTransliteratable(['txtHindiContent2']);
        }
        google.setOnLoadCallback(onLoad);
 
    </script>


</head>

<body style="background-image: url(../../images/bg_gradient-noRepeat.jpg)">
<%


java.util.Calendar currentDate=new java.util.GregorianCalendar();
   int month=0;
   int day=0;
  month=currentDate.get(currentDate.MONTH)+1;
    day=currentDate.get(currentDate.DAY_OF_MONTH);
   int year=currentDate.get(currentDate.YEAR);
   String mo=Integer.toString(month);
   String days=Integer.toString(day);
   String d=Integer.toString(day);
   String yearss=Integer.toString(year);
   if(month<10)
   {
    mo="0"+mo;
   }
   
    if(day<10)
   {
    days="0"+days;
   }
   
    int hour = currentDate.get(currentDate.HOUR);
    int minute = currentDate.get(currentDate.MINUTE);
    int second = currentDate.get(currentDate.SECOND);
     String hours=Integer.toString(hour);
   String min=Integer.toString(minute);
 String sec=Integer.toString(second);
if(hour<10)
{
hours="0"+hours;
}
if(minute<10)
{
 min="0"+min;
}
if(second<10)
{
sec="0"+sec;
}
String cdate=days+"-"+mo+"-"+year;
String ctime=hours+":"+min+":"+sec;


%>
<style>
th{
   height:30px;
}
</style>
<center><div style="border:0px solid #660033; height:300px; width:650px;">
<%

   String id=request.getParameter("id");
   out.println("id......."+id);
%>
<fieldset>
<legend><h2>Image of Headline</h2></legend>

<form name="form" method="post" enctype="multipart/form-data" action="Headline_Img_Upd.jsp?id=<%=id%>">



    <table>
    <style>
	td{
	height:30px;
	}
	</style>
    <tr><td colspan="2"><center>Upload image's height and width should be 390px and 590px</center></td></tr>
        <tr>
        <td>Upload Image :</td><td>
        <input type="file" name="file" style="height:20px; line-height:8px; width:200px"  /> <input type="hidden" name="id" value="<%=id%>"></td>
        </tr>
       
       
        
        
         <tr>
        <td>Current Date of News:</td><td><input type="text" value="<%=cdate%>" id="date" name="cdate" readonly="readonly"  style="height:20px; line-height:8px; width:200px" /></td>
        </tr>
    
        <tr>
            
            <th colspan="2" style="height:60px"><input type="submit"   value="Save" style="height:30px; width:100px; border-radius:5px; background-color: #B0B0FF"  /></th>
        </tr>
       
    </table>

</form>
    
  </fieldset> 


</div>

</body>
</html>












