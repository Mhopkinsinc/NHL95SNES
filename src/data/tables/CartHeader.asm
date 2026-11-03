CartHeader:							; cartridge header: the console and copiers read it
	db "NHL '95              "		; title, 21 characters
	db $31							; map mode: HiROM, FastROM
	db $02							; cartridge type: ROM, RAM and battery
	db $0A							; ROM size: 1 MB
	db $03							; SRAM size: 8 KB
	db $01							; region: North America
	db $33							; maker code follows in the extended header
	db $00							; version 1.0
	dw $7E7E						; checksum complement
	dw $8181						; checksum
	db $FF,$FF,$00,$00				; native mode vectors: 4 unused bytes
	dw NullInterrupt&$FFFF			; COP
	dw BRKHandler&$FFFF				; BRK
	dw NullInterrupt&$FFFF			; ABORT
	dw NMI&$FFFF					; NMI
	dw Reset&$FFFF					; (unused)
	dw $18A6						; IRQ: an entry in RAM (not traced)
	db "JAWA"						; emulation mode vectors: 4 unused bytes
	dw NullInterrupt&$FFFF			; COP
	dw BRKHandler&$FFFF				; (unused)
	dw NullInterrupt&$FFFF			; ABORT
	dw NMI&$FFFF					; NMI
	dw Reset&$FFFF					; RESET
	dw $18A6						; IRQ / BRK: the RAM entry
