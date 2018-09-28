<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>हिंदी अखबार  : News Portal</title>

<link href="template.css" rel="stylesheet" type="text/css" />
<%@ page import="java.sql.*,java.io.*"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="hdb" class="mybean.HindiPortal" />



<link type='text/css' href='css/basic.css' rel='stylesheet' media='screen' />
  <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

    <script type="text/javascript" src="js/jssor.core.js"></script>
    <script type="text/javascript" src="js/jssor.utils.js"></script>
    <script type="text/javascript" src="js/jssor.slider.js"></script>
<script type='text/javascript' src='js/jquery1.js'></script>
<script type='text/javascript' src='js/jquery.simplemodal.js'></script>
<script type='text/javascript' src='js/basic.js'></script>
  <script>
        jQuery(document).ready(function ($) {
            //Reference http://www.jssor.com/development/slider-with-slideshow-jquery.html
            //Reference http://www.jssor.com/development/tool-slideshow-transition-viewer.html

            var _SlideshowTransitions = [
            //Fade in R
            {$Duration: 1200, x: -0.3, $During: { $Left: [0.3, 0.7] }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade out L
            , { $Duration: 1200, x: 0.3, $SlideOut: true, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            ];

            var options = {
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideDuration: 500,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $SlideshowOptions: {                                //[Optional] Options to specify and enable slideshow or not
                    $Class: $JssorSlideshowRunner$,                 //[Required] Class to create instance of slideshow
                    $Transitions: _SlideshowTransitions,            //[Required] An array of slideshow transitions to play slideshow
                    $TransitionsOrder: 1,                           //[Optional] The way to choose transition to play slide, 1 Sequence, 0 Random
                    $ShowLink: true                                    //[Optional] Whether to bring slide link on top of the slider when slideshow is running, default value is false
                },

                $BulletNavigatorOptions: {                                //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                       //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                    $SpacingX: 10,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                    $SpacingY: 10                                    //[Optional] Vertical space between each item in pixel, default value is 0
                },

                $ArrowNavigatorOptions: {
                    $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 2,                                //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                },

                $ThumbnailNavigatorOptions: {
                    $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $ActionMode: 0,                                 //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
                    $DisableDrag: true                              //[Optional] Disable drag or not, default value is false
                }
            };

            var jssor_sliderb = new $JssorSlider$("sliderb_container", options);
            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var parentWidth = jssor_sliderb.$Elmt.parentNode.clientWidth;
                if (parentWidth)
                    jssor_sliderb.$SetScaleWidth(Math.min(parentWidth, 390));
                else
                    window.setTimeout(ScaleSlider, 30);
            }

            ScaleSlider();

            if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
                $(window).bind('resize', ScaleSlider);
            }


            //if (navigator.userAgent.match(/(iPhone|iPod|iPad)/)) {
            //    $(window).bind("orientationchange", ScaleSlider);
            //}
            //responsive code end
        });
    </script>
  
<script language="javascript" type="text/javascript">
function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>
<script src="js/jquery.js"></script>

<style>
#slideshow { 
   
    position: relative; 
    width: 240px; 
    height: 240px; 
    padding: 10px; 
    box-shadow: 0 0 20px rgba(0,0,0,0.4); 
}

#slideshow > div { 
    position: absolute; 
    top: 10px; 
    left: 10px; 
    right: 10px; 
    bottom: 10px; 
}
#slideshow1 { 
   
    position: relative; 
    width: 240px; 
    height: 240px; 
    padding: 10px; 
    box-shadow: 0 0 20px rgba(0,0,0,0.4); 
}

#slideshow1 > div { 
    position: absolute; 
    top: 10px; 
    left: 10px; 
    right: 10px; 
    bottom: 10px; 
}
#slideshow2 { 
   
  position: relative; 
    width: 240px; 
    height: 240px; 
    padding: 10px; 
    box-shadow: 0 0 20px rgba(0,0,0,0.4); 
}

#slideshow2 > div { 
    position: absolute; 
    top: 10px; 
    left: 10px; 
    right: 10px; 
    bottom: 10px; 
}
#slideshow3 { 
   
   position: relative; 
    width: 240px; 
    height: 240px; 
    padding: 10px; 
    box-shadow: 0 0 20px rgba(0,0,0,0.4); 
}

#slideshow3 > div { 
    position: absolute; 
    top: 10px; 
    left: 10px; 
    right: 10px; 
    bottom: 10px; 
}

#slideshow4 { 
   
   position: relative; 
    width: 240px; 
    height: 240px; 
    padding: 10px; 
    box-shadow: 0 0 20px rgba(0,0,0,0.4); 
}

#slideshow4 > div { 
    position: absolute; 
    top: 10px; 
    left: 10px; 
    right: 10px; 
    bottom: 10px; 
}
</style>
<script>
$(document).ready( function() {
$("#slideshow > div:gt(0)").hide();

setInterval(function() { 
  $('#slideshow > div:first')
    .slideDown(2000)
    .next()
    .slideUp(2000)
    .end()
    .appendTo('#slideshow');
},  4000);


$("#slideshow1 > div:gt(0)").hide();

setInterval(function() { 
  $('#slideshow1 > div:first')
    .fadeOut(2000)
    .next()
    .fadeIn(2000)
    .end()
    .appendTo('#slideshow1');
},  4000);

$("#slideshow2 > div:gt(0)").hide();

setInterval(function() { 
  $('#slideshow2 > div:first')
    .fadeOut(2000)
    .next()
    .fadeIn(2000)
    .end()
    .appendTo('#slideshow2');
},  4000);

$("#slideshow3 > div:gt(0)").hide();

setInterval(function() { 
  $('#slideshow3 > div:first')
    .slideUp(2000)
    .next()
    .slideDown(2000)
    .end()
    .appendTo('#slideshow3');
},  4000);


$("#slideshow4 > div:gt(0)").hide();

setInterval(function() { 
  $('#slideshow4 > div:first')
    .slideUp(2000)
    .next()
    .slideDown(2000)
    .end()
    .appendTo('#slideshow4');
},  4000);
	});
</script>
</head>
<body>
<div style="max-width:1350px; min-height:35px; border:0px solid; background-image:url(images/templatmeo_body_top.jpg); background-repeat:repeat-x; background-position: right">

<div style="width:400px; min-height:25px; float:left; margin-top:4px; margin-left:50px; text-align:center; line-height:25px; color:#FFFFFF">
<b>Contact Us&nbsp;&nbsp;&nbsp;<b>|</b>&nbsp;&nbsp;&nbsp;Site Map&nbsp;&nbsp;&nbsp;<b>|</b>&nbsp;&nbsp;&nbsp;Current Date & Time</b>

</div>

<div style="width:300px; min-height:30px; float: right; margin-right:50px; text-align:center; line-height:25px; color:#FFFFFF; ">
<img src="images/Facebook_Symbol.png" height="25px" width="30px;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<img src="images/302.jpg" height="25px" width="30px"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<img src="images/linkedin_symbol.jpg" height="30px" width="30px" />

</div>


</div>

<div id="templatmeo_wrapper">

    <!--<div id="templatemo_header">
    
        <div id="site_title">
            <h1>
               <font color="#999999"> 
                &#x0939;&#2367;&#x0902;&#x0926;&#x0940;&nbsp;&#x0905;&#x0916;&#x092c;&#x093e;&#x0930;  |   &#x0915;&#x094b;&#x0938;&#x0940;   &#x0928;&#2381;&#x092f;&#x0941;&#x091c;</font> </h1> <br />
              
                  <h3>Impressionism is the newspaper of the soul.</h3>
          
        </div> <!-- end of site_title -->
        
       <!-- <div id="header_right">
        
            <ul id="header_button">
                <li><a href="#"><img src="images/Facebook_Symbol.png" alt="home" height="30px" width="30px" /></a></li>
                <li><a href="#"><img src="images/302.jpg" alt="contact us"  height="30px" width="30px"/></a></li>	
                <li><a href="#"><img src="images/linkedin_symbol.jpg"   height="30px" width="30px"/></li>
              
            </ul>
            
            <div class="cleaner"></div>
            
          <div id='basic-modal' style="height:50px; width:50px;  float:right; margin-right:90px; text-align:center; color:#CCCCCC; "><input type="button" value="User Login" style="text-align:center; border-radius:1px; height:30px; width:100px; background-image:url(images/templatemo_header.jpg); background-position:center; color:#0080C0;" class='basic'/></div>
          
          
          <div id="basic-modal-content">
			<h2><center>User Login</center></h2><hr />
            <center>
            <form name="frm" action="#" method="post">
            <table cellpadding="3" cellspacing="3">
             <tr><th><h3>User Name</h3> </th></tr>
             <tr><th><input type="text" value="" placeholder="User Name" style="text-align:center; border-radius:9px; height:20px;"/></th></tr>
             <tr><th><h3>Password</h3></th></tr>
             <tr><th><input type="password" value="" placeholder="*******"  style="text-align:center; border-radius:9px; height:20px;" /></th></tr>
             <tr><th height="50px"><input type="submit" value="Login" style="text-align:center; border-radius:9px; height:30px; width:100px; background-color: #FFFFFF"/></th></tr>
             <tr><th height="40px"><h3>Forget Id and Password</h3></th></tr>
            </table>
            </form>
			
		</center>
			
		</div>


          <!-- <form action="#" method="get">
                <input type="text" value="Enter a keyword here..." name="q" size="10" id="searchfield" title="searchfield" onfocus="clearText(this)" onblur="clearText(this)" />
                <input type="submit" name="Search" value="Go" alt="Search" id="searchbutton" title="Search" />
            </form>
        -->
        <!--</div>
        
    </div> <!-- end of templatemo_header -->
    <div style="min-height:120px; max-width:1350px; border:1px solid; ">
    
    <div style="float:left; margin-left:30px; width:500px; min-height:75px; text-align:center; line-height:75px ">
    
      <font color="#004080" size="+5"> 
                &#x0939;&#2367;&#x0902;&#x0926;&#x0940;&nbsp;&#x0905;&#x0916;&#x092c;&#x093e;&#x0930;  |   &#x0915;&#x094b;&#x0938;&#x0940;   &#x0928;&#2381;&#x092f;&#x0941;&#x091c;</font> <br />
              
                 <!-- <h3>Impressionism is the newspaper of the soul.</h3>-->
       </div>   
     <div style="float: right; margin-right:20px; width:700px; min-height:88px;  text-align:center; line-height:75px ">
    
     
      
    <div id='basic-modal' style="height:30px; width:200px;   float:right; margin-right:100px; text-align:center; color:#CCCCCC; float:right; border:1px solid; margin-top:11px "><input type="button" value="उपयोगकर्ता लॉगिन" style="text-align:center; border-radius:1px; height:30px; width:200px; background-image:url(images/templatemo_header.jpg); background-position:center; color:#0080C0;" class='basic'/></div>
          
          
          <div id="basic-modal-content">
			<h2><center>उपयोगकर्ता लॉगिन</center></h2><hr />
            <center>
            <form name="frm" action="login.jsp" method="post">
            <table cellpadding="3" cellspacing="3">
             <tr><th><h3>User Name</h3> </th></tr>
             <tr><th><input type="text" value="" name="usernme" placeholder="User Name" style="text-align:center; border-radius:1px; height:20px;"/></th></tr>
             <tr><th><h3>Password</h3></th></tr>
             <tr><th><input type="password" value="" name="userpass" placeholder="*******"  style="text-align:center; border-radius:1px; height:20px;" /></th></tr>
             <tr><th height="50px"><input type="submit" value="Login" style="text-align:center; border-radius:1px; height:30px; width:100px; background-color: #FFFFFF"/></th></tr>
             <tr><th height="40px"><h3>Forget Id and Password</h3></th></tr>
            </table>
            </form>
			
		</center>
			
		</div>
        
        
          <div style="min-height:32px; margin-top:50px;width:168px; float:left; margin-left:5px; background-image: url(images/templatemo_header.jpg); background-position:center;   -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset; text-align:center; line-height:25px">
   <font color="#009900" style="font-size:16px"><a href="index.html">&#x0938;&#x0941;&#x092a;&#x094c;&#x0932;</a></font></div>
            <div style="min-height:32px; margin-top:50px;width:168px; float:left; margin-left:5px;  -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset; background-image: url(images/templatemo_header.jpg); background-position:center; text-align:center; line-height:25px">
      <font color="#009900" style="font-size:16px"><a href="index.html">&#x0938;&#x0939;&#x0930;&#x0938;&#x093e;</a></font></div>
              <div style="min-height:32px; width:168px; float:left; margin-left:5px;   -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset; background-image: url(images/templatemo_header.jpg); background-position:center;text-align:center; line-height:25px; margin-top:8px">
              <font color="#009900" style="font-size:16px"><a href="index.html">&#x092e;&#x0927;&#x0947;&#x092a;&#x0941;&#x0930;&#x093e;</a></font></div> 
               <div style="min-height:32px; width:168px; float: left; margin-left:5px;   -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset; background-image: url(images/templatemo_header.jpg); background-position:center;text-align:center; line-height:25px; margin-top:8px">
               <font color="#009900" style="font-size:16px"><a href="index.html">&#x0938;&#x092e;&#2381;&#x092a;&#x0941;&#x0923;&#x0946; &#x0915;&#x094b;&#x0938;&#x0940;</a></font></div>
    </div>
        <div style="min-height:25px; max-width:1350px;  margin-top:90px; background-image: url(images/templatemo_box_tr%20-%20Copy.jpg); line-height:25px ">
        
        <marquee scrollamount="5" behavior="scroll" direction="right" direction="left"><font color="#333333" style="font-size:14px" >प्रभाववाद आत्मा का अखबार है...............भाववाद आत्मा का अखबार है.............प्रभाववाद आत्मा का अखबार है............प्रभाववाद आत्मा का अखबार है..................प्रभाववाद आत्मा का अखबार है</font></marquee>
        
        
        
        
        
        
        </div>
  
    </div>
  
    <div id="templatemo_banner">
    
    <div style="height:255px; width:265px;  float:left; ">
    <div id="slideshow">
   <div>
     <img src="images/images (12).jpg" height="230px" width="240px" style="border-radius:2px;">
   </div>
   <div>
     <img src="images/images (16).jpg" height="230px" width="240px"style="border-radius:2px;">
   </div>   
</div>
<div style="height:28px; width:265px;  float:left; background-image:url(images/templatemo_header.jpg); background-position:center; line-height:28px; text-align:center; color:#999999;  box-shadow: 5 2 20px rgba(2,20,5,10.4); border-radius:5px">
<h3><a href="index.html">मनोरंजन सुर्खियों में</a></h3>
</div>
    </div>
  <div style="height:255px; width:265px;  float:left; margin-left:2px">
      <div id="slideshow1">
   <div>
     <img src="images/images (4).jpg" height="230px" width="240px" style="border-radius:2px;">
   </div>
   <div>
     <img src="images/images.jpg" height="230px" width="240px" style="border-radius:2px;">
   </div>
  
</div>
<div style="height:28px; width:265px;  float:left; background-image:url(images/templatemo_header.jpg); background-position:center; line-height:28px; text-align:center; color:#999999; box-shadow: 5 2 20px rgba(2,20,5,10.4); border-radius:5px">
<a href="sahersha.html"><h3>प्रोद्योगिकी सुर्खियों में </h3></a>
</div>
    </div>
  <div style="height:255px; width:265px;  float:left; margin-left:2px">
     
       <div id="slideshow2">
   <div>
     <img src="images/images (5).jpg" height="230px" width="240px" style="border-radius:2px;">
   </div>
   <div>
     <img src="images/images (8).jpg" height="230px" width="240px" style="border-radius:2px;">
   </div>
   
</div>
<div style="height:28px; width:265px;  float:left; background-image:url(images/templatemo_header.jpg); background-position:center; line-height:28px; text-align:center; color:#999999; box-shadow: 5 2 20px rgba(2,20,5,10.4); border-radius:5px">
<a href="madhepura.html"><h3>स्पोर्ट्स सुर्खियों में</h3></a>
</div>
    </div>
  <div style="height:255px; width:265px;  float:left; margin-left:2px">
     
       <div id="slideshow3">
   <div>
     <img src="images/images (17).jpg" height="230px" width="240px" style="border-radius:2px;">
   </div>
   <div>
     <img src="images/images (20).jpg" height="230px" width="240px" style="border-radius:2px;">
   </div>
    <div>
     <img src="images/images (19).jpg"height="230px" width="240px" style="border-radius:2px;">
   </div>
   
</div>
<div style="height:28px; width:265px;  float:left; background-image:url(images/templatemo_header.jpg); background-position:center; line-height:28px; text-align:center; color:#999999; box-shadow: 5 2 20px rgba(2,20,5,10.4); border-radius:5px">
<a href="sampurn_kosi.html"><h3>शिक्षा सुर्खियों में</h3></a>
</div>
    </div>
    
     <div style="height:255px; width:268px;  float:left; margin-left:2px;">
     
  <div id="slideshow4" style="width:268px" style="border:1px solid; border-color:#FFFFFF">
  
   <div>
     <img src="images/images (6).jpg" height="230px" width="260px" style="border-radius:2px;">
   </div>
   <div>
     <img src="images/images (2).jpg" height="230px" width="260px" style="border-radius:2px;">
   </div>
    <div>
     <img src="images/images (18).jpg"height="230px" width="260px" style="border-radius:2px;">
   </div>
   
</div>
<div style="height:28px; width:278px;  float:left; background-image:url(images/templatemo_header.jpg); background-position:center; line-height:28px; text-align:center; color:#999999; box-shadow: 5 2 20px rgba(2,20,5,10.4); border-radius:5px">
<a href="sampurn_kosi.html"><h3>व्यापार सुर्खियों में</h3></a>
</div>
    </div>
    
    
    </div> <!-- end of templatemo_banner -->
           <div id="wrap">
    <div id="templatemo_menu" style=" max-width:1100px; margin-left:50px;">
    
        <ul>
            <li><a href="#"><font color="#009900">मुख्य पृष्ठ</font></a></li>


            <li><a href="LINK_PAGES/supaul/entertainment.html" class="current">मनोरंजन पृष्ठ</a></li>
            <li><a href="LINK_PAGES/supaul/education.html" class="current">शिक्षा पृष्ठ</a></li>
            <li><a href="LINK_PAGES/supaul/sports.html" class="current">स्पोर्ट्स पृष्ठ</a></li>
            <li><a href="#" class="current">प्रोद्योगिकी पृष्ठ</a></li>
            <li><a href="#" class="current">व्यापार पृष्ठ</a></li>
            <li><a href="#" class="current"> तस्वीर पृष्ठ</a></li>	
            <li><a href="#" class="current">समाचार पृष्ठ</a></li>	
        </ul>    	
    
    </div> <!-- end of templatemo_menu -->

    <div id="templatemo_content_wrapper" >
    
    	<div id="templatemo_left_sidebar" >
        
        <div style="height:480px; width:840px;">
        
        
        
        

  <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Main_Images/mainimage.jsp','NewWindow','width=700px,height=230px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
  
      <div style="height:460px; width:390px; float:left;" title="Update">
        
<div id="sliderb_container" style="position: relative; width: 390px;
        height: 460px; overflow: hidden;">

        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
            <div style="position: absolute; display: block; background: url(../img/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div>

        <!-- Slides Container -->
        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 390px; height: 460px;
            overflow: hidden;">
            <div>
             <iframe src="LINK_PAGES/Updation Pages/Main_Images/Extract_main_img.jsp" height="460px" width="390px" frameborder="0" scrolling="no"  ></iframe>
                <!--<img u=image src="images/images (12).jpg" />-->
                <div u="thumb"><font style="line-height:25px"> शिक्षा के समारोह अधिकता में सोचने के लिए और गंभीर लगता है।सच है कि शिक्षा का लक्ष्य है। </font></div>
            </div>
            <div>
            <iframe src="LINK_PAGES/Updation Pages/Main_Images/Extract_main_img.jsp" height="460px" width="390px" frameborder="0" scrolling="no"  ></iframe>
                <!--<img u=image src="images/images (17).jpg" />-->
                <div u="thumb"><font style="line-height:25px"> शिक्षा के समारोह अधिकता में सोचने के लिए और गंभीर लगता है।सच है कि शिक्षा का लक्ष्य है। </font></div>
            </div>
            <div>
            <iframe src="LINK_PAGES/Updation Pages/Main_Images/Extract_main_img.jsp" height="460px" width="390px" frameborder="0" scrolling="no"  ></iframe>
                <!--<img u=image src="images/images (1).jpg" />-->
                <div u="thumb"><font style="line-height:25px"> शिक्षा के समारोह अधिकता में सोचने के लिए और गंभीर लगता है।सच है कि शिक्षा का लक्ष्य है। </font></div>
            </div>
            <div>
            <iframe src="LINK_PAGES/Updation Pages/Main_Images/Extract_main_img.jsp" height="460px" width="390px" frameborder="0" scrolling="no"  ></iframe>
                <!--<img u=image src="images/images (10).jpg" />-->
                <div u="thumb"><font style="line-height:25px"> शिक्षा के समारोह अधिकता में सोचने के लिए और गंभीर लगता है।सच है कि शिक्षा का लक्ष्य है। </font></div>
            </div>
        </div>

        <!-- ThumbnailNavigator Skin Begin -->
        <div u="thumbnavigator" class="sliderb-T" style="position: absolute; bottom: 0px; left: 0px; height:65px; width:390px;">
            <div style="filter: alpha(opacity=40); opacity:0.4; position: absolute; display: block;
                background-color: #000000; top: 0px; left: 0px; width: 100%; height: 100%;">
            </div>
            <!-- Thumbnail Item Skin Begin -->
            <div u="slides">
                <div u="prototype" style="POSITION: absolute; WIDTH: 390px; HEIGHT: 65px; TOP: 0; LEFT: 0;">
                    <thumbnailtemplate style="font-family: verdana; font-weight: normal; POSITION: absolute; WIDTH: 100%; HEIGHT: 100%; TOP: 0; LEFT: 0; color:#fff; line-height: 45px; font-size:18px; padding-left:10px;"></thumbnailtemplate>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- ThumbnailNavigator Skin End -->
        
        <!-- Bullet Navigator Skin Begin -->
        <!-- jssor slider bullet navigator skin 01 -->
        <style>
            /*
            .jssorb01 div           (normal)
            .jssorb01 div:hover     (normal mouseover)
            .jssorb01 .av           (active)
            .jssorb01 .av:hover     (active mouseover)
            .jssorb01 .dn           (mousedown)
            */
            .jssorb01 div, .jssorb01 div:hover, .jssorb01 .av
            {
                filter: alpha(opacity=70);
                opacity: .7;
                overflow:hidden;
                cursor: pointer;
                border: #000 1px solid;
            }
            .jssorb01 div { background-color: gray; }
            .jssorb01 div:hover, .jssorb01 .av:hover { background-color: #d3d3d3; }
            .jssorb01 .av { background-color: #fff; }
            .jssorb01 .dn, .jssorb01 .dn:hover { background-color: #555555; }
        </style>
        <!-- bullet navigator container -->
        <!-- Bullet Navigator Skin End -->
        
        <!-- Arrow Navigator Skin Begin -->
        <style>
            /* jssor slider arrow navigator skin 05 css */
            /*
            .jssora05l              (normal)
            .jssora05r              (normal)
            .jssora05l:hover        (normal mouseover)
            .jssora05r:hover        (normal mouseover)
            .jssora05ldn            (mousedown)
            .jssora05rdn            (mousedown)
            */
            .jssora05l, .jssora05r, .jssora05ldn, .jssora05rdn
            {
            	position: absolute;
            	cursor: pointer;
            	display: block;
                background: url(../img/a17.png) no-repeat;
                overflow:hidden;
            }
            .jssora05l { background-position: -10px -40px; }
            .jssora05r { background-position: -70px -40px; }
            .jssora05l:hover { background-position: -130px -40px; }
            .jssora05r:hover { background-position: -190px -40px; }
            .jssora05ldn { background-position: -250px -40px; }
            .jssora05rdn { background-position: -310px -40px; }
        </style>
        <!-- Arrow Left -->

    </div>
    
    </a>

        
        </div>
        
       
        
        <div style="height:460px; width:440px;  float:left; margin-left:5px">
        
         <div class="templatemo_box">
            	<h2><span></span><font style="font-size:20px">आज की सुर्खियों में</font></h2>
               
                <div class="body">
          			<ul class="side_menu">
                 
                     <%
				   hdb.mkcon();
				 
				   ResultSet rs=hdb.fetch("select * from healines");
                   while(rs.next())
                    {
				%>
                       
  
               <li> <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Headline/Headline.jsp','NewWindow','width=700px,height=450px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()"><%=rs.getString(3)%></a>
						</li> 
						  <%}%>
                       
                       
					</ul>
                </div>
            
            	<div class="box_bottom" ><span></span></div>
            </div>
        </div>
        
        
        
        
        
        
        </div>
        
        
        	<!--<div class="templatemo_box">
            	<h2><span></span>Categories</h2>
                
                <div class="body">
                    <ul class="side_menu">
                        <li><a href="#">Lorem ipsum dolor</a></li>
                        <li><a href="#">Donec bibendum semper</a></li>
                        <li><a href="#">Proin tincidunt dapibus</a></li>
                        <li><a href="#">Nulla consequat</a></li>
                        <li><a href="#">In enim justo</a></li>
                        <li><a href="#">Aenean vulputate</a></li>
                        <li><a href="#">Etiam ultricies</a></li>
                        <li><a href="#">Nullam vehicula egestas </a></li>              
                    </ul>
                </div>
            
            	<div class="box_bottom"><span></span></div>
            </div>-->
            
            <div class="templatemo_box">
            	<h2><span></span><font style="font-size:20px">मनोरंजन</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 
 

 बॉलीवुड&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>|</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  हॉलीवुड
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>|</b>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;लाउंज  
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>|</b>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; बिहार मसाला</h2>
             
             
             
             
               <li>
               
               
              
              
                <div class="body" style="margin-top:10px" >
                
                  <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Entertainment/entertaiment.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
          			<div style="height:100px;width:120px;  float: left; background-image: url(images/download.jpg); background-position:center" title="Update">
                    
                    <caption><font color="white" style="background-color:#666666">बॉलीवुड</font></caption>
                    </div>
                    <div style="height:120px;width:220px; float: left; margin-left:10px;" title="Update" >
                       <h3>सोनम कपूर नीचे स्वाइन फ्लू के साथ</h3>
                    1 दिन पहले खूबसूरत स्टार शनिवार को बुखार और गले में खराश की शिकायतों के साथ राजकोट अस्पताल में भर्ती कराया जा रहा है के बाद सकारात्मक परीक्षण किया
                    </div>
                    
                    </a>
                    
                    <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Entertainment/entertaiment.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                    <div  title="Update" style="height:100px;width:120px;  float: left; margin-left:50px; background-image: url(images/4856_hollywood-actor-brad-pitt.jpg); background-position:center">
                    
                    <caption><font color="white" style="background-color:#666666">हॉलीवुड</font></caption>
                    </div>
                    <div style="height:150px;width:220px; float: left; margin-left:10px" title="Update">
                    <h3>सोनम कपूर नीचे स्वाइन फ्लू के साथ</h3>
                    1 दिन पहले खूबसूरत स्टार शनिवार को बुखार और गले में खराश की शिकायतों के साथ राजकोट अस्पताल में भर्ती कराया जा रहा है के बाद सकारात्मक परीक्षण किया
                   
                    </div>
                   </A>
                   
                    <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Entertainment/entertaiment.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                   <div style="height:100px;width:120px; float: left; background-image: url(images/download.jpg); background-position:center">
                    
                    <caption><font color="white" style="background-color:#666666">बॉलीवुड</font></caption>
                    </div>
                    <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>सोनम कपूर नीचे स्वाइन फ्लू के साथ</h3>
                    1 दिन पहले खूबसूरत स्टार शनिवार को बुखार और गले में खराश की शिकायतों के साथ राजकोट अस्पताल में भर्ती कराया जा रहा है के बाद सकारात्मक परीक्षण किया
                   
                    </div>
                    </A>
                     <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Entertainment/entertaiment.jsp','NewWindow','width=700px, height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                    <div style="height:100px;width:120px;  float: left; margin-left:50px; background-image: url(images/4856_hollywood-actor-brad-pitt.jpg); background-position:center">
                    
                    <caption><font color="white" style="background-color:#666666">हॉलीवुड</font></caption>
                    </div>
                    <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>सोनम कपूर नीचे स्वाइन फ्लू के साथ</h3>
                    1 दिन पहले खूबसूरत स्टार शनिवार को बुखार और गले में खराश की शिकायतों के साथ राजकोट अस्पताल में भर्ती कराया जा रहा है के बाद सकारात्मक परीक्षण किया
                   
                    </div>
                   </A>
                </div>
            
            	<div class="box_bottom" ><span></span></div>
            </div>
            
               <div class="templatemo_box">
            	<h2><span></span><font style="font-size:20px">शिक्षा</font></h2>
                <div class="body" style="margin-top:10px; ">
                
                  <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Education/education.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                  
          			<div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg);">
                    <img src="images/images (27).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">शिक्षा</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>शिक्षा सबसे महत्वपूर्ण है</h3>
                   शिक्षा के समारोह अधिकता में सोचने के लिए और गंभीर लगता है एक सिखाना है। खुफिया प्लस चरित्र - सच है कि शिक्षा का लक्ष्य है।
                   
                    </div>
                    </A>
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Education/education.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                      
                   <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); ">
                    <img src="images/images (26).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">शिक्षा</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>शिक्षा सबसे महत्वपूर्ण है</h3>
                    शिक्षा आप दुनिया को बदलने के लिए उपयोग कर सकते हैं जो सबसे शक्तिशाली हथियार है।
                   
                    </div>
                    </A>
                    
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Education/education.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                      
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); border:1px solid">
                    <img src="images/images (17).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">शिक्षा</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>शिक्षा सबसे महत्वपूर्ण है</h3>
                     शिक्षा एक सराहनीय बात है , लेकिन यह समय से जानने लायक है कि कुछ भी नहीं सिखाया जा सकता है कि समय के लिए याद करने के लिए अच्छी तरह से है ।
                   
                    </div>
                    </A>
                    
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Education/education.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                      
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); ">
                    <img src="images/images (23).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">शिक्षा</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>शिक्षा सबसे महत्वपूर्ण है</h3>
                   शिक्षा के लक्ष्य को ज्ञान की उन्नति और सत्य का प्रसार है ।
                   
                    </div>
                    </A>
                    </div>
            	<div class="box_bottom" ><span></span></div>
            </div>
              <div class="templatemo_box">
            	<h2><span></span><font style="font-size:20px">स्पोर्ट्स</font></h2>
                
              <div class="body" style="margin-top:10px">
              
               <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Sports/sports.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
          			<div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg);">
                    <img src="images/images.jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">स्पोर्ट्स</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>स्पोर्ट्स</h3>
                  क्या आप कुछ खो देते हैं , कुछ जीतने के लिए, और कुछ पाने के बाहर बारिश , लेकिन तुम होगा सूट ऊपर उन सब के लिए । 
                    </div>
                    </A>
                    
                     <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Sports/sports.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                   <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); ">
                    <img src="images/images (26).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">स्पोर्ट्स</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>स्पोर्ट्स</h3>
                  आप पहल लेने के लिए और अपने खेल को खेलने के लिए मिल गया है। एक निर्णायक सेट में, विश्वास का अंतर है।
                   
                    </div>
                    </A>
                    
                     <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Sports/sports.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); border:1px solid">
                    <img src="images/images (17).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">स्पोर्ट्स</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>स्पोर्ट्स</h3>
यह केवल काम और संघर्ष के माध्यम से है कि राष्ट्र या महानता पर व्यक्तिगत चालों या तो । महान आदमी हमेशा आम तौर पर शक्तिशाली प्रयास का आदमी है, और पीस की जरूरत पराक्रमी प्रयास करने के लिए प्रशिक्षित किया गया है जिसे आदमी है।
                   
                    </div>
                    </A>
                    
                     <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Sports/sports.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                     
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); ">
                    <img src="images/images (23).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">स्पोर्ट्स</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>स्पोर्ट्स</h3>
                   नंबर एक बस को चलाने के लिए एक जुनून हासिल करने के लिए है । ट्रैक पर गति प्यार करने के लिए , निशान प्यार करने के लिए सुबह से प्यार करने के लिए। कुछ बच्चे वास्तव में इसे अच्छा हो जाता है , तो वह भी अच्छा है।
                   
                    </div>
                    </A>
                </div>
            
            	<div class="box_bottom" ><span></span></div>
            </div>
              <div class="templatemo_box">
            	<h2><span></span><font style="font-size:20px">प्रोद्योगिकी</font></h2>
                
                    <div class="body" style="margin-top:10px">
                    
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Technology/technology.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
          			<div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg);">
                    <img src="images/images (31).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">प्रोद्योगिकी</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>प्रोद्योगिकी</h3>
                  पुस्तकें एक पृष्ठ पर शब्दों से ज्यादा कुछ नहीं की तरह लग सकता है, लेकिन वे वास्तव में अपने सिर के अंदर चित्रों में अजीब , रोशनाई पोता हुआ उतार तब्दील हो कि एक असीम जटिल imaginotransference प्रौद्योगिकी रहे हैं।
                    </div>
                    </A>
                    
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Technology/technology.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                   <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); ">
                    <img src="images/images (33).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">प्रोद्योगिकी</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>प्रोद्योगिकी</h3>
               तकनीकी प्रगति केवल पीछे की ओर जाने के लिए और अधिक कुशल मतलब के साथ हमें प्रदान किया है ।
                   
                    </div>
                    </A>
                    
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Technology/technology.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                      
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); border:1px solid">
                    <img src="images/images (32).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">प्रोद्योगिकी</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>स्पोर्ट्स</h3>
प्रौद्योगिकी बड़ी आबादी संभव बनाया ; बड़ी आबादी अब प्रौद्योगिकी अपरिहार्य बनाते हैं।

                   
                    </div>
                    </A>
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Technology/technology.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                      
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); ">
                    <img src="images/images (16).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">प्रोद्योगिकी</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>स्पोर्ट्स</h3>
                  इस प्रौद्योगिकी की सारी बात है । यह एक हाथ पर अमरता के लिए एक भूख पैदा करता है। यह दूसरे पर यूनिवर्सल विलुप्त होने का खतरा है। प्रौद्योगिकी प्रकृति से हटा वासना है ।
                   
                    </div>
                    </A>
                </div>
            
            	<div class="box_bottom" ><span></span></div>
            </div>
              <div class="templatemo_box">
            	<h2><span></span><font style="font-size:20px">व्यापार</font></h2>
                
                   <div class="body" style="margin-top:10px">
                     <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Business/business.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
          			<div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg);">
                    <img src="images/download (2).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">व्यापार</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>व्यापार</h3>
                   अपनी योजनाओं अंधेरे और रात के रूप में अभेद्य हो, और जब तुम चलो , एक वज्र की तरह गिर जाते हैं।
                    </div>
                    </A>
                    
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Business/business.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                      
                   <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); ">
                    <img src="images/download (3).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">व्यापार</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>व्यापार</h3>
             आप अपनी पूरी क्षमता , एक शब्द में , मानव जाति को हासिल नहीं किया गया है कारण की पहचान करने के लिए , और हासिल होगा कभी नहीं किया था , तो उस शब्द ' बैठकों होगा |
                   
                    </div>
                    </A>
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Business/business.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); border:1px solid">
                    <img src="images/download (4).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">व्यापार</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>व्यापार</h3>
आप एक विचार है, या एक समस्या है, या आप सही करना चाहते हैं कि एक गलत के साथ जल जाना है। आप शुरू से ही काफी भावुक नहीं कर रहे हैं , तो आप इसे बाहर रहना कभी नहीं होगा।

                   
                    </div>
                    </A>
                    
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Business/business.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                      
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); ">
                    <img src="images/images (35).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">व्यापार</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>व्यापार</h3>
आप एक विचार है, या एक समस्या है, या आप सही करना चाहते हैं कि एक गलत के साथ जल जाना है। आप शुरू से ही काफी भावुक नहीं कर रहे हैं , तो आप इसे बाहर रहना कभी नहीं होगा।
                   
                    </div>
                    </A>
                </div>
            
            	<div class="box_bottom" ><span></span></div>
            </div>
            
            
              <div class="templatemo_box">
            	<h2><span></span><font style="font-size:20px">समाचार</font></h2>
                
              <div class="body" style="margin-top:10px">
                  <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/News/news.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
          			<div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg);">
                    <img src="images/download (5).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">समाचार</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>समाचार</h3>
                   अपनी योजनाओं अंधेरे और रात के रूप में अभेद्य हो, और जब तुम चलो , एक वज्र की तरह गिर जाते हैं।
                    </div>
                    </A>
                    
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/News/news.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                      
                   <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); ">
                    <img src="images/download (3).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">समाचार</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>समाचार</h3>
             आप अपनी पूरी क्षमता , एक शब्द में , मानव जाति को हासिल नहीं किया गया है कारण की पहचान करने के लिए , और हासिल होगा कभी नहीं किया था , तो उस शब्द ' बैठकों होगा |
                   
                    </div>
                    </A>
                    
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/News/news.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                      
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); border:1px solid">
                    <img src="images/download (4).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">समाचार</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>समाचार</h3>

             आप अपनी पूरी क्षमता , एक शब्द में , मानव जाति को हासिल नहीं किया गया है कारण की पहचान करने के लिए , और हासिल होगा कभी नहीं किया था , तो उस शब्द ' बैठकों होगा |
                   
                    </div>
                    </A>
                    
                      <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/News/news.jsp','NewWindow','width=700px,height=530px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); ">
                    <img src="images/images (35).jpg" height="100px" width="130px" />
                    <caption><font color="white" style="background-color:#666666">समाचार</font></caption>
                    </div>
                     <div style="height:150px;width:220px; float: left; margin-left:10px">
                    <h3>समाचार</h3>
             आप अपनी पूरी क्षमता , एक शब्द में , मानव जाति को हासिल नहीं किया गया है कारण की पहचान करने के लिए , और हासिल होगा कभी नहीं किया था , तो उस शब्द ' बैठकों होगा |
                   
                    </div>
                    </A>
                </div>
            
            	<div class="box_bottom" ><span></span></div>
            </div>
              <div class="templatemo_box">
            	<h2><span></span><font style="font-size:20px">फोटोज</font></h2>
                
              <div class="body" style="margin-top:10px;">
                
          			<div  style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); margin-left:10px">
                    <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Photos/photos.jsp','NewWindow','width=700px,height=200px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                   <a> <iframe src="LINK_PAGES/Updation Pages/Photos/Image.jsp" height="110px" width="120px" frameborder="0"  ></iframe></a>
                   <!-- <img src="images/download (2).jpg" height="100px" width="130px" />-->
</A>
                    </div>
                    
                    
                     <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Photos/photos.jsp','NewWindow','width=700px,height=200px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                     
                   <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); margin-left:10px">
                   <iframe src="LINK_PAGES/Updation Pages/Photos/Image.jsp" height="110px" width="120px" frameborder="0"  ></iframe>
                    <!--<img src="images/download (3).jpg" height="100px" width="130px" />-->

                    </div>
                    </A>
                    
                     <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Photos/photos.jsp','NewWindow','width=700px,height=200px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                     
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); margin-left:10px">
                    <iframe src="LINK_PAGES/Updation Pages/Photos/Image.jsp" height="110px" width="120px" frameborder="0"  ></iframe>
                    <!--<img src="images/download (4).jpg" height="100px" width="130px" />-->

                    </div>
                 </A>
                  <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Photos/photos.jsp','NewWindow','width=700px,height=200px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                  
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); margin-left:10px ">
                    <iframe src="LINK_PAGES/Updation Pages/Photos/Image.jsp" height="110px" width="120px" frameborder="0"  ></iframe>
                    <!--<img src="images/images (35).jpg" height="100px" width="130px" />-->

                    </div>
                    </A>
                     <A href="javascript:NewWindow=window.open('LINK_PAGES/Updation Pages/Photos/photos.jsp','NewWindow','width=700px,height=200px, top=120, left=290, menubar=0,addressbar=no');NewWindow.focus()">
                    <div style="height:100px; width:130px; float:left;background-image:url(images/images%20(4).jpg); margin-left:10px ">
                    
                    <img src="images/images (35).jpg" height="100px" width="130px" />

                    </div>
                    
                    </A>
                   
                </div>
            
            	<div class="box_bottom" ><span></span></div>
            </div>
        
        </div> <!-- end of left_sidebar -->
        
          <!-- <div id="templatemo_content">
        
			<div class="templatemo_box">
            	<h2><span></span>Welcome to &#x0939;&#2367;&#x0902;&#x0926;&#x0940;&nbsp;  &#x0928;&#2381;&#x092f;&#x0941;&#x091c;  Portal Website</h2>
                
                <div class="body">
                    
                    <p> &#x0939;&#2367;&#x0902;&#x0926;&#x0940;&nbsp;&#x0905;&#x0916;&#x092c;&#x093e;&#x0930; Portal <a href="#" target="_parent">                &#x0928;&#2381;&#x092f;&#x0941;&#x091c;</a> Hindi portal
        Validate <a href="http://validator.w3.org/check?uri=referer">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>. Credit goes to <a href="http://www.photovaco.com" target="_blank">Free Photos</a> for photos used in this layout. Nam ut libero at lacus feugiat tincidunt vitae sed ipsum. Vivamus ut ante ullamcorper urna cursus porta.</p>
                  
              </div>
                <div class="body">
                    
                    <p> &#x0939;&#2367;&#x0902;&#x0926;&#x0940;&nbsp;&#x0905;&#x0916;&#x092c;&#x093e;&#x0930; Portal <a href="#" target="_parent">                &#x0928;&#2381;&#x092f;&#x0941;&#x091c;</a> Hindi portal
        Validate <a href="http://validator.w3.org/check?uri=referer">XHTML</a> &amp; <a href="http://jigsaw.w3.org/css-validator/check/referer">CSS</a>. Credit goes to <a href="http://www.photovaco.com" target="_blank">Free Photos</a> for photos used in this layout. Nam ut libero at lacus feugiat tincidunt vitae sed ipsum. Vivamus ut ante ullamcorper urna cursus porta.</p>
                  
              </div>
            
           	  <div class="box_bottom"><span></span></div>
            </div>
            
            <div class="templatemo_box">
            	<h2><span></span>Popular Places</h2>
                
                <div class="body">
                    
                    <div class="news_box">
                        <a href="#"><img class="news_image" src="images/templatemo_image_06.jpg" alt="image" /></a>
                   	  <h3><a href="#">Praesent pretium diam quam</a></h3>
                        <p>Praesent accumsan porta odio eget hendrerit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ut nunc nisl, in pellentesque mi.</p>
                        
                      <div class="cleaner"></div>
                    </div>
                
              <div class="news_box">
                    <a href="#"><img class="news_image" src="images/templatemo_image_07.jpg" alt="image" /></a>
                	<h3><a href="#">Aliquam tincidunt mauris sed</a></h3>
                    <p>Nam non nisl massa, vitae dapibus nisl. Vivamus iaculis gravida odio sed tempor. Fusce tempor faucibus est, ac feugiat metus accumsan sit amet.</p>
                    <div class="cleaner"></div>
                </div>
                
              <div class="news_box">
                    <a href="#"><img class="news_image" src="images/templatemo_image_08.jpg" alt="image" /></a>
               	<h3><a href="#">Curabitur quis nulla purus</a></h3>
                    <p> Praesent rhoncus faucibus nibh, non molestie lectus sagittis sed. Praesent ac sem lectus. Cras molestie elit sit amet velit tincidunt imperdiet. Mauris nulla purus.</p>
                <div class="cleaner"></div>
                </div>
                
                 <div class="news_box">
                    <a href="#"><img class="news_image" src="images/templatemo_image_08.jpg" alt="image" /></a>
               	<h3><a href="#">Curabitur quis nulla purus</a></h3>
                    <p> Praesent rhoncus faucibus nibh, non molestie lectus sagittis sed. Praesent ac sem lectus. Cras molestie elit sit amet velit tincidunt imperdiet. Mauris nulla purus.</p>
                <div class="cleaner"></div>
                </div>
                
                 <div class="news_box">
                    <a href="#"><img class="news_image" src="images/templatemo_image_08.jpg" alt="image" /></a>
               	<h3><a href="#">Curabitur quis nulla purus</a></h3>
                    <p> Praesent rhoncus faucibus nibh, non molestie lectus sagittis sed. Praesent ac sem lectus. Cras molestie elit sit amet velit tincidunt imperdiet. Mauris nulla purus.</p>
                <div class="cleaner"></div>
                </div>
                
                 <div class="news_box">
                    <a href="#"><img class="news_image" src="images/templatemo_image_08.jpg" alt="image" /></a>
               	<h3><a href="#">Curabitur quis nulla purus</a></h3>
                    <p> Praesent rhoncus faucibus nibh, non molestie lectus sagittis sed. Praesent ac sem lectus. Cras molestie elit sit amet velit tincidunt imperdiet. Mauris nulla purus.</p>
                <div class="cleaner"></div>
                </div>
                
               
                <div class="more float_r"><a href="#">View All</a></div>
                
                <div class="cleaner"></div>
                  
                </div>
            
            	<div class="box_bottom"><span></span></div>
            </div>
        	
            
            
            
            
            
        </div> <!-- end of templatemo_content -->
        
       	<div id="templatemo_right_sidebar" style="width:300px;">
        
        	<div style="height:227px; width:300px; border:1px solid; background-image:url(images/10769590285560524611.jpg); background-repeat:no-repeat; margin-top:3px"></div>
            
            
            
                      <div style="height:227px; width:300px;  background-image: url(images/5034239131866353489.jpg); background-repeat:no-repeat; margin-top:5px"></div>
            
            	<div class="templatemo_box" style="margin-top:17px">
            	<h2><span></span><font style="font-size:20px">विशेषज्ञों से पूछें
</font></h2>
                
                <div class="body">
                    
                    <ul class="side_menu">
                        <li><a href="#">1.सवाल और जवाब</a></li>
                        <li><a href="#">2.सवाल और जवाब</a></li>
                        <li><a href="#">3.सवाल और जवाब</a></li>
                        <li><a href="#">4.सवाल और जवाब</a></li>
                        <li><a href="#">5.सवाल और जवाब</a></li>
                        <li><a href="#">6.सवाल और जवाब</a></li>
                        <li><a href="#">7.सवाल और जवाब</a></li>
                        <li><a href="#">8.सवाल और जवाब</a></li>                    
                    </ul>
                  
                </div>
            
            	<div class="box_bottom"><span></span></div>
            </div>
          
          	<div class="templatemo_box" style="margin-top:20px">
            	<h2><span></span><font style="font-size:20px">अच्छे विचार
</font></h2>
                
                <div class="body">
<marquee scrollamount="2" behavior="scroll" direction="up" onmouseover="this.stop();" onmouseout="this.start();">  
                    <img src="images/images (49).jpg" height="290px" width="250px" />
                     </marquee>
                   
                </div>
            
            	<div class="box_bottom"><span></span></div>
            </div>
          	<div class="templatemo_box" style="margin-top:20px">
            	<h2><span></span><font style="font-size:20px">कमेंट्स</font></h2>
                
                <div class="body">
                    
                    <ul class="side_menu">
                                    आप अपनी पूरी क्षमता , एक शब्द में , मानव जाति को हासिल नहीं किया गया है कारण की पहचान करने के लिए , और हासिल होगा कभी नहीं किया था , तो उस शब्द ' बैठकों होगा |
                                                 आप अपनी पूरी क्षमता , एक शब्द में , मानव जाति को हासिल नहीं किया गया है कारण की पहचान करने के लिए , और हासिल होगा कभी नहीं किया था , तो उस शब्द ' बैठकों होगा |
                                                             
                    </ul>
                  
                </div>
            
            	<div class="box_bottom"><span></span></div>
            </div>
          
            
            <div class="sidebar_box" style="margin-top:20px">
            	<a href="http://www.flashmo.com/page/1" target="_parent"><img src="images/images (12).jpg" alt="Night Life" height="150px" width="300px;" style="border-radius:8px;" /></a>            </div>
            
            <div class="sidebar_box">
            	<a href="http://www.templatemo.com/page/1" target="_parent"><img src="images/images (11).jpg" alt="City Zoo" width="300px;" style="border-radius:8px;" /></a>            </div>
                
                 <div class="sidebar_box"  style="margin-top:25px">
            	<a href="http://www.templatemo.com/page/1" target="_parent"><img src="images/images (5).jpg" alt="City Zoo" width="300px;" style="border-radius:8px;" /></a>            </div>
                
                 <div class="sidebar_box">
            	<a href="http://www.templatemo.com/page/1" target="_parent"><img src="images/images (7).jpg" alt="City Zoo" width="300px" height="200px" style="border-radius:8px;" /></a>            </div>
        <div class="templatemo_box" style="margin-top:22px">
            	<h2><span></span><font style="font-size:20px">विज्ञापन</font></h2>
                
                <div class="body">
                                 आप अपनी पूरी क्षमता , एक शब्द में , मानव जाति को हासिल नहीं किया गया है कारण की पहचान करने के लिए , और हासिल होगा कभी नहीं किया था , तो उस शब्द ' बैठकों होगा |
                                              आप अपनी पूरी क्षमता , एक शब्द में , मानव जाति को हासिल नहीं किया गया है कारण की पहचान करने के लिए , और हासिल होगा कभी नहीं किया था , तो उस शब्द ' बैठकों होगा |
                                                           आप अपनी पूरी क्षमता , एक शब्द में , मानव जाति को हासिल नहीं किया गया है कारण की पहचान करने के लिए , और हासिल होगा कभी नहीं किया था , तो उस शब्द ' बैठकों होगा |
                  
                </div>
            
            	<div class="box_bottom"><span></span></div>
            </div>
      

          
          
          <div class="templatemo_box" style="margin-top:20px; height:350px">
            	<h2><span></span><font style="font-size:20px">समाचार पत्र</font></h2>
                
                <div class="body" style="height:200px">
               
                <center><form name="frm" action="#" method="post">
                 इस पत्रिका को ईमेल द्वारा प्राप्‍त करने हेतु, यहाँ अपना ईमेल का विविरन दे: <br /><br />
                 <input type="email" name="mail" placeholder=" अपना ईमेल आईडी  " value="" style=" height:30px; width:200px; line-height:15px; text-align:center" /><br /><br />
                 
                                  <input  type="submit" name="send"  value="Send" style=" height:30px; "/>
                 </form></center>
                </div>
            
            	<div class="box_bottom"><span></span></div>
            </div>
          
      </div> <!-- end of right_sidebar -->
        
        <div class="cleaner"></div>
        
    
    </div> <!-- end of templatemo_content_wrapper -->
    

</div> <!-- end of templatemo_wrapper -->

<div id="templatemo_footer_wrapper">

	<div id="templatemo_footer">

        <ul class="footer_menu">
        	<li><a href="#">Homepage</a></li>

            <li><a href="#">Life Style</a></li>
            <li><a href="#">Environments</a></li>
            <li><a href="#">Sports</a></li>
            <li><a href="#">Technology</a></li>
            <li><a href="#">Business</a></li>
            <li><a href="#">Videos</a></li>
            <li class="last_menu"><a href="#">Contact</a></li>
        </ul>
    
        Copyright © 2015 <a href="#">Your Company Name</a> | 
    <a href="#" target="_parent">Hindi News Portal</a> by <a href="#" target="_parent"></a></div> 
	<!-- end of footer -->
    </div>
</div> <!-- end of templatmeo_footer_wrapper -->
<div align=center> &#x0939;&#2367;&#x0902;&#x0926;&#x0940; <a href='#'> &#x0928;&#2381;&#x092f;&#x0941;&#x091c;</a></div></body>
</html>