Sub RefreshData()
    With ActiveWorkbook.Connections("ConnectionName").OLEDBConnection
      .Connection = "OLEDB;" & _
                    "Provider=SQLOLEDB.1;" & _
                    "Persist Security Info=True; " & _
                    "Initial Catalog=DatabaseName; " & _
                    "Data Source=ServerName; " & _
                    "Trusted_connection=true; " & _
                    "Use Procedure for Prepare=1; " & _
                    "Auto Translate=True; " & _
                    "Packet Size=4096; " & _
                    "Use Encryption for Data=False; " & _
                    "Tag with column collation when possible=False; " & _
                    "Use Procedure for Prepare=1; " & _
                    "Auto Translate=True; "
                    
      .CommandText = "select * from Table"
      
      .BackgroundQuery = False
      .Refresh
    End With
    
    With ActiveWorkbook.Connections("ConnectionName").OLEDBConnection
      .Connection = "OLEDB;"
      .CommandText = ";"
    End With
End Sub
