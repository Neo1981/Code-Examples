Sub PushSQL




'Get values from 2 key variables: member number and program recommendation
set var1 = ActiveDocument.Variables("vMBRNBR")
lvMBRNBR = var1.GetContent.String
set var2 = ActiveDocument.Variables("vPR")
lvPR = var2.GetContent.String

'define variables for connection
dim sConn, oConn

'setup connection via DSN and update member's program recommendation
Set oConn = CreateObject("ADODB.Connection")
sConn = "dsn=PDWUSER;"
oConn.Open sConn
sSQL="update DATABASE.[dbo].TABLE set COLUMN='"&lvPR&"' where PRIMARYKEY='"&lvMBRNBR&"'"
oConn.Execute(sSQL)
oConn.Close
Set oConn = Nothing

msgbox "***DATABASE UPDATE COMPLETE**"& vbNewLine & vbNewLine & "Member "&lvMBRNBR&" is now updated and assigned to program "&lvPR&". "& vbNewLine & vbNewLine &"Thank you, " & vbNewLine & "ACA Team"

end sub
