BG3ScrollHDMA1:						; indirect HDMA table for BG3VOFS (line count, RAM address of the value),
									; copied to RAM for one screen
	db $70,$C6,$04					; 112 lines
	db $10,$C6,$04					; 16 lines
	db $10,$00,$01					; 16 lines
	db $10,$02,$01					; 16 lines
	db $10,$04,$01					; 16 lines
	db $0F,$06,$01					; 15 lines
	db $01,$08,$01					; 1 line
	db $10,$0A,$01					; 16 lines
	db $01,$C6,$04					; 1 line
	db $00							; end
BG3ScrollHDMA2:						; the same for another screen; the copy takes 28 bytes, so it ends inside
									; BG2ScrollHDMA after it
	db $40,$C6,$04					; 64 lines
	db $38,$00,$01					; 56 lines
	db $37,$02,$01					; 55 lines
	db $01,$04,$01					; 1 line
	db $08,$0A,$01					; 8 lines
	db $18,$08,$01					; 24 lines
	db $01,$06,$01					; 1 line
	db $00							; end
