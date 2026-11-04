ExtHeader:							; extended cartridge header (CartHeader says it is there)
	db "69"							; maker code: Electronic Arts
	db "ANHE"						; game code
	db $00,$00,$00,$00,$00,$00,$00	; reserved
	db $00							; expansion RAM: none
	db $00							; special version
	db $00							; cartridge sub-type
