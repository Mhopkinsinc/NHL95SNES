; Segment bankCF_F000: the rest of the frame code, the layout data (size words, record pointers, records),
; two routines the top layouts jump to, then zeros to the end of the ROM.
org $CFF0CB
SmallPieces2:						; two 8 x 8 pieces: their x / y bytes, the tile counter + 1, then
									; PutSmallPiece2
	ldx.b $E5
	lda.l $CF0001,x
	and.w #$00FF
	sta.b $E7
	lda.l $CF0002,x
	and.w #$00FF
	sta.b $EF
	lda.l $CF0003,x
	and.w #$00FF
	sta.b $E9
	lda.l $CF0004,x
	and.w #$00FF
	sta.b $F1
	inc.b tmp1
	jmp.w PutSmallPiece2
SmallPieces3:						; three 8 x 8 pieces: their x / y bytes, the tile counter + 2, then
									; PutSmallPiece3
	ldx.b $E5
	lda.l $CF0001,x
	and.w #$00FF
	sta.b $E7
	lda.l $CF0002,x
	and.w #$00FF
	sta.b $EF
	lda.l $CF0003,x
	and.w #$00FF
	sta.b $E9
	lda.l $CF0004,x
	and.w #$00FF
	sta.b $F1
	lda.l $CF0005,x
	and.w #$00FF
	sta.b $EB
	lda.l $CF0006,x
	and.w #$00FF
	sta.b $F3
	lda.b tmp1
	inc a
	inc a
	sta.b tmp1
	jmp.w PutSmallPiece3
SmallPieces4:						; four 8 x 8 pieces: their x / y bytes, the tile counter + 3, the fourth
									; piece's sprite, then PutSmallPiece3
	ldx.b $E5
	lda.l $CF0001,x
	and.w #$00FF
	sta.b $E7
	lda.l $CF0002,x
	and.w #$00FF
	sta.b $EF
	lda.l $CF0003,x
	and.w #$00FF
	sta.b $E9
	lda.l $CF0004,x
	and.w #$00FF
	sta.b $F1
	lda.l $CF0005,x
	and.w #$00FF
	sta.b $EB
	lda.l $CF0006,x
	and.w #$00FF
	sta.b $F3
	lda.l $CF0007,x
	and.w #$00FF
	sta.b $ED
	lda.l $CF0008,x
	and.w #$00FF
	sta.b $F5
	clc
	lda.b tmp1
	adc.w #$0003
	sta.b tmp1
	lda.b tmp1
	pha
	dec a
	sta.b tmp1
	ldx.w #$0000
	clc
	lda.b $ED
	adc.b $0A
	bpl .1
	cmp.w #$FFF9
	bcc .2
	inx
	and.w #$00FF
.1:									; if A >= $0100 go to .2, tmp0 = A, A = $F5, A + $0C, ...
	cmp.w #$0100
	bcs .2
	sta.b tmp0
	lda.b $F5
	adc.b $0C
	bpl .3
	cmp.w #$FFF9
	and.w #$00FF
	bcs .4
.2:									; pull A, go to PutSmallPiece3
	pla
	bra PutSmallPiece3
.3:									; if A >= $00E0 go to .2
	cmp.w #$00E0
	bcs .2
.4:									; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
PutSmallPiece3:						; the third 8 x 8 piece's sprite (tile tmp1, x $EB / y $F3) when on
									; screen, then PutSmallPiece2
	lda.b tmp1
	pha
	dec a
	sta.b tmp1
	ldx.w #$0000
	clc
	lda.b $EB
	adc.b $0A
	bpl .1
	cmp.w #$FFF9
	bcc .2
	inx
	and.w #$00FF
.1:									; if A >= $0100 go to .2, tmp0 = A, A = $F3, A + $0C, ...
	cmp.w #$0100
	bcs .2
	sta.b tmp0
	lda.b $F3
	adc.b $0C
	bpl .3
	cmp.w #$FFF9
	and.w #$00FF
	bcs .4
.2:									; pull A, go to PutSmallPiece2
	pla
	bra PutSmallPiece2
.3:									; if A >= $00E0 go to .2
	cmp.w #$00E0
	bcs .2
.4:									; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
PutSmallPiece2:						; the second 8 x 8 piece's sprite (x $E9 / y $F1), then PutSmallPiece1
	lda.b tmp1
	pha
	dec a
	sta.b tmp1
	ldx.w #$0000
	clc
	lda.b $E9
	adc.b $0A
	bpl .1
	cmp.w #$FFF9
	bcc .2
	inx
	and.w #$00FF
.1:									; if A >= $0100 go to .2, tmp0 = A, A = $F1, A + $0C, ...
									; ...
	cmp.w #$0100
	bcs .2
	sta.b tmp0
	lda.b $F1
	adc.b $0C
	bpl .3
	cmp.w #$FFF9
	and.w #$00FF
	bcs .4
.2:									; pull A, go to PutSmallPiece1
	pla
	bra PutSmallPiece1
.3:									; if A >= $00E0 go to .2
	cmp.w #$00E0
	bcs .2
.4:									; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
PutSmallPiece1:						; the first 8 x 8 piece's sprite (x $E7 / y $EF), then LayoutDone
	pei ($A1)
	ldx.w #$0000
	clc
	lda.b $E7
	adc.b $0A
	bpl .1
	cmp.w #$FFF9
	bcc .2
	inx
	and.w #$00FF
.1:									; if A >= $0100 go to .2, tmp0 = A, A = $EF, A + $0C, ...
	cmp.w #$0100
	bcs .2
	sta.b tmp0
	lda.b $EF
	adc.b $0C
	bpl .3
	cmp.w #$FFF9
	and.w #$00FF
	bcs .4
.2:									; pull A, go to LayoutDone
	pla
	bra LayoutDone
.3:									; if A >= $00E0 go to .2
	cmp.w #$00E0
	bcs .2
.4:									; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
LayoutDone:							; the end of a frame layout: on to the caller's continuation in $A5
	jmp ($00A5)
LayoutSizes:						; per layout (the high byte of a FrameBankLayout word) a size word:
									; QueueFrameTiles queues two transfers of twice its low byte, then one of
									; its high byte (zero parts skipped)
	dw $0000,$8080,$8080,$6080,$6080,$6080,$6080,$8080
	dw $8080,$8080,$8080,$6080,$6080,$8080,$8080,$8080
	dw $8080,$8080,$8080,$8080,$8080,$8080,$8080,$8080
	dw $8080,$8080,$8080,$8080,$8080,$6080,$6080,$8080
	dw $8080,$8080,$8080,$8080,$8080,$8080,$8080,$8080
	dw $8080,$0020,$0020,$0040,$0040,$8080,$8080,$8080
	dw $8080,$8080,$8080,$8080,$8080,$8080,$8080,$8080
	dw $8080,$6080,$6080,$8080,$8080,$8080,$8080,$6080
	dw $6080,$8080,$8080,$6080,$6080,$8080,$8080,$6080
	dw $6080,$8080,$8080,$8080,$8080,$6080,$6080,$6080
	dw $6080,$4080,$4080,$6080,$6080,$8080,$8080,$2080
	dw $2080,$8080,$8080,$4080,$4080,$8080,$8080,$8080
	dw $8080,$6080,$6080,$8080,$8080,$6080,$6080,$4080
	dw $4080,$2080,$2080,$4080,$4080,$8060,$8060,$6080
	dw $6080,$6080,$6080,$8080,$8080,$8080,$8080,$4080
	dw $4080,$8080,$8080,$2000,$2000,$0080,$0080,$2080
	dw $2080,$8080,$8080,$8080,$8080,$2060,$2060,$0080
	dw $0080,$8080,$8080,$8080,$8080,$0060,$0060,$0080
	dw $0080,$2000
	dw $2000						; LayoutPointers-2 (layout 0): never read
LayoutPointers:						; per layout a pointer in this bank: entries 0-141 a layout record (its
									; first byte picks the handler in LayoutBigPieces), 142-145 code the frame
									; code jumps to
	dw Layout000&$FFFF,Layout001&$FFFF,Layout002&$FFFF,Layout003&$FFFF
	dw Layout004&$FFFF,Layout005&$FFFF,Layout006&$FFFF,Layout007&$FFFF
	dw Layout008&$FFFF,Layout009&$FFFF,Layout010&$FFFF,Layout011&$FFFF
	dw Layout012&$FFFF,Layout013&$FFFF,Layout014&$FFFF,Layout015&$FFFF
	dw Layout016&$FFFF,Layout017&$FFFF,Layout018&$FFFF,Layout019&$FFFF
	dw Layout020&$FFFF,Layout021&$FFFF,Layout022&$FFFF,Layout023&$FFFF
	dw Layout024&$FFFF,Layout025&$FFFF,Layout026&$FFFF,Layout027&$FFFF
	dw Layout028&$FFFF,Layout029&$FFFF,Layout030&$FFFF,Layout031&$FFFF
	dw Layout032&$FFFF,Layout033&$FFFF,Layout034&$FFFF,Layout035&$FFFF
	dw Layout036&$FFFF,Layout037&$FFFF,Layout038&$FFFF,Layout039&$FFFF
	dw Layout040&$FFFF,Layout040&$FFFF,Layout042&$FFFF,Layout043&$FFFF
	dw Layout044&$FFFF,Layout045&$FFFF,Layout046&$FFFF,Layout047&$FFFF
	dw Layout048&$FFFF,Layout049&$FFFF,Layout050&$FFFF,Layout051&$FFFF
	dw Layout052&$FFFF,Layout053&$FFFF,Layout054&$FFFF,Layout055&$FFFF
	dw Layout056&$FFFF,Layout057&$FFFF,Layout058&$FFFF,Layout059&$FFFF
	dw Layout060&$FFFF,Layout061&$FFFF,Layout062&$FFFF,Layout063&$FFFF
	dw Layout064&$FFFF,Layout065&$FFFF,Layout066&$FFFF,Layout067&$FFFF
	dw Layout068&$FFFF,Layout069&$FFFF,Layout070&$FFFF,Layout071&$FFFF
	dw Layout072&$FFFF,Layout073&$FFFF,Layout074&$FFFF,Layout075&$FFFF
	dw Layout076&$FFFF,Layout077&$FFFF,Layout078&$FFFF,Layout079&$FFFF
	dw Layout080&$FFFF,Layout081&$FFFF,Layout082&$FFFF,Layout083&$FFFF
	dw Layout084&$FFFF,Layout085&$FFFF,Layout086&$FFFF,Layout087&$FFFF
	dw Layout088&$FFFF,Layout089&$FFFF,Layout090&$FFFF,Layout091&$FFFF
	dw Layout092&$FFFF,Layout093&$FFFF,Layout094&$FFFF,Layout095&$FFFF
	dw Layout096&$FFFF,Layout097&$FFFF,Layout098&$FFFF,Layout099&$FFFF
	dw Layout100&$FFFF,Layout101&$FFFF,Layout102&$FFFF,Layout103&$FFFF
	dw Layout104&$FFFF,Layout105&$FFFF,Layout106&$FFFF,Layout107&$FFFF
	dw Layout108&$FFFF,Layout109&$FFFF,Layout110&$FFFF,Layout111&$FFFF
	dw Layout112&$FFFF,Layout113&$FFFF,Layout114&$FFFF,Layout115&$FFFF
	dw Layout116&$FFFF,Layout117&$FFFF,Layout118&$FFFF,Layout119&$FFFF
	dw Layout120&$FFFF,Layout121&$FFFF,Layout122&$FFFF,Layout123&$FFFF
	dw Layout124&$FFFF,Layout125&$FFFF,Layout126&$FFFF,Layout127&$FFFF
	dw Layout128&$FFFF,Layout129&$FFFF,Layout130&$FFFF,Layout131&$FFFF
	dw Layout132&$FFFF,Layout133&$FFFF,Layout134&$FFFF,Layout135&$FFFF
	dw Layout136&$FFFF,Layout137&$FFFF,Layout138&$FFFF,Layout139&$FFFF
	dw Layout140&$FFFF,Layout141&$FFFF,GoalFrameLayout&$FFFF,GoalFrameLayout&$FFFF
	dw PuckFrameLayout&$FFFF,PuckFrameLayout&$FFFF
Layout000:							; the layout record of LayoutPointers entry 0: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$20,$09,$10,$00,$10,$10,$00,$00,$06,$30,$13,$20,$19,$2F,$1B
	db $08,$10
Layout001:							; the layout record of LayoutPointers entry 1: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$08,$09,$18,$00,$18,$10,$28,$00,$06,$00,$13,$10,$19,$01,$1B
	db $28,$10
Layout002:							; the layout record of LayoutPointers entry 2: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$12,$00,$11,$10,$15,$20,$05,$20,$04,$0A,$08,$1D,$30,$00,$30
Layout003:							; the layout record of LayoutPointers entry 3: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$03,$00,$04,$10,$00,$20,$10,$20,$04,$13,$08,$00,$30,$1D,$30
Layout004:							; the layout record of LayoutPointers entry 4: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$18,$05,$18,$15,$08,$00,$08,$10,$04,$00,$02,$28,$14,$28,$0C
Layout005:							; the layout record of LayoutPointers entry 5: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$08,$05,$08,$15,$18,$00,$18,$10,$04,$28,$02,$00,$14,$00,$0C
Layout006:							; the layout record of LayoutPointers entry 6: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$30,$08,$20,$08,$10,$07,$00,$07,$06,$40,$10,$20,$00,$40,$08
	db $28,$00
Layout007:							; the layout record of LayoutPointers entry 7: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$08,$08,$18,$08,$28,$07,$38,$07,$06,$00,$10,$20,$00,$00,$08
	db $18,$00
Layout008:							; the layout record of LayoutPointers entry 8: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$18,$09,$18,$19,$08,$00,$08,$10,$06,$28,$0D,$28,$20,$30,$20
	db $00,$05
Layout009:							; the layout record of LayoutPointers entry 9: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$09,$10,$19,$20,$00,$20,$10,$06,$08,$0D,$08,$20,$00,$20
	db $30,$05
Layout010:							; the layout record of LayoutPointers entry 10: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$20,$08,$10,$08,$20,$18,$10,$18,$04,$24,$00,$08,$08,$00,$07
Layout011:							; the layout record of LayoutPointers entry 11: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$08,$10,$08,$00,$18,$10,$18,$04,$04,$00,$20,$08,$28,$07
Layout012:							; the layout record of LayoutPointers entry 12: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$20,$08,$10,$06,$10,$16,$00,$12,$06,$2B,$00,$20,$1B,$08,$0A
	db $08,$22
Layout013:							; the layout record of LayoutPointers entry 13: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$03,$08,$13,$06,$13,$16,$23,$12,$06,$00,$00,$0B,$1B,$23,$0A
	db $23,$22
Layout014:							; the layout record of LayoutPointers entry 14: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$30,$14,$20,$0B,$10,$09,$00,$00,$06,$28,$1B,$10,$01,$20,$1B
	db $18,$19
Layout015:							; the layout record of LayoutPointers entry 15: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$14,$10,$0B,$20,$09,$30,$00,$06,$10,$1B,$28,$01,$18,$1B
	db $20,$19
Layout016:							; the layout record of LayoutPointers entry 16: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$15,$08,$10,$18,$00,$18,$05,$08,$06,$25,$08,$2D,$08,$2D,$00
	db $25,$00
Layout017:							; the layout record of LayoutPointers entry 17: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$08,$15,$18,$25,$18,$20,$08,$06,$08,$08,$00,$08,$00,$00
	db $08,$00
Layout018:							; the layout record of LayoutPointers entry 18: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$28,$00,$18,$03,$18,$13,$08,$13,$06,$28,$10,$10,$0B,$10,$23
	db $00,$17
Layout019:							; the layout record of LayoutPointers entry 19: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$00,$10,$03,$10,$13,$20,$13,$06,$08,$10,$20,$0B,$20,$23
	db $30,$17
Layout020:							; the layout record of LayoutPointers entry 20: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$28,$08,$18,$08,$25,$18,$15,$18,$06,$27,$00,$08,$14,$10,$10
	db $00,$16
Layout021:							; the layout record of LayoutPointers entry 21: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$08,$10,$08,$03,$18,$13,$18,$06,$09,$00,$28,$14,$20,$10
	db $30,$16
Layout022:							; the layout record of LayoutPointers entry 22: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$08,$00,$08,$19,$18,$09,$18,$06,$00,$00,$1C,$28,$14,$28
	db $0C,$28
Layout023:							; the layout record of LayoutPointers entry 23: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$09,$08,$19,$08,$00,$18,$10,$18,$06,$21,$00,$05,$28,$0D,$28
	db $15,$28
Layout024:							; the layout record of LayoutPointers entry 24: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$30,$00,$18,$01,$18,$11,$08,$0E,$06,$28,$01,$28,$11,$28,$09
	db $00,$1A
Layout025:							; the layout record of LayoutPointers entry 25: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$00,$18,$01,$18,$11,$28,$0E,$06,$10,$01,$10,$11,$10,$09
	db $38,$1A
Layout026:							; the layout record of LayoutPointers entry 26: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$20,$0D,$10,$00,$10,$10,$00,$16,$06,$34,$03,$30,$0B,$20,$05
	db $10,$20
Layout027:							; the layout record of LayoutPointers entry 27: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$0C,$0D,$1C,$00,$1C,$10,$2C,$16,$06,$00,$03,$04,$0B,$14,$05
	db $24,$20
Layout028:							; the layout record of LayoutPointers entry 28: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$18,$0B,$08,$0B,$18,$1B,$08,$1B,$04,$15,$03,$00,$15,$0D,$00
Layout029:							; the layout record of LayoutPointers entry 29: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$0B,$10,$0B,$00,$1B,$10,$1B,$04,$0B,$03,$20,$15,$13,$00
Layout030:							; the layout record of LayoutPointers entry 30: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$08,$10,$08,$20,$08,$30,$08,$06,$08,$00,$10,$00,$18,$00
	db $20,$00
Layout031:							; the layout record of LayoutPointers entry 31: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$30,$08,$20,$08,$10,$08,$00,$08,$06,$30,$00,$28,$00,$20,$00
	db $18,$00
Layout032:							; the layout record of LayoutPointers entry 32: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$10,$10,$10,$20,$10,$20,$00,$06,$08,$08,$10,$08,$18,$08
	db $18,$00
Layout033:							; the layout record of LayoutPointers entry 33: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$20,$10,$10,$10,$00,$10,$00,$00,$06,$20,$08,$18,$08,$10,$08
	db $10,$00
Layout034:							; the layout record of LayoutPointers entry 34: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$28,$09,$18,$00,$18,$10,$00,$06,$06,$38,$10,$28,$01,$10,$0A
	db $10,$12
Layout035:							; the layout record of LayoutPointers entry 35: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$08,$09,$18,$00,$18,$10,$30,$06,$06,$00,$10,$10,$01,$28,$0A
	db $28,$12
Layout036:							; the layout record of LayoutPointers entry 36: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$06,$18,$0A,$08,$1A,$08,$00,$28,$06,$10,$30,$10,$28,$12,$00
	db $1A,$00
Layout037:							; the layout record of LayoutPointers entry 37: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$14,$18,$10,$08,$00,$08,$1A,$28,$06,$12,$30,$12,$28,$10,$00
	db $08,$00
Layout038:							; the layout record of LayoutPointers entry 38: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$10,$10,$00,$0A,$00,$1A,$06,$20,$00,$09,$2A,$20,$18
	db $08,$02
Layout039:							; the layout record of LayoutPointers entry 39: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$08,$00,$08,$10,$18,$0A,$18,$1A,$06,$00,$00,$17,$2A,$00,$18
	db $18,$02
Layout040:							; the layout record of LayoutPointers entries 40 and 41: 16 x 16 pieces (a
									; byte for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $00,$00,$00,$08
Layout042:							; the layout record of LayoutPointers entry 42: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $02,$10,$10,$00,$00,$08
Layout043:							; the layout record of LayoutPointers entry 43: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $02,$00,$10,$10,$00,$08
Layout044:							; the layout record of LayoutPointers entry 44: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$20,$00,$10,$10,$20,$00,$00,$06,$10,$18,$18,$10,$10,$10
	db $18,$18
Layout045:							; the layout record of LayoutPointers entry 45: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$20,$10,$10,$00,$20,$10,$00,$06,$08,$18,$00,$10,$08,$10
	db $00,$18
Layout046:							; the layout record of LayoutPointers entry 46: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$08,$18,$18,$18,$08,$08,$18,$08,$06,$00,$17,$00,$1F,$18,$00
	db $20,$00
Layout047:							; the layout record of LayoutPointers entry 47: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$18,$00,$18,$10,$08,$00,$08,$06,$20,$17,$20,$1F,$08,$00
	db $00,$00
Layout048:							; the layout record of LayoutPointers entry 48: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$20,$0B,$10,$08,$10,$18,$00,$18,$06,$18,$00,$10,$00,$08,$08
	db $08,$10
Layout049:							; the layout record of LayoutPointers entry 49: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$0B,$10,$08,$10,$18,$20,$18,$06,$10,$00,$18,$00,$20,$08
	db $20,$10
Layout050:							; the layout record of LayoutPointers entry 50: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$0A,$10,$14,$00,$10,$20,$00,$20,$06,$24,$08,$24,$00,$1A,$10
	db $1A,$18
Layout051:							; the layout record of LayoutPointers entry 51: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$12,$10,$08,$00,$0C,$20,$1C,$20,$06,$00,$08,$00,$00,$0A,$10
	db $0A,$18
Layout052:							; the layout record of LayoutPointers entry 52: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$10,$00,$10,$10,$00,$00,$00,$06,$20,$00,$20,$08,$28,$00
	db $28,$08
Layout053:							; the layout record of LayoutPointers entry 53: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$10,$20,$10,$10,$00,$20,$00,$06,$08,$00,$08,$08,$00,$00
	db $00,$08
Layout054:							; the layout record of LayoutPointers entry 54: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$00,$00,$10,$10,$00,$10,$06,$20,$18,$20,$10,$28,$18
	db $28,$10
Layout055:							; the layout record of LayoutPointers entry 55: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$20,$00,$10,$10,$20,$10,$06,$08,$18,$08,$10,$00,$18
	db $00,$10
Layout056:							; the layout record of LayoutPointers entry 56: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$16,$08,$19,$18,$09,$18,$06,$08,$04,$10,$00,$08,$00,$00,$00
Layout057:							; the layout record of LayoutPointers entry 57: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$03,$08,$00,$18,$10,$18,$13,$08,$04,$11,$00,$19,$00,$21,$00
Layout058:							; the layout record of LayoutPointers entry 58: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$18,$20,$08,$20,$10,$10,$0C,$00,$06,$04,$01,$00,$24,$00,$18
	db $08,$18
Layout059:							; the layout record of LayoutPointers entry 59: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$20,$10,$20,$08,$10,$0C,$00,$06,$1C,$01,$20,$24,$20,$18
	db $18,$18
Layout060:							; the layout record of LayoutPointers entry 60: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$18,$0E,$18,$1E,$08,$04,$08,$14,$06,$28,$1F,$00,$00,$00,$13
	db $00,$1B
Layout061:							; the layout record of LayoutPointers entry 61: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$08,$0E,$08,$1E,$18,$04,$18,$14,$06,$00,$1F,$28,$00,$28,$13
	db $28,$1B
Layout062:							; the layout record of LayoutPointers entry 62: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$20,$22,$10,$18,$10,$08,$00,$18,$04,$20,$1A,$18,$28,$0C,$00
Layout063:							; the layout record of LayoutPointers entry 63: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$22,$10,$18,$10,$08,$20,$18,$04,$08,$1A,$10,$28,$1C,$00
Layout064:							; the layout record of LayoutPointers entry 64: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$08,$0A,$28,$0A,$18,$00,$18,$10,$06,$10,$02,$00,$12,$28,$02
	db $00,$0A
Layout065:							; the layout record of LayoutPointers entry 65: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$20,$0A,$00,$0A,$10,$00,$10,$10,$06,$20,$02,$30,$12,$08,$02
	db $30,$0A
Layout066:							; the layout record of LayoutPointers entry 66: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$08,$00,$18,$00,$08,$10,$18,$10,$04,$00,$18,$00,$20,$08,$20
Layout067:							; the layout record of LayoutPointers entry 67: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$00,$00,$10,$10,$00,$10,$04,$20,$18,$20,$20,$18,$20
Layout068:							; the layout record of LayoutPointers entry 68: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$28,$16,$10,$17,$10,$07,$00,$00,$06,$20,$0C,$20,$14,$20,$1C
	db $20,$24
Layout069:							; the layout record of LayoutPointers entry 69: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$16,$18,$17,$18,$07,$28,$00,$06,$10,$0C,$10,$14,$10,$1C
	db $10,$24
Layout070:							; the layout record of LayoutPointers entry 70: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$00,$00,$20,$00,$00,$10,$04,$30,$08,$30,$10,$30,$18
Layout071:							; the layout record of LayoutPointers entry 71: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$18,$00,$28,$00,$08,$00,$28,$10,$04,$00,$08,$00,$10,$00,$18
Layout072:							; the layout record of LayoutPointers entry 72: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$1B,$10,$00,$10,$10,$20,$10,$06,$20,$08,$30,$10,$30,$18
	db $20,$00
Layout073:							; the layout record of LayoutPointers entry 73: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$28,$1B,$18,$00,$18,$10,$08,$10,$06,$10,$08,$00,$10,$00,$18
	db $10,$00
Layout074:							; the layout record of LayoutPointers entry 74: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$28,$09,$18,$00,$18,$10,$08,$10,$06,$10,$08,$00,$10,$00,$18
	db $10,$00
Layout075:							; the layout record of LayoutPointers entry 75: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$09,$10,$00,$10,$10,$20,$10,$06,$20,$08,$30,$10,$30,$18
	db $20,$00
Layout076:							; the layout record of LayoutPointers entry 76: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$00,$00,$10,$10,$00,$10,$04,$20,$18,$28,$1C,$30,$1E
Layout077:							; the layout record of LayoutPointers entry 77: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$18,$00,$28,$00,$18,$10,$28,$10,$04,$10,$18,$08,$1C,$00,$1E
Layout078:							; the layout record of LayoutPointers entry 78: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$00,$00,$10,$10,$00,$10,$04,$20,$1A,$24,$22,$27,$2A
Layout079:							; the layout record of LayoutPointers entry 79: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$0F,$00,$1F,$00,$0F,$10,$1F,$10,$04,$07,$1A,$03,$22,$00,$2A
Layout080:							; the layout record of LayoutPointers entry 80: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$00,$00,$10,$10,$00,$10,$02,$1B,$20,$23,$20
Layout081:							; the layout record of LayoutPointers entry 81: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$0B,$00,$1B,$00,$0B,$10,$1B,$10,$02,$08,$20,$00,$20
Layout082:							; the layout record of LayoutPointers entry 82: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$00,$10,$10,$10,$20,$0A,$04,$08,$00,$08,$08,$30,$13
Layout083:							; the layout record of LayoutPointers entry 83: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$18,$00,$28,$10,$18,$10,$08,$0A,$04,$28,$00,$28,$08,$00,$13
Layout084:							; the layout record of LayoutPointers entry 84: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$08,$00,$18,$09,$08,$10,$08,$20,$06,$28,$0C,$00,$0B,$00,$13
	db $00,$1B
Layout085:							; the layout record of LayoutPointers entry 85: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$18,$00,$08,$09,$18,$10,$18,$20,$06,$00,$0C,$28,$0B,$28,$13
	db $28,$1B
Layout086:							; the layout record of LayoutPointers entry 86: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$20,$02,$10,$00,$10,$10,$00,$10,$00,$08,$08
Layout087:							; the layout record of LayoutPointers entry 87: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$02,$10,$00,$10,$10,$20,$10,$00,$20,$08
Layout088:							; the layout record of LayoutPointers entry 88: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$20,$10,$10,$10,$00,$0A,$06,$20,$00,$20,$08,$28,$08
	db $28,$00
Layout089:							; the layout record of LayoutPointers entry 89: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$00,$10,$10,$10,$20,$0A,$06,$08,$00,$08,$08,$00,$08
	db $00,$00
Layout090:							; the layout record of LayoutPointers entry 90: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$20,$10,$10,$10,$00,$0A,$02,$20,$00,$20,$08
Layout091:							; the layout record of LayoutPointers entry 91: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$10,$00,$00,$10,$10,$10,$20,$0A,$02,$08,$00,$08,$08
Layout092:							; the layout record of LayoutPointers entry 92: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$20,$08,$10,$08,$20,$18,$10,$18,$06,$20,$00,$18,$00,$08,$0E
	db $00,$0E
Layout093:							; the layout record of LayoutPointers entry 93: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$08,$10,$08,$00,$18,$10,$18,$06,$08,$00,$10,$00,$20,$0E
	db $28,$0E
Layout094:							; the layout record of LayoutPointers entry 94: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$28,$09,$18,$00,$18,$10,$08,$10,$06,$2F,$01,$10,$08,$00,$10
	db $00,$18
Layout095:							; the layout record of LayoutPointers entry 95: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$09,$10,$00,$10,$10,$20,$10,$06,$01,$01,$20,$08,$30,$10
	db $30,$18
Layout096:							; the layout record of LayoutPointers entry 96: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$28,$09,$18,$00,$18,$10,$08,$10,$04,$10,$08,$00,$10,$00,$18
Layout097:							; the layout record of LayoutPointers entry 97: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$00,$09,$10,$00,$10,$10,$20,$10,$04,$20,$08,$30,$10,$30,$18
Layout098:							; the layout record of LayoutPointers entry 98: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$18,$04,$18,$14,$08,$04,$08,$14,$06,$00,$13,$00,$1B,$28,$00
	db $00,$0B
Layout099:							; the layout record of LayoutPointers entry 99: 16 x 16 pieces (a byte for
									; LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y pairs),
									; then the 8 x 8 ones
	db $06,$08,$04,$08,$14,$18,$04,$18,$14,$06,$28,$13,$28,$1B,$00,$00
	db $28,$0B
Layout100:							; the layout record of LayoutPointers entry 100: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$10,$20,$10,$10,$10,$00,$00,$00,$04,$08,$10,$08,$18,$08,$20
Layout101:							; the layout record of LayoutPointers entry 101: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$20,$00,$10,$00,$00,$10,$00,$04,$10,$10,$10,$18,$10,$20
Layout102:							; the layout record of LayoutPointers entry 102: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$20,$10,$10,$10,$08,$00,$18,$00,$02,$30,$10,$00,$00
Layout103:							; the layout record of LayoutPointers entry 103: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$08,$10,$18,$10,$20,$00,$10,$00,$02,$00,$10,$30,$00
Layout104:							; the layout record of LayoutPointers entry 104: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$20,$00,$10,$10,$20,$00,$00,$00,$10,$18
Layout105:							; the layout record of LayoutPointers entry 105: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$10,$20,$10,$10,$00,$20,$10,$00,$00,$08,$18
Layout106:							; the layout record of LayoutPointers entry 106: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$18,$18,$18,$08,$08,$18,$08,$08,$02,$00,$0D,$19,$00
Layout107:							; the layout record of LayoutPointers entry 107: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$18,$00,$08,$10,$18,$10,$08,$02,$20,$0D,$07,$00
Layout108:							; the layout record of LayoutPointers entry 108: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $04,$10,$08,$00,$08,$10,$18,$06,$18,$28,$10,$28,$08,$18,$08,$00
Layout109:							; the layout record of LayoutPointers entry 109: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $04,$00,$08,$10,$08,$00,$18,$06,$00,$28,$08,$28,$10,$18,$10,$00
Layout110:							; the layout record of LayoutPointers entry 110: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$00,$10,$00,$00,$10,$10,$10,$04,$00,$20,$08,$20,$10,$20
Layout111:							; the layout record of LayoutPointers entry 111: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$10,$00,$00,$00,$10,$10,$00,$10,$04,$18,$20,$10,$20,$08,$20
Layout112:							; the layout record of LayoutPointers entry 112: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$18,$00,$18,$10,$08,$00,$08,$10,$04,$00,$00,$00,$08,$00,$10
Layout113:							; the layout record of LayoutPointers entry 113: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$00,$00,$10,$10,$00,$10,$10,$04,$20,$00,$20,$08,$20,$10
Layout114:							; the layout record of LayoutPointers entry 114: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$08,$10,$08,$01,$18,$11,$18,$06,$16,$00,$0E,$00,$04,$28
	db $11,$28
Layout115:							; the layout record of LayoutPointers entry 115: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$11,$08,$01,$08,$10,$18,$00,$18,$06,$03,$00,$0B,$00,$15,$28
	db $08,$28
Layout116:							; the layout record of LayoutPointers entry 116: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$11,$10,$01,$10,$10,$20,$00,$20,$06,$18,$00,$18,$08,$15,$30
	db $08,$30
Layout117:							; the layout record of LayoutPointers entry 117: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$10,$10,$10,$01,$20,$11,$20,$06,$01,$00,$01,$08,$04,$30
	db $11,$30
Layout118:							; the layout record of LayoutPointers entry 118: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$20,$10,$10,$10,$00,$10,$09,$00,$02,$30,$17,$01,$08
Layout119:							; the layout record of LayoutPointers entry 119: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$08,$10,$18,$10,$28,$10,$1F,$00,$02,$00,$17,$2F,$08
Layout120:							; the layout record of LayoutPointers entry 120: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$00,$10,$00,$00,$10,$10,$10,$06,$0F,$20,$0F,$28,$07,$20
	db $07,$28
Layout121:							; the layout record of LayoutPointers entry 121: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$10,$00,$00,$00,$10,$10,$00,$10,$06,$09,$20,$09,$28,$11,$20
	db $11,$28
Layout122:							; the layout record of LayoutPointers entry 122: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $08,$00,$00,$00
Layout123:							; the layout record of LayoutPointers entry 123: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $08,$00,$00,$00
Layout124:							; the layout record of LayoutPointers entry 124: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$10,$00,$00,$00,$10,$10,$00,$10,$08
Layout125:							; the layout record of LayoutPointers entry 125: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$00,$10,$00,$00,$10,$10,$10,$08
Layout126:							; the layout record of LayoutPointers entry 126: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$10,$00,$00,$00,$10,$10,$00,$10,$00,$20,$18
Layout127:							; the layout record of LayoutPointers entry 127: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$08,$00,$18,$00,$08,$10,$18,$10,$00,$00,$18
Layout128:							; the layout record of LayoutPointers entry 128: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$10,$08,$00,$08,$13,$18,$03,$18,$06,$02,$00,$0A,$00,$12,$28
	db $0A,$28
Layout129:							; the layout record of LayoutPointers entry 129: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$03,$08,$13,$08,$00,$18,$10,$18,$06,$19,$00,$11,$00,$09,$28
	db $11,$28
Layout130:							; the layout record of LayoutPointers entry 130: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$13,$02,$03,$02,$10,$12,$00,$12,$06,$2B,$00,$23,$00,$2B,$08
	db $23,$08
Layout131:							; the layout record of LayoutPointers entry 131: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$10,$02,$20,$02,$13,$12,$23,$12,$06,$00,$00,$08,$00,$00,$08
	db $08,$08
Layout132:							; the layout record of LayoutPointers entry 132: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $04,$00,$00,$00,$10,$10,$06,$00,$10,$16
Layout133:							; the layout record of LayoutPointers entry 133: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $04,$10,$00,$10,$10,$00,$06,$00,$08,$16
Layout134:							; the layout record of LayoutPointers entry 134: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$00,$00,$10,$10,$06,$10,$16,$08
Layout135:							; the layout record of LayoutPointers entry 135: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$10,$00,$10,$10,$00,$06,$00,$16,$08
Layout136:							; the layout record of LayoutPointers entry 136: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$30,$14,$18,$17,$18,$07,$08,$00,$06,$28,$0C,$28,$14,$28,$1C
	db $00,$01
Layout137:							; the layout record of LayoutPointers entry 137: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$14,$18,$17,$18,$07,$28,$00,$06,$10,$0C,$10,$14,$10,$1C
	db $38,$01
Layout138:							; the layout record of LayoutPointers entry 138: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$40,$0A,$30,$0A,$20,$00,$20,$10,$06,$00,$07,$10,$07,$08,$07
	db $18,$07
Layout139:							; the layout record of LayoutPointers entry 139: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $06,$00,$0A,$10,$0A,$20,$00,$20,$10,$06,$48,$07,$38,$07,$40,$07
	db $30,$07
Layout140:							; the layout record of LayoutPointers entry 140: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $04,$10,$00,$10,$10,$00,$06,$08
Layout141:							; the layout record of LayoutPointers entry 141: 16 x 16 pieces (a byte
									; for LayoutBigPieces, 0-6 for 1-4 pieces or 8 for none, then x / y
									; pairs), then the 8 x 8 ones
	db $04,$00,$00,$00,$10,$10,$06,$08
GoalFrameLayout:					; the layout code of the second net, SPFgoal+1 (layouts $8F / $90): its 16
									; x 16 pieces at fixed offsets, then on through $A5
	pei ($A3)
	ldx.w #$0002
	lda.b $0A
	bpl .1
	cmp.w #$FFF1
	bcc .2
	inx
	and.w #$00FF
.1:									; if A >= $0100 go to .2, tmp0 = A, if $0C >= 0 go to .3, ...
	cmp.w #$0100
	bcs .2
	sta.b tmp0
	lda.b $0C
	bpl .3
	cmp.w #$FFF1
	and.w #$00FF
	bcs .4
.2:									; pull A, go to .5
	pla
	bra .5
.3:									; if A >= $00E0 go to .2
	cmp.w #$00E0
	bcs .2
.4:									; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.5:									; A = tmp2, A + $0002, push A, X = $0002, ...
	clc
	lda.b tmp2
	adc.w #$0002
	pha
	ldx.w #$0002
	clc
	lda.w #$0010
	adc.b $0A
	bpl .6
	cmp.w #$FFF1
	bcc .7
	inx
	and.w #$00FF
.6:									; if A >= $0100 go to .7, tmp0 = A, if $0C >= 0 go to .8, ...
	cmp.w #$0100
	bcs .7
	sta.b tmp0
	lda.b $0C
	bpl .8
	cmp.w #$FFF1
	and.w #$00FF
	bcs .9
.7:									; pull A, go to .10
	pla
	bra .10
.8:									; if A >= $00E0 go to .7
	cmp.w #$00E0
	bcs .7
.9:									; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.10:								; A = tmp2, A + $0004, push A, X = $0002, ...
	clc
	lda.b tmp2
	adc.w #$0004
	pha
	ldx.w #$0002
	lda.b $0A
	bpl .11
	cmp.w #$FFF1
	bcc .12
	inx
	and.w #$00FF
.11:								; if A >= $0100 go to .12, tmp0 = A, A = $0010, A + $0C, ...
	cmp.w #$0100
	bcs .12
	sta.b tmp0
	lda.w #$0010
	adc.b $0C
	bpl .13
	cmp.w #$FFF1
	and.w #$00FF
	bcs .14
.12:								; pull A, go to .15
	pla
	bra .15
.13:								; if A >= $00E0 go to .12
	cmp.w #$00E0
	bcs .12
.14:								; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.15:								; A = tmp2, A + $0006, push A, X = $0002, ...
	clc
	lda.b tmp2
	adc.w #$0006
	pha
	ldx.w #$0002
	clc
	lda.w #$0010
	adc.b $0A
	bpl .16
	cmp.w #$FFF1
	bcc .17
	inx
	and.w #$00FF
.16:								; if A >= $0100 go to .17, tmp0 = A, A = $0010, A + $0C, ...
	cmp.w #$0100
	bcs .17
	sta.b tmp0
	lda.w #$0010
	adc.b $0C
	bpl .18
	cmp.w #$FFF1
	and.w #$00FF
	bcs .19
.17:								; pull A, go to .20
	pla
	bra .20
.18:								; if A >= $00E0 go to .17
	cmp.w #$00E0
	bcs .17
.19:								; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.20:								; A = tmp2, A + $4000, push A, X = $0002, ...
	clc
	lda.b tmp2
	adc.w #$4000
	pha
	ldx.w #$0002
	clc
	lda.w #$002D
	adc.b $0A
	bpl .21
	cmp.w #$FFF1
	bcc .22
	inx
	and.w #$00FF
.21:								; if A >= $0100 go to .22, tmp0 = A, if $0C >= 0 go to .23, ...
	cmp.w #$0100
	bcs .22
	sta.b tmp0
	lda.b $0C
	bpl .23
	cmp.w #$FFF1
	and.w #$00FF
	bcs .24
.22:								; pull A, go to .25
	pla
	bra .25
.23:								; if A >= $00E0 go to .22
	cmp.w #$00E0
	bcs .22
.24:								; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.25:								; A = tmp2, A + $4002, push A, X = $0002, ...
	clc
	lda.b tmp2
	adc.w #$4002
	pha
	ldx.w #$0002
	clc
	lda.w #$001D
	adc.b $0A
	bpl .26
	cmp.w #$FFF1
	bcc .27
	inx
	and.w #$00FF
.26:								; if A >= $0100 go to .27, tmp0 = A, if $0C >= 0 go to .28, ...
	cmp.w #$0100
	bcs .27
	sta.b tmp0
	lda.b $0C
	bpl .28
	cmp.w #$FFF1
	and.w #$00FF
	bcs .29
.27:								; pull A, go to .30
	pla
	bra .30
.28:								; if A >= $00E0 go to .27
	cmp.w #$00E0
	bcs .27
.29:								; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.30:								; A = tmp2, A + $4004, push A, X = $0002
	clc
	lda.b tmp2
	adc.w #$4004
	pha
	ldx.w #$0002
	clc
	lda.w #$002D
	adc.b $0A
	bpl .31
	cmp.w #$FFF1
	bcc .32
	inx
	and.w #$00FF
.31:								; if A >= $0100 go to .32, tmp0 = A, A = $0010, A + $0C, ...
	cmp.w #$0100
	bcs .32
	sta.b tmp0
	lda.w #$0010
	adc.b $0C
	bpl .33
	cmp.w #$FFF1
	and.w #$00FF
	bcs .34
.32:								; pull A, go to .35
	pla
	bra .35
.33:								; if A >= $00E0 go to .32
	cmp.w #$00E0
	bcs .32
.34:								; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.35:								; A = tmp2, A + $4006, push A, X = $0002, ...
	clc
	lda.b tmp2
	adc.w #$4006
	pha
	ldx.w #$0002
	clc
	lda.w #$001D
	adc.b $0A
	bpl .36
	cmp.w #$FFF1
	bcc .37
	inx
	and.w #$00FF
.36:								; if A >= $0100 go to .37, tmp0 = A, A = $0010, A + $0C, ...
	cmp.w #$0100
	bcs .37
	sta.b tmp0
	lda.w #$0010
	adc.b $0C
	bpl .38
	cmp.w #$FFF1
	and.w #$00FF
	bcs .39
.37:								; pull A, go to .40
	pla
	bra .40
.38:								; if A >= $00E0 go to .37
	cmp.w #$00E0
	bcs .37
.39:								; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.40:								; jump through $00A5
	jmp ($00A5)
PuckFrameLayout:					; the layout code of the flipping puck, SPFpuck+1 to +10 (layouts $91 /
									; $92): one 8 x 8 piece raised by puckz * 3 / 2, then on through $A5
	pei ($A1)
	ldx.w #$0000
	lda.b $0A
	bpl .1
	cmp.w #$FFF9
	bcc .2
	inx
	and.w #$00FF
.1:									; if A >= $0100 go to .2, tmp0 = A, A = puckz, A * 2, ...
	cmp.w #$0100
	bcs .2
	sta.b tmp0
	lda.w puckz
	asl a
	adc.w puckz
	lsr a
	eor.w #$FFFF
	sec
	adc.b $0C
	bpl .3
	cmp.w #$FFF9
	and.w #$00FF
	bcs .4
.2:									; pull A, go to .5
	pla
	bra .5
.3:									; if A >= $00E0 go to .2
	cmp.w #$00E0
	bcs .2
.4:									; A or tmp0, push A, $00,y = X, Y + 1
	xba
	ora.b tmp0
	pha
	stx.b $00,y
	iny
.5:									; jump through $00A5
	jmp ($00A5)
	padbyte $00						; unused to the end of the ROM
	pad $D00000
