PhotoPaletteTable:					; per team (team order) a long pointer to its photo set: 6 palettes,
									; then the photos (as 94S PhotoPaletteTable); read 1-based (-4 + team x 4)
	dd PhotoPalettesANH,PhotoPalettesBOS,PhotoPalettesBUF,PhotoPalettesCGY
	dd PhotoPalettesCHI,PhotoPalettesDAL,PhotoPalettesDET,PhotoPalettesEDM
	dd PhotoPalettesFLA,PhotoPalettesHFD,PhotoPalettesLA,PhotoPalettesMTL
	dd PhotoPalettesNJ,PhotoPalettesNYI,PhotoPalettesNYR,PhotoPalettesOTW
	dd PhotoPalettesPHI,PhotoPalettesPIT,PhotoPalettesQUE,PhotoPalettesSJ
	dd PhotoPalettesSTL,PhotoPalettesTB,PhotoPalettesTOR,PhotoPalettesVAN
	dd PhotoPalettesWSH,PhotoPalettesWPG
	db $03,$F6,$F3,$AE,$05,$D7,$E9,$EE,$F3,$A1,$0A,$C9,$EE,$EA,$F5,$F2
	db $F9,$A0,$F4,$EF,$BA,$0E,$CF,$F5,$F4,$A0,$E6,$EF,$F2,$A0,$F0,$E5
	db $F2,$E9,$EF,$E4,$08,$F4,$E8,$E5,$A0,$E7,$E1,$ED,$E5,$09,$D0,$E5
	db $EE,$AE,$A0,$D3,$E8,$EF,$F4,$07,$D0,$E5,$EE,$E1,$EC,$F4,$F9,$50
	db $6C,$61,$79,$6F,$66,$66,$73,$40,$20,$44,$61,$79,$20
