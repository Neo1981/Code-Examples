Private Sub RefreshAllPivotTables()
  Dim w As Worksheet, p As PivotTable
        For Each w In ThisWorkbook.Worksheets
            For Each p In w.PivotTables
            p.RefreshTable
            p.Update
        Next
    Next
End Sub
