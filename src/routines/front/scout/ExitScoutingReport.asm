ExitScoutingReport:					; fades out the scouting report and sound, disables HDMA and resets
									; sprites
	jsl.l SoundVolumeDown
	jsl.l FadeOutWait
	stz.w DMAEnShadow
	jsl.l WaitTransfers
	jsl.l ClearNMIHook
	jml.l ResetSprites
