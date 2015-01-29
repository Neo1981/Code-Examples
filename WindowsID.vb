'The following will extract the WindowsUserName and can be used for verification

Public Function WindowsUser() As String
  Dim strUsername As String
  strUsername = String(100, vbNullChar)
  GetUserName strUsername, 100
  WindowsUser = Left$(strUsername, InStr(strUsername, vbNullChar) - 1)
End Function

Sub blah()

  Dim user As String
  user = WindowsUser
  MsgBox ("Thank you, " + user + " your data is now refreshed")

End Sub
