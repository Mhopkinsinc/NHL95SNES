SampleVolumeOverrideLists:			; the 4 lists of sample IDs and stereo volume words (a byte of $21 or more
									; ends one) that the flag bytes $80-$83 of sequences 35-39 select;
									; LoadSequence tests the address instead, so none is ever read
	dw SampleVolumeOverrides0&$FFFF,SampleVolumeOverrides1&$FFFF,SampleVolumeOverrides2&$FFFF,SampleVolumeOverrides3&$FFFF
