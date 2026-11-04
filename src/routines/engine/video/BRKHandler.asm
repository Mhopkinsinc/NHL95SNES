BRKHandler:							; BRK vector: a cop, so the COP vector (NullInterrupt) returns past it;
									; the fill comes after it
	cop #$00
	padbyte $CD						; unused up to the extended header
	pad $C0FFB0
