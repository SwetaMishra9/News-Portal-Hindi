
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->

<title>Untitled Document</title>
<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>

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
			 control.makeTransliteratable(['txtHindiContent1']);
			  control.makeTransliteratable(['txtHindiContent2']);
			  control.makeTransliteratable(['txtHindiContent3']);
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
<center><div style="border:0px solid #660033; height:400px; width:650px;">
<fieldset>
<legend><h2>Education News Update</h2></legend>
<form name="frm" action="Headline_upd.jsp" method="post">

    <table>
    <style>
	td{
	height:30px;
	}
	</style>
        <tr>
        <td>News about:</td><td><input type="text" value="" id="txtHindiContent" name="headlineabout" style="height:20px; line-height:8px; width:200px" /></td>
        </tr>
        <tr>
        <td>Topic of News:</td><td><input type="text" value="" id="txtHindiContent3" name="headlineabout" style="height:20px; line-height:8px; width:200px" /></td>
        </tr>
        <tr>
        <td style=" height:50px">Headlines of News :</td><td>
        <textarea name="headline"  id="txtHindiContent1" cols="39" rows="" ></textarea>
        <!--<input type="text" value="" id="txtHindiContent1" name="headline" style="height:20px; line-height:8px; width:200px"  />--></td>
        </tr>
        <tr>
            <td>Description of News :</td>
            <td style="height:90px">
            <textarea name="content"  id="txtHindiContent2" cols="39" rows="10"></textarea>

            </td>            
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

<!--<form name="form" action="#" method="post">
<table>
<tr>
<th>Related Images of Headline :</th><th><input type="file" name="images" value=""  /></th>
</tr>
</table>
</form>
</div></center>
<!--<div style="height:500px; width:900px; border:5px solid #666600; border-radius:2px; float:none; margin:auto; margin-top:100px ">

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

</div>-->

</body>
</html>












