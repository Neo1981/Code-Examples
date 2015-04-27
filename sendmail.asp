<%
Set myMail=CreateObject("CDO.Message")
myMail.Subject="Sending email with CDO"
myMail.From="mail@jpmcmetron.com"
myMail.To="nadeemramjan@gmail.com"
myMail.CreateMHTMLBody "http://69.28.197.205/metron/(medialibrary)/55216dc5-b073-46a4-ad56-76a32f8a1939/meetings/5b6475d2-8883-44db-99a5-d9e695303d30/templates/plainBody.html"
myMail.Send
set myMail=nothing
%>
