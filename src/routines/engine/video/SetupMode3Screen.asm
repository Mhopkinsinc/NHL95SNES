SetupMode3Screen:					; sets mode 3 with BG1 and sprites, configures the maps and clears map and
									; tile VRAM
	lda.w #$0003
	sta.l BGMODE
	lda.w #$0011
	sta.l TM
	jsr.w SetBGMapRegs
	db $58,$50,$5C,$5C,$30,$00		; inline parameters
	ldy.w #$5800
	jsr.w ClearVRAM
	ldy.w #$0000
	jsr.w ClearVRAM
	rtl
