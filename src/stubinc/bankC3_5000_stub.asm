;	Segment build for bankC3_5000.asm: sets the mapping and the outside labels it uses, then includes the file
;	on its own for checking against the ROM (tools/verify_segment.sh bankC3_5000). The org is in the segment
;	file.
hirom
incsrc "../ram95s.asm"

; External addresses outside, read from the ROM. Equates only (the full build has the labels).
PhotoPalettesSTL = $CEDDCB			; the St. Louis photo set
PhotoPalettesSJ = $CECBDA			; the San Jose photo set
PhotoPalettesQUE = $CEB8A0			; the Quebec photo set
PhotoPalettesPIT = $CEA782			; the Pittsburgh photo set
PhotoPalettesPHI = $CE93D3			; the Philadelphia photo set
PhotoPalettesOTW = $CE8087			; the Ottawa photo set
PhotoPalettesNYR = $CE6D00			; the New York (NYR) photo set
PhotoPalettesNYI = $CE57BF			; the New York (NYI) photo set
PhotoPalettesNJ = $CE4585			; the New Jersey photo set
PhotoPalettesMTL = $CE31C2			; the Montreal photo set
PhotoPalettesLA = $CE1CC7			; the Los Angeles photo set
PhotoPalettesHFD = $CE09DA			; the Hartford photo set
PhotoPalettesFLA = $CDDF5E			; the Florida photo set
PhotoPalettesEDM = $CDCC79			; the Edmonton photo set
PhotoPalettesDET = $CDBA13			; the Detroit photo set
PhotoPalettesDAL = $CDA5BB			; the Dallas photo set
PhotoPalettesCHI = $CD9411			; the Chicago photo set
PhotoPalettesCGY = $CD8229			; the Calgary photo set
PhotoPalettesBUF = $CD6FF6			; the Buffalo photo set
PhotoPalettesBOS = $CD5E35			; the Boston photo set
PhotoPalettesANH = $CD4A6D			; the Anaheim photo set
PhotoPalettesWPG = $CD3879			; the Winnipeg photo set
PhotoPalettesWSH = $CD25E0			; the Washington photo set
PhotoPalettesTB = $C04CE7
PhotoPalettesTOR = $C05DAC
PhotoPalettesVAN = $C06E6D
DrawPlayModeOptions = $C592A9
PrintHomeTeamName = $C5A46A
PrintVisTeamName = $C5A3C1
SaveOptAwayPracPlayers = $C5927A
SaveOptGoalie = $C5E3F0
SaveOptHomePracPlayers = $C5924B
SaveOptLine = $C5E3C6
SaveOptPen = $C5E3D4
SaveOptPlayoffs = $C5E3AE
SaveOptRosters = $C5E40C
SaveOptUserRec = $C5E3FE
SaveOptperlen = $C5E3E2
TradeTeam1Hook = $C5A3FF
TradeTeam2Hook = $C5A356

incsrc "../bankC3_5000.asm"
