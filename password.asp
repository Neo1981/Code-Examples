<!-- set your password below 

https://meetingsandevents.jpmorganchase.com/metron/%28medialibrary%29/55216dc5-b073-46a4-ad56-76a32f8a1939/meetings/29182e2f-3632-44d5-bd5a-394c44373a80/templates/1051191042.asp

-->

<%
Response.Buffer = True
STATUS = Request("STATUS")
PASSWORD = Request("PASSWORD")
Dim myURL


If STATUS = "CHECKEM" Then
     If PASSWORD = "pass1" or PASSWORD = "PASS1"  THEN
        Session("PASSWORDACCESS") = "Yes"
		response.Redirect "http://www.yahoo.com"		
		
	
		
     End If
	 
	 If PASSWORD = "pass2" or PASSWORD = "PASS2"  THEN
        Session("PASSWORDACCESS") = "Yes"
		response.Redirect "http://www.toysrus.com"		
		
	
		
     End If
	 
	 
	  	
	 
End If


    
If Session("PASSWORDACCESS") <> "Yes" Then
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>title</title>




<STYLE>
@charset "utf-8";

/* CSS Document */

html { overflow: -moz-scrollbars-vertical; }

html { overflow-x: auto; }

body {
	font: 13px/1.5 'Helvetica Neue', Arial, 'Liberation Sans', FreeSans, sans-serif;
background-color: #DEDEDE;
	text-align:center;
}


/* Header
----------------------------------------------------------------------------------------------------*/

#header { margin:0 auto; padding:0; }


#date {
	color:#fff !important;
	text-align: left;
	font-weight:600;
	font-size:1.2em;
	padding: 0 0 0 20px;
	*padding: 10px 0 0 20px;
	height: 45px;
	line-height: 45px;
	min-height: 45px;
	max-height: 45px;
}

#location {
	color:#fff !important;
	text-align: right;
	font-size:1.2em;
	padding: 0 20px 0 0;
	*padding: 10px 20px 0 0;
	line-height: 45px;
	font-weight: 600;
	height: 45px;
	max-height: 45px;
	min-height: 45px;
}

/* `Headings
----------------------------------------------------------------------------------------------------*/

h1 {
	font-family: Arial, sans-serif;
	font-size:2em;
	color:white;
	font-weight:400;
	line-height: 1.5em;
}

h2 {
	font-family:Arial, sans-serif;
	color:#88ABD5;
	font-weight:400;
	font-size: 1.8em;
}

h3 {
	font-family: Arial, sans-serif;
	color:#777;
	font-weight:400;
	font-size: 1.45em;
}

h4 { font-size: 19px; }

h5 {
	font-size: 17px;
	color:#777;
	border-bottom:1px dashed #bbb;
}

h6 { font-size: 15px; }

/* `Spacing
----------------------------------------------------------------------------------------------------*/

ol { list-style: decimal; }

ul { list-style: disc; }

li { }

p, dl, hr, h1, h2, h3, h4, h5, h6, ol, ul, pre, table, address, fieldset, figure { margin-bottom: 20px; }

pre, code { font-family: 'DejaVu Sans Mono', Menlo, Consolas, monospace; }





body, td, th { font-family: "Helvetica Neue", Arial, "Liberation Sans", FreeSans, sans-serif; }



#splash
{
	width:900px;
	height:432px;	

	background:url('SplashImage') no-repeat;


	
	margin:0 auto;
	display:table-cell;
	vertical-align:middle;
}

#passwordPrompt
{
	top:260px;
	*top:260px;
	margin-left:350px;
	*margin-left:0px;
	position:absolute;
	*position:relative;
	
}

.input-rounded-button {
	/*
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    font:14px sans-serif;
	background-color:rgb(128,127,131);
	color:white; 
	font-weight:900;
    border: 1px solid black;
    padding-top:5px;
	padding-bottom:5px;
	padding-left:10px;
	padding-right:10px;
    display:inline-block;

	*/
	
/*	background:url('https://meetingsandevents.jpmorganchase.com/metron/%28medialibrary%29/55216dc5-b073-46a4-ad56-76a32f8a1939/meetings/55ba504b-1d33-42b4-9672-bbf69c122708/images/login.gif'); */
	height:25px;
	width:75px;
    text-decoration:none;
    cursor:pointer;
	margin-top:2px;
}

/*
.input-rounded-button:hover { 
    text-decoration:none; 
    cursor:pointer;
	background-color:rgb(56,54,56);
}
*/


</STYLE>




<SCRIPT TYPE="text/javascript">
function setPass() {
    document.getElementById('placeholder').style.display = 'none';
    document.getElementById('password').style.display = 'inline';
    document.getElementById('password').focus();
}
function checkPass() {
    if (document.getElementById('password').value.length == 0) {
        document.getElementById('placeholder').style.display = 'inline';
        document.getElementById('password').style.display = 'none';
    }
}
</script>

</head>

<body>
	<center>
        <div id="splash">
                 <form method="POST" action="blah.asp">
                 <div id="passwordPrompt">
                     <input type="text" id="placeholder" size="17" value="Enter the Password" onFocus="setPass();"/>
                     <input type="password" name="PASSWORD" id="password" onBlur="checkPass();" style="display: none;" size="17" />
                     <input type="hidden" value="CHECKEM" Name="STATUS" />
                     <input class="input-rounded-button"  type="submit" value="LOGIN" />
                    </div>
                 </form>
        </div>
	</center>
</body>
</html>



<%
Response.End
response.Redirect(myURL)
End If
%>


<!--Enter your the URL for your event website below in BOTH places-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>




<style type="text/css">
* 
{
	font-family:Arial,sans-serif;
}

body
{
	background-color:#666;
	text-align:center;
}

h1
{
	color:#369;
	font-size:24px;
}

#container
{
	width:800px; 
	margin:0 auto;
	border-style:solid; 
	background-color:#B8D1ED; 
	border-color:black; 
	padding:10px;
	text-align:center;
	display:table-cell;
	vertical-align:middle;
	text-align:center;
}

h1
{
	color:#369;
}
</style>

<script>
//alert(cookieValue);
</script>


</HEAD>
<body>
<div id="container">
	<h1>Please close your browser and relaunch</h1>
</div>
</BODY>
</HTML>


