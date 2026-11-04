InitHooks:							; initial FrameHook, NMIHook, IRQHook (long pointers into the bank $80
									; mirror) and the random seed
	dl $800000|(NullHook&$FFFF),$800000|(NullHook&$FFFF),$800000|(IRQHook_Off&$FFFF)
	dw $AFE5,$F527
