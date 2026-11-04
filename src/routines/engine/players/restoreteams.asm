restoreteams:						; called from other segments
	stz.b a2
	jsl.l BenchTeamRoster
	lda.w #$0002
	sta.b a2
BenchTeamRoster:					; team a2: tmap 6 and every roster entry on the bench (tmpdst $FFFE)
	ldy.b a2
	lda.w #$0006
	sta.w tmap,y
	lda.w #$0032
	sta.b d0
.loop:								; loop: if a2 = 0 go to .1, A = $0034
	lda.b a2
	beq .1
	lda.w #$0034
.1:									; A + d0, Y = A, tmpdst,y = $FFFE, d0 - 1, ...
	clc
	adc.b d0
	tay
	lda.w #$FFFE
	sta.w tmpdst,y
	dec.b d0
	dec.b d0
	bpl .loop
	rtl
