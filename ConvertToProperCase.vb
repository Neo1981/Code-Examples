'The following code will convert an entire column of text to Proper Case starting from row 4

  Dim j As Range
  Dim k As Range
  
  With ActiveSheet
  
  For Each j In .Range(.Range("j4"), .Range("i4").End(xlDown))
      j = StrConv(j, vbProperCase)
  Next
  
  For Each k In .Range(.Range("k4"), .Range("i4").End(xlDown))
      k = StrConv(k, vbProperCase)
  Next
      
  End With
  
  
  'Convert to proper case across entire workbook
  
    Dim j As Range
    
    
    Dim mySheet As Worksheet
    
    For Each mySheet In Worksheets
    
        With mySheet
            For Each j In .Range(.Range("g2"), .Range("i2").End(xlDown))
                j = StrConv(j, vbProperCase)
            Next
        End With
    
    Next mySheet
  
