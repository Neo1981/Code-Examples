Sub Test
 set mytext = ActiveDocument.GetSheetObject("TX01")
 ActiveDocument.Variables("vTest").SetContent mytext.GetText, true
End Sub
