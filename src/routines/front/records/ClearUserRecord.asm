ClearUserRecord:					; clears user a3's record (every field 0, WriteUserRecord)
	stz.b d0
	stz.b d0+2
	stz.b d1
	stz.b d1+2
	stz.b d2
	stz.b d2+2
	stz.b d3
	stz.b d4
	stz.b d3+2
	jmp.w WriteUserRecord
