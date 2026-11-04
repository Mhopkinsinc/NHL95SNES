PenaltyManager:						; update penalty clocks, new penalties, referee progress and announcements
	jsl.l updatepentime
	jsl.l checkfornewpen
	jsl.l chkprogress
	jml.l UpdatePA
