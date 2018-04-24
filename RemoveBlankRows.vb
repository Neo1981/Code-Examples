Sub foo()
  Dim r As Range, rows As Long, i As Long
  Set r = ActiveSheet.Range("A1:r50000")
  rows = r.rows.Count
  For i = rows To 1 Step (-1)
    If WorksheetFunction.CountA(r.rows(i)) = 0 Then r.rows(i).delete
  Next
End Sub
