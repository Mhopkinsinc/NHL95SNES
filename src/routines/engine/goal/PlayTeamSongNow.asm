PlayTeamSongNow:					; queues home team song A without polling the driver status
	phx
	sta.b tmp0
	bra StartSelectedTeamSong
