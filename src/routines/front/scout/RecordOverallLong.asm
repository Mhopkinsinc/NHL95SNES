RecordOverallLong:					; RecordOverall for long calls, tmp0, tmp3 and $0A kept
	pei ($9F)
	pei ($A5)
	pei ($0A)
	phy
	jsr.w RecordOverall
	ply
	plx
	stx.b $0A
	plx
	stx.b tmp3
	plx
	stx.b tmp0
	rtl
