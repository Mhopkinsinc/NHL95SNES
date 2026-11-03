SPAsiren:							; per direction (facedir & 7, * 2): the goal siren
	dw .d0,.d0,.d0,.d0,.d0,.d0,.d0,.d0
	dw 1
.d0:								; directions 0-7
	dw SPFSiren,3,SPFSiren+1,3,SPFSiren+2,3,SPFSiren+3,3,SPFSiren+4,3,SPFSiren+5,3,SPFSiren+6,3,SPFSiren+7,3
	dw SPFSiren+8,3,SPFSiren+9,3,SPFSiren+10,3,SPFSiren+11,3,SPFSiren+12,3,SPFSiren+13,-3
