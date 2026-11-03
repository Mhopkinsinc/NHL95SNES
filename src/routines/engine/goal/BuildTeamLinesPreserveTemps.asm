BuildTeamLinesPreserveTemps:		; calls BuildTeamLines while saving and restoring its direct page
									; temporaries
	pei ($9F)
	pei ($A1)
	pei ($A3)
	pei ($A5)
	pei ($0A)
	pei ($0C)
	pei ($0E)
	pei ($10)
	pei ($12)
	pei ($14)
	pei ($2C)
	pei ($2E)
	jsr.w BuildTeamLines
	pla
	sta.w r0+2
	pla
	sta.w r0
	pla
	sta.b $14
	pla
	sta.b $12
	pla
	sta.b $10
	pla
	sta.b $0E
	pla
	sta.b $0C
	pla
	sta.b $0A
	pla
	sta.w tmp3
	pla
	sta.w tmp2
	pla
	sta.w tmp1
	pla
	sta.w tmp0
	rtl
