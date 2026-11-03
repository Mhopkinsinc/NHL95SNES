MergeIntroPixelRotate4:				; rotates A left four times and merges the bits into the intro pixel
	rol a
MergeIntroPixelRotate3:				; rotates A left three times and merges the bits into the intro pixel
	rol a
MergeIntroPixelRotate2:				; rotates A left twice and merges the bits into the intro pixel
	rol a
MergeIntroPixelRotate1:				; rotates A left once and merges the bits into the intro pixel
	rol a
	tsb.b a4
	rts
