Private Sub Manipulate()

  Sheet1.Range("E1").Value = "# of" & vbNewLine & "Attendees"
  Sheet1.Cells.EntireColumn.AutoFit
  Sheet1.Columns("B").ColumnWidth = 28.5
  Sheet1.Rows("1").RowHeight = 21
  Sheet1.Range("N:N").EntireColumn.Hidden = True
  Sheet1.Range("O:O").EntireColumn.Hidden = True
  Sheet1.Range("P:P").EntireColumn.Hidden = True
  Sheet1.Cells.EntireRow.AutoFit

  Sheet2.Range("G5", "G1000").NumberFormat = "$#,##0.00"

End Sub
