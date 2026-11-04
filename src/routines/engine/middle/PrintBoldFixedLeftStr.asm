PrintBoldFixedLeftStr:				; print a RAM string in bold with glyph width A
	sta.b p0
	jsl.l CopyString
	bra DrawBoldFixedLeft
