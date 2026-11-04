BG2ScrollHDMA:						; indirect HDMA table for BG2VOFS (line count, RAM address of the value):
									; 64 lines, then 1, from BG2VScroll
	db $40,$C2,$04					; 64 lines
	db $01,$C2,$04					; 1 line
	db $00							; end
