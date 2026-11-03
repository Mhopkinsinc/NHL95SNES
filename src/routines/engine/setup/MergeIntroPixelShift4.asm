MergeIntroPixelShift4:				; shifts A right four times and merges the bits into the intro pixel
	lsr a
MergeIntroPixelShift3:				; shifts A right three times and merges the bits into the intro pixel
	lsr a
MergeIntroPixelShift2:				; shifts A right twice and merges the bits into the intro pixel
	lsr a
MergeIntroPixelShift1:				; shifts A right once and merges the bits into the intro pixel
	lsr a
	tsb.b a4
	rts
