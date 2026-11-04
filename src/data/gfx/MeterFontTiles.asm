MeterFontTiles:						; 4bpp tiles, packed: meter bars in three colours, a PwrPlay label, box
									; corners, then a font, ASCII from the space; the rink's boxes (setupice
									; and RestoreGameScreen load it for DrawScoreBox, DrawPeriodBox)
	dw $1000						; unpacked size in bytes
	dw $0006						; format 6: a flag byte per 8 literal runs or copies, up to 11 bits back
	incbin "../../../Extracted/segments/bankC0_0000.bin":$97A..$EE5
