CheckCreateSlots:					; returns when one of the 20 created player slots is free; else the Alert
									; You have reached the maximum number of Created Players (ShowAlert)
	ldy.w #$0003
.loop:								; loop: call ReadCreatedPlayerSlotField, if A = $0000 go to .rtl, ...
	jsr.w ReadCreatedPlayerSlotField
	cmp.w #$0000
	beq .rtl
	clc
	tya
	adc.w #$009C
	tay
	cpy.w #$0C30
	bcc .loop
	pea.w $5471
	bra ShowAlert
.rtl:								; return
	rtl
