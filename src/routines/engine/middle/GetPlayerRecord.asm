GetPlayerRecord:					; 94S's a0 lookup of player d0 of team a2, reached only from
									; PlayerShortName (never run): the team's offset table entry d0, doubled
									; and read again; it does not fit 95's packed records
	ldy.b a2
	lda.w #$00C3
	sta.b a0+2
	lda.w tmdata,y
	sta.b a0
	lda.b [a0]
	and.w #$07FF
	sta.b a0
	lda.b d0
	asl a
	tay
	lda.b [a0],y
	and.w #$3FFF
	sta.b a0
	adc.b a0
	sta.b a0
	lda.b [a0]
	sta.b a0
	rtl
