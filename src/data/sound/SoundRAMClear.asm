SoundRAMClear:						; sound CPU program as upload blocks (length, sound RAM address, bytes;
									; length 0 ends with the start address): sent before the sound driver,
									; it silences the DSP, clears sound RAM and returns to the boot ROM
	dw .end-.code,.start
.code:								; the block's bytes
	arch spc700
	base $0020
.start:								; DSP muted, echo buffer set, sound RAM above the program cleared
	clrp
	mov.b SPC_DSPADDR,#DSP_FLG
	mov.b SPC_DSPDATA,#$FF			; reset, mute, echo writes off
	mov.b SPC_DSPADDR,#DSP_ESA
	mov.b SPC_DSPDATA,#$20			; echo buffer page
	mov.b SPC_DSPADDR,#DSP_EDL
	mov.b SPC_DSPDATA,#$01			; echo delay
	mov a,#$00
	mov y,#$FE						; pages to clear
	mov x,a
.loop:								; clear a page; the store's high address byte is the page number
	mov $0100+x,a
	inc x
	bne .loop
	inc.b .loop+2					; next page
	dec y
	bne .loop
	mov.b SPC_DSPADDR,#DSP_EVOLL	; echo and main volumes 0
	mov.b SPC_DSPDATA,a
	mov.b SPC_DSPADDR,#DSP_EVOLR
	mov.b SPC_DSPDATA,a
	mov.b SPC_DSPADDR,#DSP_MVOLL
	mov.b SPC_DSPDATA,a
	mov.b SPC_DSPADDR,#DSP_MVOLR
	mov.b SPC_DSPDATA,a
	mov.b SPC_CONTROL,#$B0			; boot ROM on, ports cleared, timers off
	pcall SPC_IPLROM-$FF00			; boot ROM: wait for the next upload
	base off
	arch 65816
.end:								; end block: start at .start
	dw $0000,.start
spcQueueWrite = $00					; write index of spcQueue
spcQueueRead = $01					; read index of spcQueue
spcArg0 = $0D						; port 0 when the command came
spcArg1 = $0E						; port 1
spcArg2 = $0F						; port 2
spcCmdIndex = $10					; the command number times 2
spcControl = $18					; what the command loop writes to SPC_CONTROL
spcENDX = $19						; DSP_ENDX at the last tick
spcStatus = $20						; port 2 status: bit 7 busy, bit 6 in the tick
spcQueue = $FF80					; queued commands, 4 bytes each: three arguments and the command
spcTcallVectors = $FFC0				; the tcall vectors, in the RAM under the boot ROM
