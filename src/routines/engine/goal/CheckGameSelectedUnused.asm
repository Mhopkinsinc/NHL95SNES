CheckGameSelectedUnused:			; if tmp0 bit 7 is clear, NoGameSelected, else on into ReturnToLeagueMenu;
									; nothing calls it
	bit.b tmp0
	bpl NoGameSelected
ReturnToLeagueMenu:					; drops a return address, rebuilds the setup screen (setoptions), then
									; EnterLeagueMenu: the end of a season or playoff day
	pla
	jsr.w setoptions
	jmp.w EnterLeagueMenu
