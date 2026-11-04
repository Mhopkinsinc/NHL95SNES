LoadDefaultRoster:					; LoadTeamRoster from the cartridge team data: OptPlayMode and OptRosters
									; cleared around it (long calls)
	ldx.w OptRosters
	phx
	stz.w OptRosters
	ldx.w OptPlayMode
	phx
	stz.w OptPlayMode
	jsr.w LoadTeamRoster
	pla
	sta.w OptPlayMode
	pla
	sta.w OptRosters
	rtl
