Sub RefreshData()
    With ActiveWorkbook.Connections("ConnectionName").OLEDBConnection
      .Connection = "OLEDB;Provider=SQLOLEDB.1;Persist Security Info=True;Initial Catalog=Metron;Data Source=DBSERVERPATH;Extended Properties=""Trusted_connection=false;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=LNNYPBGR84E1FF;Use Encryption for Data=False;Tag with column collation when possible=False;UID=Username;PWD=password;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=LNNYPBGR84E1FF;Use Encryption for Data=False;Tag with column collation when possible=False;"";Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=LNNYPBGR84E1FF;Use Encryption for Data=False;Tag with column collation when possible=False"
      .CommandText = "select * from Table"
      
      .BackgroundQuery = False
      .Refresh
    End With
    
    With ActiveWorkbook.Connections("ConnectionName").OLEDBConnection
      .Connection = "OLEDB;"
      .CommandText = ";"
    End With
End Sub
