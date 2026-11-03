; Segment bankC4_1000: data tables (not traced yet), labelled where code reads them with a long address. After
; TeamRoundSlots come the animation lists (SPA): word pointers per direction to (frame, time) pairs.
org $C41006
BracketWin1CellX:					; per bracket cell (BracketCursorCell * 2): window 1's x on the map
	db $18,$00,$92,$00,$0A,$01,$27,$01,$EB,$01,$61,$02,$DA,$02,$18,$00
	db $92,$00,$0A,$01,$27,$01,$EB,$01,$61,$02,$DA,$02,$18,$00,$92,$00
	db $0A,$01,$27,$01,$EB,$01,$61,$02,$DA,$02,$18,$00,$92,$00,$0A,$01
	db $27,$01,$EB,$01,$61,$02,$DA,$02
BracketWin2CellX:					; per bracket cell (BracketWin2Cell * 2): window 2's x on the map; it
									; differs from window 1's only in column 3
	db $18,$00,$92,$00,$0A,$01,$C6,$01,$EB,$01,$61,$02,$DA,$02,$18,$00
	db $92,$00,$0A,$01,$C6,$01,$EB,$01,$61,$02,$DA,$02,$18,$00,$92,$00
	db $0A,$01,$C6,$01,$EB,$01,$61,$02,$DA,$02,$18,$00,$92,$00,$0A,$01
	db $C6,$01,$EB,$01,$61,$02,$DA,$02
BracketWin1CellY:					; per bracket cell (BracketCursorCell * 2): window 1's y on the map
	db $09,$00,$1D,$00,$22,$00,$4A,$00,$21,$00,$1C,$00,$09,$00,$31,$00
	db $1D,$00,$22,$00,$4A,$00,$21,$00,$1C,$00,$31,$00,$61,$00,$75,$00
	db $22,$00,$4A,$00,$21,$00,$75,$00,$61,$00,$89,$00,$75,$00,$22,$00
	db $4A,$00,$21,$00,$75,$00,$89,$00
BracketWin2CellY:					; per bracket cell (BracketWin2Cell * 2): window 2's y on the map; below
									; window 1's in columns 2 and 4
	db $09,$00,$1D,$00,$72,$00,$4A,$00,$72,$00,$1C,$00,$09,$00,$31,$00
	db $1D,$00,$72,$00,$4A,$00,$72,$00,$1C,$00,$31,$00,$61,$00,$75,$00
	db $72,$00,$4A,$00,$72,$00,$75,$00,$61,$00,$89,$00,$75,$00,$72,$00
	db $4A,$00,$72,$00,$75,$00,$89,$00
TeamBarRoundCells:					; per playoff team (SRPOTeams index * 8) and round (* 2): the rinkmapbuf
									; offset of its name bar in that round's column
	db $90,$01,$3E,$03,$EC,$04,$DA,$08,$20,$03,$3E,$03,$EC,$04,$DA,$08
	db $78,$05,$96,$05,$EC,$04,$DA,$08,$08,$07,$96,$05,$EC,$04,$DA,$08
	db $28,$0A,$D6,$0B,$BC,$0C,$DA,$08,$B8,$0B,$D6,$0B,$BC,$0C,$DA,$08
	db $10,$0E,$2E,$0E,$BC,$0C,$DA,$08,$A0,$0F,$2E,$0E,$BC,$0C,$DA,$08
	db $40,$02,$B2,$03,$24,$05,$06,$09,$D0,$03,$B2,$03,$24,$05,$06,$09
	db $28,$06,$0A,$06,$24,$05,$06,$09,$B8,$07,$0A,$06,$24,$05,$06,$09
	db $D8,$0A,$4A,$0C,$F4,$0C,$06,$09,$68,$0C,$4A,$0C,$F4,$0C,$06,$09
	db $C0,$0E,$A2,$0E,$F4,$0C,$06,$09,$50,$10,$A2,$0E,$F4,$0C,$06,$09
BracketCellSeries:					; per bracket cell (BracketCursorCell * 2: column + 7 a row, 4 rows): the
									; series it shows (0-14)
	dw $0000,$0004,$0006,$0007,$0008,$0009,$000B
	dw $0001,$0004,$0006,$0007,$0008,$0009,$000C
	dw $0002,$0005,$0006,$0007,$0008,$000A,$000D
	dw $0003,$0005,$0006,$0007,$0008,$000A,$000E
TeamRoundSlots:						; per playoff team (SRPOTeams index * 8) and round (* 2): its bracket slot
									; (BracketSlotTeams index: the series, + 15 for its second team)
	dw $0000,$0004,$0006,$0007,$000F,$0004,$0006,$0007
	dw $0001,$0013,$0006,$0007,$0010,$0013,$0006,$0007
	dw $0002,$0005,$0015,$0007,$0011,$0005,$0015,$0007
	dw $0003,$0014,$0015,$0007,$0012,$0014,$0015,$0007
	dw $000B,$0009,$0008,$0016,$001A,$0009,$0008,$0016
	dw $000C,$0018,$0008,$0016,$001B,$0018,$0008,$0016
	dw $000D,$000A,$0017,$0016,$001C,$000A,$0017,$0016
	dw $000E,$0019,$0017,$0016,$001D,$0019,$0017,$0016
SPAgready:							; per direction (facedir & 7, * 2): the goalie's ready stance
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 1
.d0:								; direction 0
	dw SPFgready,120,SPFgready+1,20,SPFgready,10,SPFgready+2,20,SPFgready,-9
.d1:								; direction 1
	dw SPFgready+3,120,SPFgready+4,20,SPFgready+3,10,SPFgready+5,20,SPFgready+3,-9
.d2:								; direction 2
	dw SPFGoalie+2,120,SPFGoalie+2,20,SPFGoalie+2,10,SPFGoalie+2,20,SPFGoalie+2,-9
.d3:								; direction 3
	dw SPFgready+6,120,SPFgready+7,20,SPFgready+6,10,SPFgready+8,20,SPFgready+6,-9
.d4:								; direction 4
	dw SPFgready+9,120,SPFgready+10,20,SPFgready+9,10,SPFgready+11,20,SPFgready+9,-9
.d5:								; direction 5
	dw SPFgready+12,120,SPFgready+13,20,SPFgready+12,10,SPFgready+14,20,SPFgready+12,-9
.d6:								; direction 6
	dw SPFGoalie+6,120,SPFGoalie+6,20,SPFGoalie+6,10,SPFGoalie+6,20,SPFGoalie+6,-9
.d7:								; direction 7
	dw SPFgready+15,120,SPFgready+16,20,SPFgready+15,10,SPFgready+17,20,SPFgready+15,-9
SPAgready2:							; per direction (facedir & 7, * 2): the goalie's second ready stance
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFGoalie,-10
.d1:								; direction 1
	dw SPFGoalie+1,-10
.d2:								; direction 2
	dw SPFGoalie+2,-10
.d3:								; direction 3
	dw SPFGoalie+3,-10
.d4:								; direction 4
	dw SPFGoalie+4,-10
.d5:								; direction 5
	dw SPFGoalie+5,-10
.d6:								; direction 6
	dw SPFGoalie+6,-10
.d7:								; direction 7
	dw SPFGoalie+7,-10
SPAgglover:							; per direction (facedir & 7, * 2): the goalie's glove save to the right
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFGoalie+16,-32
.d1:								; direction 1
	dw SPFGoalie+17,-32
.d2:								; direction 2
	dw SPFGoalie+18,-32
.d3:								; direction 3
	dw SPFGoalie+19,-32
.d4:								; direction 4
	dw SPFGoalie+20,-32
.d5:								; direction 5
	dw SPFGoalie+21,-32
.d6:								; direction 6
	dw SPFGoalie+22,-32
.d7:								; direction 7
	dw SPFGoalie+23,-32
SPAgglovel:							; per direction (facedir & 7, * 2): the goalie's glove save to the left
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFGoalie+8,-32
.d1:								; direction 1
	dw SPFGoalie+9,-32
.d2:								; direction 2
	dw SPFGoalie+10,-32
.d3:								; direction 3
	dw SPFGoalie+11,-32
.d4:								; direction 4
	dw SPFGoalie+12,-32
.d5:								; direction 5
	dw SPFGoalie+13,-32
.d6:								; direction 6
	dw SPFGoalie+14,-32
.d7:								; direction 7
	dw SPFGoalie+15,-32
SPAgstickr:							; per direction (facedir & 7, * 2): the goalie's stick save to the right
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFGoalie+32,-32
.d1:								; direction 1
	dw SPFGoalie+33,-32
.d2:								; direction 2
	dw SPFGoalie+34,-32
.d3:								; direction 3
	dw SPFGoalie+35,-32
.d4:								; direction 4
	dw SPFGoalie+36,-32
.d5:								; direction 5
	dw SPFGoalie+37,-32
.d6:								; direction 6
	dw SPFGoalie+38,-32
.d7:								; direction 7
	dw SPFGoalie+39,-32
SPAgstickl:							; per direction (facedir & 7, * 2): the goalie's stick save to the left
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFGoalie+24,-32
.d1:								; direction 1
	dw SPFGoalie+25,-32
.d2:								; direction 2
	dw SPFGoalie+26,-32
.d3:								; direction 3
	dw SPFGoalie+27,-32
.d4:								; direction 4
	dw SPFGoalie+28,-32
.d5:								; direction 5
	dw SPFGoalie+29,-32
.d6:								; direction 6
	dw SPFGoalie+30,-32
.d7:								; direction 7
	dw SPFGoalie+31,-32
SPAgstackr:							; per direction (facedir & 7, * 2): the goalie's stacked pads save to the
									; right
	dw .d0,.d1,.d1,.d3,.d4,.d5,.d5,.d7
	dw 0
.d0:								; direction 0
	dw SPFgstack+12,8,SPFgstack+13,-20
.d1:								; directions 1, 2
	dw SPFgstack+14,8,SPFgstack+15,-20
.d3:								; direction 3
	dw SPFgstack+16,8,SPFgstack+17,-20
.d4:								; direction 4
	dw SPFgstack+18,8,SPFgstack+19,-20
.d5:								; directions 5, 6
	dw SPFgstack+20,8,SPFgstack+21,-20
.d7:								; direction 7
	dw SPFgstack+22,8,SPFgstack+23,-20
SPAgstackl:							; per direction (facedir & 7, * 2): the goalie's stacked pads save to the
									; left
	dw .d0,.d1,.d1,.d3,.d4,.d5,.d5,.d7
	dw 0
.d0:								; direction 0
	dw SPFgstack,8,SPFgstack+1,-20
.d1:								; directions 1, 2
	dw SPFgstack+2,8,SPFgstack+3,-20
.d3:								; direction 3
	dw SPFgstack+4,8,SPFgstack+5,-20
.d4:								; direction 4
	dw SPFgstack+6,8,SPFgstack+7,-20
.d5:								; directions 5, 6
	dw SPFgstack+8,8,SPFgstack+9,-20
.d7:								; direction 7
	dw SPFgstack+10,8,SPFgstack+11,-20
SPAgswing:							; per direction (facedir & 7, * 2): the goalie's stick swing
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFgstack+24,5,SPFgstack+25,8,SPFgstack+24,-16
.d1:								; direction 1
	dw SPFgstack+26,5,SPFgstack+27,8,SPFgstack+26,-16
.d2:								; direction 2
	dw SPFgstack+28,5,SPFgstack+29,8,SPFgstack+28,-16
.d3:								; direction 3
	dw SPFgstack+30,5,SPFgstack+31,8,SPFgstack+30,-16
.d4:								; direction 4
	dw SPFgstack+32,5,SPFgstack+33,8,SPFgstack+32,-16
.d5:								; direction 5
	dw SPFgstack+34,5,SPFgstack+35,8,SPFgstack+34,-16
.d6:								; direction 6
	dw SPFgstack+36,5,SPFgstack+37,8,SPFgstack+36,-16
.d7:								; direction 7
	dw SPFgstack+38,5,SPFgstack+39,8,SPFgstack+38,-16
SPAgskate:							; per direction (facedir & 7, * 2): the goalie skating
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 1
.d0:								; direction 0
	dw SPFgskate,10,SPFgskate+1,10,SPFgskate+2,10,SPFgskate+3,-15
.d1:								; direction 1
	dw SPFgskate+4,10,SPFgskate+5,10,SPFgskate+6,10,SPFgskate+7,-15
.d2:								; direction 2
	dw SPFgskate+8,10,SPFgskate+9,10,SPFgskate+10,10,SPFgskate+11,-15
.d3:								; direction 3
	dw SPFgskate+12,10,SPFgskate+13,10,SPFgskate+14,10,SPFgskate+15,-15
.d4:								; direction 4
	dw SPFgskate+16,10,SPFgskate+17,10,SPFgskate+18,10,SPFgskate+19,-15
.d5:								; direction 5
	dw SPFgskate+20,10,SPFgskate+21,10,SPFgskate+22,10,SPFgskate+23,-15
.d6:								; direction 6
	dw SPFgskate+24,10,SPFgskate+25,10,SPFgskate+26,10,SPFgskate+27,-15
.d7:								; direction 7
	dw SPFgskate+28,10,SPFgskate+29,10,SPFgskate+30,10,SPFgskate+31,-15
SPAgdive:							; per direction (facedir & 7, * 2): the goalie's dive
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFgdive,8,SPFgdive+2,48,SPFgdive,-8
.d1:								; direction 1
	dw SPFgdive+3,8,SPFgdive+5,48,SPFgdive+3,-8
.d2:								; direction 2
	dw SPFgdive+6,8,SPFgdive+8,48,SPFgdive+6,-8
.d3:								; direction 3
	dw SPFgdive+9,8,SPFgdive+11,48,SPFgdive+9,-8
.d4:								; direction 4
	dw SPFgdive+12,8,SPFgdive+14,48,SPFgdive+12,-8
.d5:								; direction 5
	dw SPFgdive+15,8,SPFgdive+17,48,SPFgdive+15,-8
.d6:								; direction 6
	dw SPFgdive+18,8,SPFgdive+20,48,SPFgdive+18,-8
.d7:								; direction 7
	dw SPFgdive+21,8,SPFgdive+23,48,SPFgdive+21,-8
SPAgpoke:							; per direction (facedir & 7, * 2): the goalie's poke check
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFgskate,4,SPFgdive,15,SPFgskate,-6
.d1:								; direction 1
	dw SPFgskate+3,4,SPFgdive+3,15,SPFgskate+3,-6
.d2:								; direction 2
	dw SPFgskate+6,4,SPFgdive+6,15,SPFgskate+6,-6
.d3:								; direction 3
	dw SPFgskate+9,4,SPFgdive+9,15,SPFgskate+9,-6
.d4:								; direction 4
	dw SPFgskate+12,4,SPFgdive+12,15,SPFgskate+12,-6
.d5:								; direction 5
	dw SPFgskate+15,4,SPFgdive+15,15,SPFgskate+15,-6
.d6:								; direction 6
	dw SPFgskate+18,4,SPFgdive+18,15,SPFgskate+18,-6
.d7:								; direction 7
	dw SPFgskate+21,4,SPFgdive+21,15,SPFgskate+21,-6
SPAgcover:							; per direction (facedir & 7, * 2): the goalie covering the puck
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFgbutterfly,6,SPFgbutterfly,6,SPFgdive+2,90,SPFgbutterfly,6,SPFgbutterfly,6,SPFgbutterfly,-4
.d1:								; direction 1
	dw SPFgbutterfly,6,SPFgbutterfly,6,SPFgdive+2,90,SPFgbutterfly,6,SPFgbutterfly,6,SPFgbutterfly,-4
.d2:								; direction 2
	dw SPFgbutterfly,6,SPFgbutterfly,6,SPFgdive+2,90,SPFgbutterfly,6,SPFgbutterfly,6,SPFgbutterfly,-4
.d3:								; direction 3
	dw SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgdive+14,90,SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgbutterfly+1
	dw -4
.d4:								; direction 4
	dw SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgdive+14,90,SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgbutterfly+1
	dw -4
.d5:								; direction 5
	dw SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgdive+14,90,SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgbutterfly+1
	dw -4
.d6:								; direction 6
	dw SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgdive+14,90,SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgbutterfly+1
	dw -4
.d7:								; direction 7
	dw SPFgbutterfly,6,SPFgbutterfly,6,SPFgdive+2,90,SPFgbutterfly,6,SPFgbutterfly,6,SPFgbutterfly,-4
SPAgbutterfly:						; per direction (facedir & 7, * 2): the goalie's butterfly save
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFgbutterfly,4,SPFgbutterfly,4,SPFgskate+29,20,SPFgskate+29,-4
.d1:								; direction 1
	dw SPFgbutterfly,4,SPFgbutterfly,4,SPFgskate+29,20,SPFgskate+29,-4
.d2:								; direction 2
	dw SPFgbutterfly,4,SPFgbutterfly,4,SPFgskate+29,20,SPFgskate+29,-4
.d3:								; direction 3
	dw SPFgbutterfly+1,4,SPFgbutterfly+1,4,SPFgskate+31,20,SPFgskate+31,-4
.d4:								; direction 4
	dw SPFgbutterfly+1,4,SPFgbutterfly+1,4,SPFgskate+11,20,SPFgskate+11,-4
.d5:								; direction 5
	dw SPFgbutterfly+1,4,SPFgbutterfly+1,4,SPFgskate+31,20,SPFgskate+31,-4
.d6:								; direction 6
	dw SPFgbutterfly+1,4,SPFgbutterfly+1,4,SPFgskate+31,20,SPFgskate+31,-4
.d7:								; direction 7
	dw SPFgbutterfly,4,SPFgbutterfly,4,SPFgskate+31,20,SPFgskate+31,-4
SPAgsprawll:						; per direction (facedir & 7, * 2): the goalie's sprawl to the left
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFGoalie+8,4,SPFGoalie+8,4,SPFGoalie+8,20,SPFGoalie+8,-4
.d1:								; direction 1
	dw SPFGoalie+9,4,SPFGoalie+9,4,SPFGoalie+9,20,SPFGoalie+9,-4
.d2:								; direction 2
	dw SPFGoalie+10,4,SPFGoalie+10,4,SPFGoalie+10,20,SPFGoalie+10,-4
.d3:								; direction 3
	dw SPFGoalie+11,4,SPFGoalie+11,4,SPFGoalie+11,20,SPFGoalie+11,-4
.d4:								; direction 4
	dw SPFGoalie+12,4,SPFGoalie+12,4,SPFGoalie+12,20,SPFGoalie+12,-4
.d5:								; direction 5
	dw SPFGoalie+13,4,SPFGoalie+13,4,SPFGoalie+13,20,SPFGoalie+13,-4
.d6:								; direction 6
	dw SPFGoalie+14,4,SPFGoalie+14,4,SPFGoalie+14,20,SPFGoalie+14,-4
.d7:								; direction 7
	dw SPFGoalie+15,4,SPFGoalie+15,4,SPFGoalie+15,20,SPFGoalie+15,-4
SPAgsprawlr:						; per direction (facedir & 7, * 2): the goalie's sprawl to the right
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFGoalie,4,SPFGoalie+32,4,SPFGoalie+32,20,SPFgskate+29,-4
.d1:								; direction 1
	dw SPFGoalie+1,4,SPFGoalie+33,4,SPFGoalie+33,20,SPFgskate+29,-4
.d2:								; direction 2
	dw SPFGoalie+2,4,SPFGoalie+34,4,SPFGoalie+35,20,SPFgskate+31,-4
.d3:								; direction 3
	dw SPFGoalie+3,4,SPFGoalie+35,4,SPFGoalie+34,20,SPFgskate+31,-4
.d4:								; direction 4
	dw SPFGoalie+4,4,SPFGoalie+36,4,SPFGoalie+35,20,SPFgskate+11,-4
.d5:								; direction 5
	dw SPFGoalie+5,4,SPFGoalie+37,4,SPFGoalie+36,20,SPFgskate+31,-4
.d6:								; direction 6
	dw SPFGoalie+6,4,SPFGoalie+38,4,SPFGoalie+36,20,SPFgskate+31,-4
.d7:								; direction 7
	dw SPFGoalie+7,4,SPFGoalie+39,4,SPFGoalie+38,20,SPFgskate+29,-4
SPAwallin:							; per direction (facedir & 7, * 2): one sequence for all: SPFPen to
									; SPFPen+6 over the boards into the bench (assbench) or the penalty box
									; (asspenalty)
	dw .d0,.d0,.d0,.d0,.d0,.d0,.d0,.d0
	dw 0
.d0:								; directions 0-7
	dw SPFPen,5,SPFPen+1,5,SPFPen+2,5,SPFPen+3,5,SPFPen+4,5,SPFPen+5,5,SPFPen+6,-5
SPAwallout:							; per direction (facedir & 7, * 2): one sequence for all: SPFPen+6 back to
									; SPFPen over the boards out of the bench (asseben, and updateanim after a
									; bench check) or the penalty box (assepen)
	dw .d0,.d0,.d0,.d0,.d0,.d0,.d0,.d0
	dw 0
.d0:								; directions 0-7
	dw SPFPen+6,5,SPFPen+5,5,SPFPen+4,5,SPFPen+3,5,SPFPen+2,5,SPFPen+1,5,SPFPen,-5
SPApflip:							; per direction (facedir & 7, * 2): the puck flip
	dw .d0,.d0,.d0,.d0,.d4,.d4,.d4,.d4
	dw 1
.d0:								; directions 0-3
	dw SPFpuck+1,3,SPFpuck+2,3,SPFpuck+3,3,SPFpuck+4,3,SPFpuck+5,3,SPFpuck+6,3,SPFpuck+7,3,SPFpuck+8,3
	dw SPFpuck+9,3,SPFpuck+10,-1
.d4:								; directions 4-7
	dw SPFpuck+1,-4096
SPAglide:							; per direction (facedir & 7, * 2): gliding
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFglide,-8
.d1:								; direction 1
	dw SPFglide+1,-8
.d2:								; direction 2
	dw SPFglide+2,-8
.d3:								; direction 3
	dw SPFglide+3,-8
.d4:								; direction 4
	dw SPFglide+4,-8
.d5:								; direction 5
	dw SPFglide+5,-8
.d6:								; direction 6
	dw SPFglide+6,-8
.d7:								; direction 7
	dw SPFglide+7,-8
SPAskatewp:							; per direction (facedir & 7, * 2): skating with the puck
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFskatewp+1,10,SPFskatewp+2,10,SPFskatewp+5,10,SPFskatewp+6,10,SPFskatewp+7,-15
.d1:								; direction 1
	dw SPFskatewp+9,10,SPFskatewp+10,10,SPFskatewp+13,10,SPFskatewp+14,10,SPFskatewp+15,-15
.d2:								; direction 2
	dw SPFskatewp+17,10,SPFskatewp+18,10,SPFskatewp+21,10,SPFskatewp+22,10,SPFskatewp+23,-15
.d3:								; direction 3
	dw SPFskatewp+25,10,SPFskatewp+26,10,SPFskatewp+29,10,SPFskatewp+30,10,SPFskatewp+31,-15
.d4:								; direction 4
	dw SPFskatewp+33,10,SPFskatewp+34,10,SPFskatewp+37,10,SPFskatewp+38,10,SPFskatewp+39,-15
.d5:								; direction 5
	dw SPFskatewp+41,10,SPFskatewp+42,10,SPFskatewp+45,10,SPFskatewp+46,10,SPFskatewp+47,-15
.d6:								; direction 6
	dw SPFskatewp+49,10,SPFskatewp+50,10,SPFskatewp+53,10,SPFskatewp+54,10,SPFskatewp+55,-15
.d7:								; direction 7
	dw SPFskatewp+57,10,SPFskatewp+58,10,SPFskatewp+61,10,SPFskatewp+62,10,SPFskatewp+63,-15
SPAskate:							; per direction (facedir & 7, * 2): skating
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFskate+1,10,SPFskate+2,10,SPFskate+5,10,SPFskate+6,10,SPFskate+7,-15
.d1:								; direction 1
	dw SPFskate+9,10,SPFskate+10,10,SPFskate+13,10,SPFskate+14,10,SPFskate+15,-15
.d2:								; direction 2
	dw SPFskate+17,10,SPFskate+18,10,SPFskate+21,10,SPFskate+22,10,SPFskate+23,-15
.d3:								; direction 3
	dw SPFskate+25,10,SPFskate+26,10,SPFskate+29,10,SPFskate+30,10,SPFskate+31,-15
.d4:								; direction 4
	dw SPFskate+33,10,SPFskate+34,10,SPFskate+37,10,SPFskate+38,10,SPFskate+39,-15
.d5:								; direction 5
	dw SPFskate+41,10,SPFskate+42,10,SPFskate+45,10,SPFskate+46,10,SPFskate+47,-15
.d6:								; direction 6
	dw SPFskate+49,10,SPFskate+50,10,SPFskate+53,10,SPFskate+54,10,SPFskate+55,-15
.d7:								; direction 7
	dw SPFskate+57,10,SPFskate+58,10,SPFskate+61,10,SPFskate+62,10,SPFskate+63,-15
SPAstop:							; per direction (facedir & 7, * 2): stopping
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 1
.d0:								; direction 0
	dw SPFstop,4,SPFstop+1,-30
.d1:								; direction 1
	dw SPFstop+2,4,SPFstop+3,-30
.d2:								; direction 2
	dw SPFstop+4,4,SPFstop+5,-30
.d3:								; direction 3
	dw SPFstop+6,4,SPFstop+7,-30
.d4:								; direction 4
	dw SPFstop+8,4,SPFstop+9,-30
.d5:								; direction 5
	dw SPFstop+10,4,SPFstop+11,-30
.d6:								; direction 6
	dw SPFstop+12,4,SPFstop+13,-30
.d7:								; direction 7
	dw SPFstop+14,4,SPFstop+15,-30
SPApassf:							; per direction (facedir & 7, * 2): the forehand pass
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFswing+3,4,SPFswing+4,4,SPFswing+3,-20
.d1:								; direction 1
	dw SPFswing+8,4,SPFswing+9,4,SPFswing+8,-20
.d2:								; direction 2
	dw SPFswing+14,4,SPFswing+15,4,SPFswing+14,-20
.d3:								; direction 3
	dw SPFswing+21,4,SPFswing+22,4,SPFswing+21,-20
.d4:								; direction 4
	dw SPFswing+27,4,SPFswing+28,4,SPFswing+27,-20
.d5:								; direction 5
	dw SPFswing+33,4,SPFswing+34,4,SPFswing+33,-20
.d6:								; direction 6
	dw SPFswing+39,4,SPFswing+40,4,SPFswing+39,-20
.d7:								; direction 7
	dw SPFswing+45,4,SPFswing+46,4,SPFswing+45,-20
SPApassb:							; per direction (facedir & 7, * 2): the backhand pass
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFswingb,4,SPFswingb+1,4,SPFswingb+2,-20
.d1:								; direction 1
	dw SPFswingb+3,4,SPFswingb+4,4,SPFswingb+5,-20
.d2:								; direction 2
	dw SPFswingb+6,4,SPFswingb+7,4,SPFswingb+8,-20
.d3:								; direction 3
	dw SPFswingb+9,4,SPFswingb+10,4,SPFswingb+11,-20
.d4:								; direction 4
	dw SPFswingb+12,4,SPFswingb+13,4,SPFswingb+14,-20
.d5:								; direction 5
	dw SPFswingb+15,4,SPFswingb+16,4,SPFswingb+17,-20
.d6:								; direction 6
	dw SPFswingb+18,4,SPFswingb+19,4,SPFswingb+20,-20
.d7:								; direction 7
	dw SPFswingb+21,4,SPFswingb+22,4,SPFswingb+23,-20
SPAshotf:							; per direction (facedir & 7, * 2): the forehand shot
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFswing+1,4,SPFswing,4,SPFswing+1,4,SPFswing+2,4,SPFswing+3,0,SPFswing+4,0,SPFswing+5,0,SPFswing+3,-20
.d1:								; direction 1
	dw SPFswing+7,4,SPFswing+6,4,SPFswing+7,4,SPFswing+8,4,SPFswing+9,0,SPFswing+10,0,SPFswing+11,0,SPFswing+9
	dw -20
.d2:								; direction 2
	dw SPFswing+13,4,SPFswing+12,4,SPFswing+13,4,SPFswing+14,4,SPFswing+15,0,SPFswing+16,0,SPFswing+17,0
	dw SPFswing+15,-20
.d3:								; direction 3
	dw SPFswing+19,4,SPFswing+18,4,SPFswing+19,4,SPFswing+20,4,SPFswing+21,0,SPFswing+22,0,SPFswing+23,0
	dw SPFswing+21,-20
.d4:								; direction 4
	dw SPFswing+25,4,SPFswing+24,4,SPFswing+25,4,SPFswing+26,4,SPFswing+27,0,SPFswing+28,0,SPFswing+29,0
	dw SPFswing+27,-20
.d5:								; direction 5
	dw SPFswing+31,4,SPFswing+30,4,SPFswing+31,4,SPFswing+32,4,SPFswing+33,0,SPFswing+34,0,SPFswing+35,0
	dw SPFswing+33,-20
.d6:								; direction 6
	dw SPFswing+37,4,SPFswing+36,4,SPFswing+37,4,SPFswing+38,4,SPFswing+39,0,SPFswing+40,0,SPFswing+41,0
	dw SPFswing+39,-20
.d7:								; direction 7
	dw SPFswing+43,4,SPFswing+42,4,SPFswing+43,4,SPFswing+44,4,SPFswing+45,0,SPFswing+46,0,SPFswing+47,0
	dw SPFswing+45,-20
SPAshotb:							; per direction (facedir & 7, * 2): the backhand shot
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFswing,4,SPFswing,4,SPFswing+1,4,SPFswingb+2,4,SPFswingb+1,0,SPFswingb+1,0,SPFswingb,0,SPFswingb+1
	dw -20
.d1:								; direction 1
	dw SPFswing+6,4,SPFswing+6,4,SPFswing+7,4,SPFswingb+5,4,SPFswingb+4,0,SPFswingb+4,0,SPFswingb+3,0
	dw SPFswingb+4,-20
.d2:								; direction 2
	dw SPFswing+12,4,SPFswing+12,4,SPFswing+13,4,SPFswingb+8,4,SPFswingb+7,0,SPFswingb+7,0,SPFswingb+6,0
	dw SPFswingb+7,-20
.d3:								; direction 3
	dw SPFswing+18,4,SPFswing+18,4,SPFswing+19,4,SPFswingb+11,4,SPFswingb+10,0,SPFswingb+10,0,SPFswingb+9,0
	dw SPFswingb+10,-20
.d4:								; direction 4
	dw SPFswing+24,4,SPFswing+24,4,SPFswing+25,4,SPFswingb+14,4,SPFswingb+13,0,SPFswingb+13,0,SPFswingb+12,0
	dw SPFswingb+13,-20
.d5:								; direction 5
	dw SPFswing+30,4,SPFswing+30,4,SPFswing+31,4,SPFswingb+17,4,SPFswingb+16,0,SPFswingb+16,0,SPFswingb+15,0
	dw SPFswingb+16,-20
.d6:								; direction 6
	dw SPFswing+36,4,SPFswing+36,4,SPFswing+37,4,SPFswingb+20,4,SPFswingb+19,0,SPFswingb+19,0,SPFswingb+18,0
	dw SPFswingb+19,-20
.d7:								; direction 7
	dw SPFswing+42,4,SPFswing+42,4,SPFswing+43,4,SPFswingb+23,4,SPFswingb+22,0,SPFswingb+22,0,SPFswingb+21,0
	dw SPFswingb+22,-20
SPAonetimerf:						; per direction (facedir & 7, * 2): the one-timer forehand animation:
									; (frame, time) pairs, the last time negative
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFswing+1,27,SPFswing+2,2,SPFswing+3,2,SPFswing+4,2,SPFswing+5,-20
.d1:								; direction 1
	dw SPFswing+7,27,SPFswing+8,2,SPFswing+9,2,SPFswing+10,2,SPFswing+11,-20
.d2:								; direction 2
	dw SPFswing+13,27,SPFswing+14,2,SPFswing+15,2,SPFswing+16,2,SPFswing+17,-20
.d3:								; direction 3
	dw SPFswing+19,27,SPFswing+20,2,SPFswing+21,2,SPFswing+22,2,SPFswing+23,-20
.d4:								; direction 4
	dw SPFswing+25,27,SPFswing+26,2,SPFswing+27,2,SPFswing+28,2,SPFswing+29,-20
.d5:								; direction 5
	dw SPFswing+31,27,SPFswing+32,2,SPFswing+33,2,SPFswing+34,2,SPFswing+35,-20
.d6:								; direction 6
	dw SPFswing+37,27,SPFswing+38,2,SPFswing+39,2,SPFswing+40,2,SPFswing+41,-20
.d7:								; direction 7
	dw SPFswing+43,27,SPFswing+44,2,SPFswing+45,2,SPFswing+46,2,SPFswing+47,-20
SPAonetimerb:						; per direction (facedir & 7, * 2): the backhand one-timer
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFswingb+2,27,SPFswingb+1,4,SPFswingb,-20
.d1:								; direction 1
	dw SPFswingb+5,27,SPFswingb+4,4,SPFswingb+3,-20
.d2:								; direction 2
	dw SPFswingb+8,27,SPFswingb+7,4,SPFswingb+6,-20
.d3:								; direction 3
	dw SPFswingb+11,27,SPFswingb+10,4,SPFswingb+9,-20
.d4:								; direction 4
	dw SPFswingb+14,27,SPFswingb+13,4,SPFswingb+12,-20
.d5:								; direction 5
	dw SPFswingb+17,27,SPFswingb+16,4,SPFswingb+15,-20
.d6:								; direction 6
	dw SPFswingb+20,27,SPFswingb+19,4,SPFswingb+18,-20
.d7:								; direction 7
	dw SPFswingb+23,27,SPFswingb+22,4,SPFswingb+21,-20
SPAglideback:						; per direction (facedir & 7, * 2): gliding backwards
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFskateb+4,-8
.d1:								; direction 1
	dw SPFskateb+7,-8
.d2:								; direction 2
	dw SPFskateb+15,-8
.d3:								; direction 3
	dw SPFskateb+22,-8
.d4:								; direction 4
	dw SPFskateb+24,-8
.d5:								; direction 5
	dw SPFskateb+35,-8
.d6:								; direction 6
	dw SPFskateb+36,-8
.d7:								; direction 7
	dw SPFskateb+46,-8
SPAskateback:						; per direction (facedir & 7, * 2): skating backwards
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFskateb,4,SPFskateb+2,4,SPFskateb+3,4,SPFskateb+5,-4
.d1:								; direction 1
	dw SPFskateb+6,4,SPFskateb+8,4,SPFskateb+9,4,SPFskateb+11,-4
.d2:								; direction 2
	dw SPFskateb+12,4,SPFskateb+14,4,SPFskateb+15,4,SPFskateb+17,-4
.d3:								; direction 3
	dw SPFskateb+18,4,SPFskateb+20,4,SPFskateb+21,4,SPFskateb+23,-4
.d4:								; direction 4
	dw SPFskateb+24,4,SPFskateb+26,4,SPFskateb+27,4,SPFskateb+29,-4
.d5:								; direction 5
	dw SPFskateb+30,4,SPFskateb+32,4,SPFskateb+33,4,SPFskateb+35,-4
.d6:								; direction 6
	dw SPFskateb+36,4,SPFskateb+38,4,SPFskateb+39,4,SPFskateb+41,-4
.d7:								; direction 7
	dw SPFskateb+42,4,SPFskateb+44,4,SPFskateb+45,4,SPFskateb+47,-4
