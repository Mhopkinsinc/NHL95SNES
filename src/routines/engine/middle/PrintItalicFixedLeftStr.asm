PrintItalicFixedLeftStr:			; print a RAM string in italic with glyph width A
	sta.b p0
	jsl.l CopyString
	bra DrawItalicFixedLeft
