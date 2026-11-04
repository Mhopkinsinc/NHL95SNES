MainScreenHDMA:						; indirect HDMA table for TM (line count, address of the layers to show)
	db $40,$4E,$36					; 64 lines
	db $05,$50,$36					; 5 lines
	db $60,$52,$36					; 96 lines
	db $0B,$50,$36					; 11 lines
	db $01,$4E,$36					; 1 line
	db $00							; end
