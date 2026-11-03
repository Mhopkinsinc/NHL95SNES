LineSlotHandlers:					; per line slot (A * 2: LD, RD, LW, C, RW): the routine SetLineSlot runs
									; to put the player there
	dw SetLineSlotLD,SetLineSlotRD,SetLineSlotLW,SetLineSlotC
	dw SetLineSlotRW
