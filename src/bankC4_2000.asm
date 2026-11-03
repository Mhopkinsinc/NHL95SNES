; Segment bankC4_2000: data tables, then game code.
org $C42030
SPAcrosscheck:						; per direction (facedir & 7, * 2): the cross check animation: (frame,
									; time) pairs, the last time negative
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFcrosscheck,10,SPFcrosscheck,-8
.d1:								; direction 1
	dw SPFcrosscheck+1,10,SPFcrosscheck+1,-8
.d2:								; direction 2
	dw SPFcrosscheck+2,10,SPFcrosscheck+2,-8
.d3:								; direction 3
	dw SPFcrosscheck+3,10,SPFcrosscheck+3,-8
.d4:								; direction 4
	dw SPFcrosscheck+4,10,SPFcrosscheck+4,-8
.d5:								; direction 5
	dw SPFcrosscheck+5,10,SPFcrosscheck+5,-8
.d6:								; direction 6
	dw SPFcrosscheck+6,10,SPFcrosscheck+6,-8
.d7:								; direction 7
	dw SPFcrosscheck+7,10,SPFcrosscheck+7,-8
SPAsweepchk:						; per direction (facedir & 7, * 2): the sweep check
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFsweep+1,4,SPFsweep+3,8,SPFsweep+1,-4
.d1:								; direction 1
	dw SPFsweep+3,4,SPFsweep+5,8,SPFsweep+3,-4
.d2:								; direction 2
	dw SPFsweep+5,4,SPFsweep+7,8,SPFsweep+5,-4
.d3:								; direction 3
	dw SPFsweep+7,4,SPFsweep+9,8,SPFsweep+7,-4
.d4:								; direction 4
	dw SPFsweep+9,4,SPFsweep+11,8,SPFsweep+9,-4
.d5:								; direction 5
	dw SPFsweep+11,4,SPFsweep+13,8,SPFsweep+11,-4
.d6:								; direction 6
	dw SPFsweep+13,4,SPFsweep+15,8,SPFsweep+13,-4
.d7:								; direction 7
	dw SPFsweep+15,4,SPFfallfwd+1,8,SPFsweep+15,-4
SPAshoulderchkl:					; per direction (facedir & 7, * 2): the shoulder check to the left
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFshoulderl,-24
.d1:								; direction 1
	dw SPFshoulderl+1,-24
.d2:								; direction 2
	dw SPFshoulderl+2,-24
.d3:								; direction 3
	dw SPFshoulderl+3,-24
.d4:								; direction 4
	dw SPFshoulderl+4,-24
.d5:								; direction 5
	dw SPFshoulderl+5,-24
.d6:								; direction 6
	dw SPFshoulderl+6,-24
.d7:								; direction 7
	dw SPFshoulderl+7,-24
SPAshoulderchkr:					; per direction (facedir & 7, * 2): the shoulder check to the right
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFshoulderr,-24
.d1:								; direction 1
	dw SPFshoulderr+1,-24
.d2:								; direction 2
	dw SPFshoulderr+2,-24
.d3:								; direction 3
	dw SPFshoulderr+3,-24
.d4:								; direction 4
	dw SPFshoulderr+4,-24
.d5:								; direction 5
	dw SPFshoulderr+5,-24
.d6:								; direction 6
	dw SPFshoulderr+6,-24
.d7:								; direction 7
	dw SPFshoulderr+7,-24
SPAhipchkl:							; per direction (facedir & 7, * 2): the hip check to the left
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFshoulder2,-24
.d1:								; direction 1
	dw SPFshoulder2,-24
.d2:								; direction 2
	dw SPFshoulder2,-24
.d3:								; direction 3
	dw SPFshoulder2+2,-24
.d4:								; direction 4
	dw SPFshoulder2+2,-24
.d5:								; direction 5
	dw SPFshoulder2+2,-24
.d6:								; direction 6
	dw SPFshoulder2+2,-24
.d7:								; direction 7
	dw SPFshoulder2,-24
SPAhipchkr:							; per direction (facedir & 7, * 2): the hip check to the right
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFshoulder2+1,-24
.d1:								; direction 1
	dw SPFshoulder2+1,-24
.d2:								; direction 2
	dw SPFshoulder2+1,-24
.d3:								; direction 3
	dw SPFshoulder2+3,-24
.d4:								; direction 4
	dw SPFshoulder2+3,-24
.d5:								; direction 5
	dw SPFshoulder2+3,-24
.d6:								; direction 6
	dw SPFshoulder2+3,-24
.d7:								; direction 7
	dw SPFshoulder2+1,-24
SPAburst:							; per direction (facedir & 7, * 2): the speed burst
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFburst,6,SPFburst+1,6,SPFburst+2,6,SPFburst+3,-6
.d1:								; direction 1
	dw SPFburst+8,6,SPFburst+9,6,SPFburst+10,6,SPFburst+11,-6
.d2:								; direction 2
	dw SPFburst+16,6,SPFburst+17,6,SPFburst+18,6,SPFburst+19,-6
.d3:								; direction 3
	dw SPFburst+24,6,SPFburst+25,6,SPFburst+26,6,SPFburst+27,-6
.d4:								; direction 4
	dw SPFburst+32,6,SPFburst+33,6,SPFburst+34,6,SPFburst+35,-6
.d5:								; direction 5
	dw SPFburst+40,6,SPFburst+41,6,SPFburst+42,6,SPFburst+43,-6
.d6:								; direction 6
	dw SPFburst+48,6,SPFburst+49,6,SPFburst+50,6,SPFburst+51,-6
.d7:								; direction 7
	dw SPFburst+56,6,SPFburst+57,6,SPFburst+58,6,SPFburst+59,-6
SPAHold:							; per direction (facedir & 7, * 2): holding
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFHold,-30
.d1:								; direction 1
	dw SPFHold+1,-30
.d2:								; direction 2
	dw SPFHold+2,-30
.d3:								; direction 3
	dw SPFHold+3,-30
.d4:								; direction 4
	dw SPFHold+4,-30
.d5:								; direction 5
	dw SPFHold+5,-30
.d6:								; direction 6
	dw SPFHold+6,-30
.d7:								; direction 7
	dw SPFHold+7,-30
SPAHold2:							; per direction (facedir & 7, * 2): held
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFHold,-36
.d1:								; direction 1
	dw SPFHold+1,-36
.d2:								; direction 2
	dw SPFHold+2,-36
.d3:								; direction 3
	dw SPFHold+3,-36
.d4:								; direction 4
	dw SPFHold+4,-36
.d5:								; direction 5
	dw SPFHold+5,-36
.d6:								; direction 6
	dw SPFHold+6,-36
.d7:								; direction 7
	dw SPFHold+7,-36
SPAhook2:							; per direction (facedir & 7, * 2): hooked
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFhook,4,SPFhook+1,4,SPFhook,4,SPFhook+1,-4
.d1:								; direction 1
	dw SPFhook+2,4,SPFhook+3,4,SPFhook+2,4,SPFhook+3,-4
.d2:								; direction 2
	dw SPFhook+4,4,SPFhook+5,4,SPFhook+4,4,SPFhook+5,-4
.d3:								; direction 3
	dw SPFhook+6,4,SPFhook+7,4,SPFhook+6,4,SPFhook+7,-4
.d4:								; direction 4
	dw SPFhook+8,4,SPFhook+9,4,SPFhook+8,4,SPFhook+9,-4
.d5:								; direction 5
	dw SPFhook+10,4,SPFhook+11,4,SPFhook+10,4,SPFhook+11,-4
.d6:								; direction 6
	dw SPFhook+12,4,SPFhook+13,4,SPFhook+12,4,SPFhook+13,-4
.d7:								; direction 7
	dw SPFhook+14,4,SPFhook+15,4,SPFhook+14,4,SPFhook+15,-4
SPAflail:							; per direction (facedir & 7, * 2): flailing
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFskate+1,-45
.d1:								; direction 1
	dw SPFskate+9,-45
.d2:								; direction 2
	dw SPFskate+17,-45
.d3:								; direction 3
	dw SPFskate+25,-45
.d4:								; direction 4
	dw SPFskate+33,-45
.d5:								; direction 5
	dw SPFskate+41,-45
.d6:								; direction 6
	dw SPFskate+49,-45
.d7:								; direction 7
	dw SPFskate+57,-45
SPAfallfwd:							; per direction (facedir & 7, * 2): falling forward
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFfallfwd,6,SPFfallfwd+1,6,SPFfallfwd+2,6,SPFfallfwd+3,100,SPFfallfwd+4,8,SPFfallfwd+5,-8
.d1:								; direction 1
	dw SPFfallfwd+6,6,SPFfallfwd+7,6,SPFfallfwd+8,6,SPFfallfwd+9,100,SPFfallfwd+10,8,SPFfallfwd+11,-8
.d2:								; direction 2
	dw SPFfallfwd+12,6,SPFfallfwd+13,6,SPFfallfwd+14,6,SPFfallfwd+15,100,SPFfallfwd+16,8,SPFfallfwd+17,-8
.d3:								; direction 3
	dw SPFfallfwd+18,6,SPFfallfwd+19,6,SPFfallfwd+20,6,SPFfallfwd+21,100,SPFfallfwd+22,8,SPFfallfwd+23,-8
.d4:								; direction 4
	dw SPFfallfwd+24,6,SPFfallfwd+25,6,SPFfallfwd+26,6,SPFfallfwd+27,100,SPFfallfwd+28,8,SPFfallfwd+29,-8
.d5:								; direction 5
	dw SPFfallfwd+30,6,SPFfallfwd+31,6,SPFfallfwd+32,6,SPFfallfwd+33,100,SPFfallfwd+34,8,SPFfallfwd+35,-8
.d6:								; direction 6
	dw SPFfallfwd+36,6,SPFfallfwd+37,6,SPFfallfwd+38,6,SPFfallfwd+39,100,SPFfallfwd+40,8,SPFfallfwd+41,-8
.d7:								; direction 7
	dw SPFfallfwd+42,6,SPFfallfwd+43,6,SPFfallfwd+44,6,SPFfallfwd+45,100,SPFfallfwd+46,8,SPFfallfwd+47,-8
SPAfallback:						; per direction (facedir & 7, * 2): falling back
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFfallback,6,SPFfallback+1,6,SPFfallback+2,6,SPFfallback+3,100,SPFfallback+4,-8
.d1:								; direction 1
	dw SPFfallback+5,6,SPFfallback+6,6,SPFfallback+7,6,SPFfallback+8,100,SPFfallback+9,-8
.d2:								; direction 2
	dw SPFfallback+10,6,SPFfallback+11,6,SPFfallback+12,6,SPFfallback+13,100,SPFfallback+14,-8
.d3:								; direction 3
	dw SPFfallback+15,6,SPFfallback+16,6,SPFfallback+17,6,SPFfallback+18,100,SPFfallback+19,-8
.d4:								; direction 4
	dw SPFfallback+20,6,SPFfallback+21,6,SPFfallback+22,6,SPFfallback+23,100,SPFfallback+24,-8
.d5:								; direction 5
	dw SPFfallback+25,6,SPFfallback+26,6,SPFfallback+27,6,SPFfallback+28,100,SPFfallback+29,-8
.d6:								; direction 6
	dw SPFfallback+30,6,SPFfallback+31,6,SPFfallback+32,6,SPFfallback+33,100,SPFfallback+34,-8
.d7:								; direction 7
	dw SPFfallback+35,6,SPFfallback+36,6,SPFfallback+37,6,SPFfallback+38,100,SPFfallback+39,-8
SPAfaceoff:							; per direction (facedir & 7, * 2): the face off
	dw .d0,.d1,.d1,.d1,.d1,.d1,.d1,.d1
	dw 0
.d0:								; direction 0
	dw SPFsweep,2,SPFsweep+1,10,SPFskatewp+2,-6
.d1:								; directions 1-7
	dw SPFsweep+8,2,SPFsweep+9,10,SPFskatewp+34,-6
SPAfaceoffr:						; per direction (facedir & 7, * 2): the face off (r)
	dw .d0,.d1,.d1,.d1,.d1,.d1,.d1,.d1
	dw 0
.d0:								; direction 0
	dw SPFskatewp+2,-5
.d1:								; directions 1-7
	dw SPFskatewp+34,-5
SPAsiren:							; per direction (facedir & 7, * 2): the goal siren
	dw .d0,.d0,.d0,.d0,.d0,.d0,.d0,.d0
	dw 1
.d0:								; directions 0-7
	dw SPFSiren,3,SPFSiren+1,3,SPFSiren+2,3,SPFSiren+3,3,SPFSiren+4,3,SPFSiren+5,3,SPFSiren+6,3,SPFSiren+7,3
	dw SPFSiren+8,3,SPFSiren+9,3,SPFSiren+10,3,SPFSiren+11,3,SPFSiren+12,3,SPFSiren+13,-3
SPAflip:							; per direction (facedir & 7, * 2): flipping over
	dw .d0,.d0,.d0,.d0,.d4,.d4,.d4,.d4
	dw 0
.d0:								; directions 0-3
	dw $0312,6,SPFflip,6,SPFflip+1,6,SPFflip+2,6,SPFfallback+2,100,SPFfallback+3,8,SPFfallback+4,-8
.d4:								; directions 4-7
	dw $0319,6,SPFflip+3,6,SPFflip+4,6,SPFflip+5,6,SPFfallback+22,100,SPFfallback+23,8,SPFfallback+24,-8
SPAstumble:							; per direction (facedir & 7, * 2): stumbling
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFstumble,6,SPFstumble+1,6,SPFstumble+1,8,SPFstumble+2,6,SPFstumble+3,-6
.d1:								; direction 1
	dw SPFstumble+4,6,SPFstumble+5,6,SPFstumble+5,8,SPFstumble+6,6,SPFstumble+7,-6
.d2:								; direction 2
	dw SPFstumble+8,6,SPFstumble+9,6,SPFstumble+9,8,SPFstumble+10,6,SPFstumble+11,-6
.d3:								; direction 3
	dw SPFstumble+12,6,SPFstumble+13,6,SPFstumble+13,8,SPFstumble+14,6,SPFstumble+15,-6
.d4:								; direction 4
	dw SPFstumble+16,6,SPFstumble+17,6,SPFstumble+17,8,SPFstumble+18,6,SPFstumble+19,-6
.d5:								; direction 5
	dw SPFstumble+20,6,SPFstumble+21,6,SPFstumble+21,8,SPFstumble+22,6,SPFstumble+23,-6
.d6:								; direction 6
	dw SPFstumble+24,6,SPFstumble+25,6,SPFstumble+25,8,SPFstumble+26,6,SPFstumble+27,-6
.d7:								; direction 7
	dw SPFstumble+28,6,SPFstumble+29,6,SPFstumble+29,8,SPFstumble+30,6,SPFstumble+31,-6
SPAhook:							; per direction (facedir & 7, * 2): hooking
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFhook+1,-30
.d1:								; direction 1
	dw SPFhook+3,-30
.d2:								; direction 2
	dw SPFhook+3,-30
.d3:								; direction 3
	dw SPFhook+5,-30
.d4:								; direction 4
	dw SPFhook+7,-30
.d5:								; direction 5
	dw SPFhook+9,-30
.d6:								; direction 6
	dw SPFhook+9,-30
.d7:								; direction 7
	dw SPFhook+11,-30
SPAcatch:							; per direction (facedir & 7, * 2): catching the puck
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFcatch,6,SPFcatch+1,-6
.d1:								; direction 1
	dw SPFcatch+2,6,SPFcatch+3,-6
.d2:								; direction 2
	dw SPFcatch+4,6,SPFcatch+5,-6
.d3:								; direction 3
	dw SPFcatch+6,6,SPFcatch+7,-6
.d4:								; direction 4
	dw SPFcatch+8,6,SPFcatch+9,-6
.d5:								; direction 5
	dw SPFcatch+10,6,SPFcatch+11,-6
.d6:								; direction 6
	dw SPFcatch+12,6,SPFcatch+13,-6
.d7:								; direction 7
	dw SPFcatch+14,6,SPFcatch+15,-6
SPAinjury1:							; per direction (facedir & 7, * 2): the injury
	dw .d0,.d0,.d0,.d3,.d3,.d3,.d3,.d0
	dw 0
.d0:								; directions 0-2 and 7
	dw SPFinjury1,10,SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1,10,SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1
	dw 10,SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1,10,SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1,10
	dw SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1,10,SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1,-1000
.d3:								; directions 3-6
	dw SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10,SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10
	dw SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10,SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10
	dw SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10,SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10
	dw SPFinjury1+3,-1000
SPApump2:							; per direction (facedir & 7, * 2): the second fist pump
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFpump2+1,8,SPFpump2,8,SPFpump2+1,-18
.d1:								; direction 1
	dw SPFpump2+3,8,SPFpump2+2,8,SPFpump2+3,-18
.d2:								; direction 2
	dw SPFpump2+5,8,SPFpump2+4,8,SPFpump2+5,-18
.d3:								; direction 3
	dw SPFpump2+7,8,SPFpump2+6,8,SPFpump2+7,-18
.d4:								; direction 4
	dw SPFpump2+9,8,SPFpump2+8,8,SPFpump2+9,-18
.d5:								; direction 5
	dw SPFpump2+11,8,SPFpump2+10,8,SPFpump2+11,-18
.d6:								; direction 6
	dw SPFpump2+13,8,SPFpump2+12,8,SPFpump2+13,-18
.d7:								; direction 7
	dw SPFpump2+15,8,SPFpump2+14,8,SPFpump2+15,-18
SPAcelebrate:						; per direction (facedir & 7, * 2): the goal celebration
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFcelebrate,5,SPFcelebrate+1,6,SPFcelebrate+1,6,SPFcelebrate,12,SPFcelebrate+1,40,SPFcelebrate+1,-15
.d1:								; direction 1
	dw SPFcelebrate+2,5,SPFcelebrate+3,6,SPFcelebrate+3,6,SPFcelebrate+2,12,SPFcelebrate+3,40,SPFcelebrate+3
	dw -15
.d2:								; direction 2
	dw SPFcelebrate+4,5,SPFcelebrate+5,6,SPFcelebrate+5,6,SPFcelebrate+4,12,SPFcelebrate+5,40,SPFcelebrate+5
	dw -15
.d3:								; direction 3
	dw SPFcelebrate+6,5,SPFcelebrate+7,6,SPFcelebrate+7,6,SPFcelebrate+6,12,SPFcelebrate+7,40,SPFcelebrate+7
	dw -15
.d4:								; direction 4
	dw SPFcelebrate+8,5,SPFcelebrate+9,6,SPFcelebrate+9,6,SPFcelebrate+8,12,SPFcelebrate+9,40,SPFcelebrate+9
	dw -15
.d5:								; direction 5
	dw SPFcelebrate+10,5,SPFcelebrate+11,6,SPFcelebrate+11,6,SPFcelebrate+10,12,SPFcelebrate+11,40
	dw SPFcelebrate+11,-15
.d6:								; direction 6
	dw SPFcelebrate+12,5,SPFcelebrate+13,6,SPFcelebrate+13,6,SPFcelebrate+12,12,SPFcelebrate+13,40
	dw SPFcelebrate+13,-15
.d7:								; direction 7
	dw SPFcelebrate+14,5,SPFcelebrate+15,6,SPFcelebrate+15,6,SPFcelebrate+14,12,SPFcelebrate+15,40
	dw SPFcelebrate+15,-15
SPAboardfront:						; per direction (facedir & 7, * 2): checked into the boards from the front
	dw .d0,.d0,.d2,.d2,.d4,.d4,.d6,.d6
	dw 0
.d0:								; directions 0, 1
	dw SPFboardfront,6,SPFboardfront+1,6,SPFboardfront+2,6,SPFboardfront+3,75,SPFfallback+4,6,SPFfallfwd+28,6
	dw SPFfallfwd+29,-6
.d2:								; directions 2, 3
	dw SPFboardfront+4,6,SPFboardfront+5,6,SPFboardfront+6,6,SPFboardfront+7,75,SPFfallfwd+16,6,SPFfallfwd+17
	dw -6
.d4:								; directions 4, 5
	dw SPFboardfront+8,6,SPFboardfront+9,6,SPFboardfront+10,6,SPFboardfront+11,75,SPFfallback+24,6
	dw SPFfallfwd+4,6,SPFfallfwd+5,-6
.d6:								; directions 6, 7
	dw SPFboardfront+12,6,SPFboardfront+13,6,SPFboardfront+14,6,SPFboardfront+15,75,SPFfallfwd+40,6
	dw SPFfallfwd+41,-6
SPAboardback:						; per direction (facedir & 7, * 2): checked into the boards from behind
	dw .d0,.d0,.d2,.d2,.d4,.d4,.d6,.d6
	dw 0
.d0:								; directions 0, 1
	dw SPFboardback,6,SPFboardback+1,6,SPFboardback+2,6,SPFboardfront+3,75,SPFfallback+4,6,SPFfallfwd+28,6
	dw SPFfallfwd+29,-6
.d2:								; directions 2, 3
	dw SPFboardback+3,6,SPFboardback+4,6,SPFboardback+5,6,SPFboardback+6,75,SPFfallfwd+16,6,SPFfallfwd+17,-6
.d4:								; directions 4, 5
	dw SPFboardback+7,6,SPFboardback+8,6,SPFboardback+9,6,SPFboardfront+11,75,SPFfallback+24,6,SPFfallfwd+4,6
	dw SPFfallfwd+5,-6
.d6:								; directions 6, 7
	dw SPFboardback+10,6,SPFboardback+11,6,SPFboardback+12,6,SPFboardback+13,75,SPFfallfwd+40,6,SPFfallfwd+41
	dw -6
SPAboardright:						; per direction (facedir & 7, * 2): checked into the boards from the right
	dw .d0,.d0,.d2,.d2,.d4,.d4,.d6,.d6
	dw 0
.d0:								; directions 0, 1
	dw SPFboardright,6,SPFboardright+1,6,SPFboardright+2,6,SPFboardright+3,75,SPFfallfwd+4,6,SPFfallfwd+5,-6
.d2:								; directions 2, 3
	dw SPFboardright+4,6,SPFboardright+5,6,SPFboardright+6,6,SPFboardright+7,75,SPFfallback+14,6,SPFfallfwd+40
	dw 6,SPFfallfwd+41,-6
.d4:								; directions 4, 5
	dw SPFboardright+8,6,SPFboardright+9,6,SPFboardright+10,6,SPFboardright+11,75,SPFfallfwd+28,6
	dw SPFfallfwd+29,-6
.d6:								; directions 6, 7
	dw SPFboardright+12,6,SPFboardright+13,6,SPFboardright+14,6,SPFboardright+15,75,SPFfallback+34,6
	dw SPFfallfwd+16,6,SPFfallfwd+17,-6
SPAboardleft:						; per direction (facedir & 7, * 2): checked into the boards from the left
	dw .d0,.d0,.d2,.d2,.d4,.d4,.d6,.d6
	dw 0
.d0:								; directions 0, 1
	dw SPFboardleft,6,SPFboardleft+1,6,SPFboardleft+2,6,SPFboardleft+3,75,SPFfallfwd+4,6,SPFfallfwd+5,-6
.d2:								; directions 2, 3
	dw SPFboardleft+4,6,SPFboardleft+5,6,SPFboardleft+6,6,SPFboardright+7,75,SPFfallback+14,6,SPFfallfwd+40,6
	dw SPFfallfwd+41,-6
.d4:								; directions 4, 5
	dw SPFboardleft+7,6,SPFboardleft+8,6,SPFboardleft+9,6,SPFboardleft+10,75,SPFfallfwd+28,6,SPFfallfwd+29,-6
.d6:								; directions 6, 7
	dw SPFboardleft+11,6,SPFboardleft+12,6,SPFboardleft+13,6,SPFboardright+15,75,SPFfallback+34,6
	dw SPFfallfwd+16,6,SPFfallfwd+17,-6
SPAbenchcheckr:						; per direction (facedir & 7, * 2): the bench check to the right
	dw .d0,.d0,.d2,.d2,.d2,.d2,.d0,.d0
	dw 0
.d2:								; directions 2-5
	dw SPFbenchcheck+5,10,SPFbenchcheck+6,10,SPFbenchcheck+7,10,SPFbenchcheck+8,90,SPFbenchcheck+8,-20
.d0:								; directions 0, 1 and 6, 7
	dw SPFbenchcheck+4,10,SPFbenchcheck,10,SPFbenchcheck+1,10,SPFbenchcheck+2,90,SPFbenchcheck+3,-20
GlideBack:							; starts SPAglideback on player X (SetSPAFromA) unless pfalock is set
	lda.w pfalock,x
	bne .rtl
	lda.w #SPAglideback&$FFFF
	jsl.l SetSPAFromA
.rtl:								; return
	rtl
assnearest:							; called from other segments
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp3,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	stz.w temp1,x
.1:									; if position,x = 0 go to .2, if X is not puckc go to .3, d0 = $0011, ...
	lda.w position,x
	beq .2
	cpx.w puckc
	bne .3
	lda.w #$0011
	sta.b d0
	lda.w playerpad,x
	bpl .rtl
	jmp.w assinsert
.rtl:								; return
	rtl
.2:									; go to assgoalie
	jml.l assgoalie
.3:									; A = temp1,x, A - d7, temp1,x = A, if minus go to .4, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bmi .4
	jmp.w .16
.4:									; A + aioff,x, if the result >= 0 go to .5, A = $0000
	adc.w aioff,x
	bpl .5
	lda.w #$0000
.5:									; temp1,x = A, if puckc < 0 go to .6, if position,y = 0 go to .6, ...
	sta.w temp1,x
	ldy.w puckc
	bmi .6
	lda.w position,y
	beq .6
	sty.b a1
	lda.w pfteam,y
	eor.w pfteam,x
	bne .6
	jmp.w .7
.6:									; Y = a2, d2 = tmnear,y, a1 = tmnearpl,y, if d2 < 0 go to .8
	ldy.b a2
	lda.w tmnear,y
	sta.b d2
	lda.w tmnearpl,y
	sta.b a1
	lda.b d2
	bmi .8
.7:									; if X = a1 go to .8, if gmclock is not 0 go to .8, Y = a1, ...
	cpx.b a1
	beq .8
	lda.w gmclock
	bne .8
	ldy.b a1
	lda.w pflags,y
	bit.w #$1000
	bne .8
	lda.w position,y
	beq .8
	lda.w asscur,y
	cmp.w #$0015
	beq .8
	ldx.b a1
	lda.w pflags,x
	and.w #$FFFE
	sta.w pflags,x
	lda.w #$0012
	sta.b d0
	jsl.l assinsert
	ldx.b curobj
	jmp.w assexit
.8:									; d1 = $0002, if d2 >= $00E2 go to .9, d1 = 0, if position,x = 0 go to .16
	lda.w #$0002
	sta.b d1
	lda.b d2
	cmp.w #$00E2
	bcs .9
	stz.b d1
	lda.w position,x
	beq .16
.9:									; A = sflags, if $2000 bits clear go to .10, d1 - 1, d1 - 1, ...
	lda.w sflags
	bit.w #$2000
	beq .10
	dec.b d1
	dec.b d1
	jsl.l chkpk2
	bne .10
	inc.b d1
	inc.b d1
	inc.b d1
	inc.b d1
.10:								; A = $0014, A - checking,x, d0 = A, tmp0 = d1
	lda.w #$0014
	sec
	sbc.w checking,x
	sta.b d0
	lda.b d1
	sta.b tmp0
.loop:								; loop: tmp0 - 1, if the result < 0 go to .15, d0 * 2, go to .loop
	dec.b tmp0
	bmi .15
	asl.b d0
	bra .loop
.rtl2:								; return
	rtl
.11:								; if puckc < 0 go to .14, if position,y is not 0 go to .14, ...
	ldy.w puckc
	bmi .14
	lda.w position,y
	bne .14
	lda.w puckx
	sta.b d0
	lda.w #$005C
	ldy.w pfgoal,x
	bne .12
	lda.w #$FFA4
.12:								; d1 = A, a0+2 = rtss>>16, a0 = rtss&$FFFF, call skateto, ...
	sta.b d1
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss&$FFFF
	sta.b a0
	jsl.l skateto
	jmp.w check4check
.13:								; call GlideBack, go to donothing
	jsl.l GlideBack
	jmp.w donothing
.14:								; call skatetopuck, go to check4check
	jsl.l skatetopuck
	jmp.w check4check
.15:								; call randomd0, if d0 >= $0002 go to .16, temp3,x = $00F0
	jsl.l randomd0
	lda.b d0
	cmp.w #$0002
	bcs .16
	lda.w #$00F0
	sta.w temp3,x
.16:								; if playerpad,x >= 0 go to .rtl2, if gmclock is not 0 go to .13, ...
	lda.w playerpad,x
	bpl .rtl2
	lda.w gmclock
	bne .13
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0002
	bne .17
	lda.w puckc
	bmi .11
	lda.w temp3,x
	sec
	sbc.b d7
	sta.w temp3,x
	cmp.w #$0000
	bpl .11
	stz.w temp3,x
.17:								; call skatetopuckinit, A = d0, push A, A xor $FFFF, ...
	jsl.l skatetopuckinit
	pei ($83)
	lda.b d0
	pha
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.b d1
	eor.w #$FFFF
	inc a
	clc
	adc.w #$00FA
	sta.b d1
	lda.w pfgoal,x
	beq .18
	lda.b d1
	sec
	sbc.w #$01F4
	sta.b d1
.18:								; A = d0, push A, A * 2, pull A, ...
	lda.b d0
	pha
	asl a
	pla
	ror a
	sta.b d0
	lda.b d1
	pha
	asl a
	pla
	ror a
	sta.b d1
	pla
	clc
	adc.b d0
	sta.b d0
	pla
	clc
	adc.b d1
	sta.b d1
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0002
	beq .20
	lda.w pfgoal,x
	beq .19
	lda.b d1
	sec
	sbc.w #$0057
	bmi .20
	lda.w #$0048
	sta.b d1
	bra .20
.19:								; A = d1, A - $FFA9, if the result >= 0 go to .20, d1 = $FFB8
	lda.b d1
	sec
	sbc.w #$FFA9
	bpl .20
	lda.w #$FFB8
	sta.b d1
.20:								; a0+2 = rtss>>16, a0 = rtss&$FFFF, call skateto, go to check4check
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss&$FFFF
	sta.b a0
	jsl.l skateto
	jmp.w check4check
burst:								; check button: a speed burst in the facing direction that costs energy
									; (getpde / setpde), then SetSPAFromA
	lda.w pfalock,x
	beq .1
	rtl
.1:									; call getpde, if OptLine = 0 go to .2, A = d0, A - $00CC, ...
	jsl.l getpde
	lda.w OptLine
	beq .2
	lda.b d0
	sec
	sbc.w #$00CC
	sta.b d0
	jsl.l setpde
	lda.w OptLine
	cmp.w #$0002
	bne .2
	lda.w #$1000
	sta.b d0
.2:									; r2 = 0, r2+2 = 0, A = d0, A * 2, ...
	stz.b r2
	stz.b r2+2
	lda.b d0
	asl a
	sta.b $35
	stz.b r0+2
	asl a
	asl a
	asl a
	rol.b r0+2
	asl a
	rol.b r0+2
	asl a
	rol.b r0+2
	adc.b r2
	sta.b r2
	lda.b r0+2
	adc.b r2+2
	sta.b $B1
	lda.w facedir,x
	asl a
	asl a
	tay
	lda.w #dirtab>>16
	sta.b a0+2
	lda.w #dirtab&$FFFF
	sta.b a0
	lda.b [a0],y
	iny
	iny
	tax
	lda.b $B1
	jsl.l Mul8XS
	ldx.b a3
	clc
	adc.w Xvel,x
	sta.w Xvel,x
	lda.b [a0],y
	tax
	lda.b $B1
	jsl.l Mul8XS
	ldx.b a3
	clc
	adc.w Yvel,x
	sta.w Yvel,x
	lda.w #SPAburst&$FFFF
	sta.w pfalock,x
	jml.l SetSPAFromA
chkpk:								; return zero if player X is killing a penalty
	lda.w sflags
	and.w #$2000
	bne chkpk2
	inc a
	rtl
chkpk2:								; from chkpk, assnearest and other segments
	lda.w pfteam,x
	bne .1
	lda.w sflags
	and.w #$4000
	eor.w #$4000
	rtl
.1:									; A = sflags, A and $4000, return
	lda.w sflags
	and.w #$4000
	rtl
asspuckc:							; assignment (asstab entry 17): the puck carrier; others and pad players
									; leave through assexit
	cpx.w puckc
	bne .1
	lda.w playerpad,x
	bmi PuckCarrierThink
.1:									; go to assexit
	jmp.w assexit
	rtl								; unreached: no code branches, falls or points here
PuckCarrierGlideStopped:			; start backward glide and stand still while play is stopped
	jsl.l GlideBack
	jmp.w donothing
PuckCarrierThink:					; update the computer puck carrier decisions and skating target
	lda.w gmclock
	bne PuckCarrierGlideStopped
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	lda.w seed
	and.w #$0003
	sta.w temp3,x
.1:									; A = temp1,x, A - d7, temp1,x = A, if plus go to .5, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl .5
	adc.w aioff,x
	bpl .2
	lda.w #$0000
.2:									; temp1,x = A, call checkob, if breakaway = 0 go to .4, d0 = Ypos,x, ...
	sta.w temp1,x
	jsl.l checkob
	lda.w breakaway
	beq .4
	lda.w Ypos,x
	sta.b d0
	bpl .3
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.3:									; if A - $0096 >= 0 go to .4, d0 = $0010, call assreplace, go to .rtl
	cmp.w #$0096
	bpl .4
	lda.w #$0010
	sta.b d0
	jsl.l assreplace
	bra .rtl
.4:									; call chk4lc, call chk4shot, if asscur,x is not $0011 go to .5, ...
	jsl.l chk4lc
	jsl.l chk4shot
	lda.w asscur,x
	cmp.w #$0011
	bne .5
	jsl.l chk4pass
.5:									; A = $0006, A + temp3,x, d0 = A, a0+2 = asspuckc_postab>>16, ...
	lda.w #$0006
	clc
	adc.w temp3,x
	sta.b d0
	lda.w #asspuckc_postab>>16
	sta.b a0+2
	lda.w #asspuckc_postab&$FFFF
	sta.b a0
	lda.w sflags
	bit.w #$8000
	beq .6
	lda.w position,x
	sta.b d0
.6:									; A = d0, A * 2, A * 2, Y = A, ...
	lda.b d0
	asl a
	asl a
	tay
	lda.b [a0],y
	sta.b d0
	iny
	iny
	lda.b [a0],y
	sta.b d1
	lda.w pfgoal,x
	bne .7
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.7:									; a0+2 = PuckCarrierAvoidThreats>>16, a0 = PuckCarrierAvoidThreats, ...
									; skateto
	lda.w #PuckCarrierAvoidThreats>>16
	sta.b a0+2
	lda.w #PuckCarrierAvoidThreats
	sta.b a0
	jml.l skateto
.rtl:								; return
	rtl
PuckCarrierAvoidThreats:			; count opponents near the predicted puck position and adjust skating
									; direction
	lda.b d0
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:									; d0 = A, A = Xvel+1,x, A and $00FF, if $0080 bits clear go to .2, ...
	sta.b d0
	lda.w Xvel+1,x
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:									; A + puckx, d2 = A, A = Yvel+1,x, A and $00FF, ...
	clc
	adc.w puckx
	sta.b d2
	lda.w Yvel+1,x
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:									; A + pucky, d3 = A, threat = 0, d4 = $0005, ...
	clc
	adc.w pucky
	sta.b d3
	stz.w threat
	lda.w #$0005
	sta.b d4
	stz.b a0
	cpx.w #$000C
	bcs .loop
	lda.w #$000C
	sta.b a0
.loop:								; loop: Y = a0, A = Xvel+1,y, A and $00FF, ...
	ldy.b a0
	lda.w Xvel+1,y
	and.w #$00FF
	bit.w #$0080
	beq .4
	ora.w #$FF00
.4:									; A + Xpos,y, A - d2, if A - $FFEB < 0 go to .6, ...
	clc
	adc.w Xpos,y
	sec
	sbc.b d2
	cmp.w #$FFEB
	bmi .6
	cmp.w #$0015
	bpl .6
	lda.w Yvel+1,y
	and.w #$00FF
	bit.w #$0080
	beq .5
	ora.w #$FF00
.5:									; A + Ypos,y, A - d3, if A - $FFEB < 0 go to .6, ...
	clc
	adc.w Ypos,y
	sec
	sbc.b d3
	cmp.w #$FFEB
	bmi .6
	cmp.w #$0015
	bpl .6
	inc.w threat
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	jsl.l vtoa
	lda.w facedir,x
	eor.w #$0004
	cmp.b d0
	bne .6
	lda.w seed+2
	and.w #$0001
	clc
	adc.b d0
	and.w #$0007
	sta.b d0
.6:									; a0 + 1, a0 + 1, d4 - 1, if the result < 0 go to .rtl, ...
	inc.b a0
	inc.b a0
	dec.b d4
	bmi .rtl
	jmp.w .loop
.rtl:								; return
	rtl
asscentero:							; called from other segments
	cpx.w puckc
	beq .2
	ldy.w puckc
	bmi .3
	lda.w pfteam,x
	cmp.w pfteam,y
	beq .3
	lda.w #$0005
	sta.b d0
	jmp.w assreplace
.rtl:								; return
	rtl
.1:									; go to donothing
	jmp.w donothing
.2:									; d0 = $0011, go to assinsert
	lda.w #$0011
	sta.b d0
	jmp.w assinsert
.3:									; if gmclock is not 0 go to .1, call check4bench, ...
	lda.w gmclock
	bne .1
	jsl.l check4bench
	lda.w playerpad,x
	bpl .rtl
	lda.w pflags,x
	bit.w #$0002
	beq .4
	and.w #$FFFD
	sta.w pflags,x
	lda.w #$FFFF
	sta.w temp5,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
.4:									; A = temp1,x, A - d7, temp1,x = A, if minus go to .5, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bmi .5
	jmp.w .10
.5:									; A + aidef,x, if the result >= 0 go to .6, A = $0000
	clc
	adc.w aidef,x
	bpl .6
	lda.w #$0000
.6:									; temp1,x = A, d0 = pucky, if pfgoal,x is not 0 go to .7, A = $0000, ...
	sta.w temp1,x
	lda.w pucky
	sta.b d0
	lda.w pfgoal,x
	bne .7
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
.7:									; d2 = 0, A = d0, A - $FFA4, if the result < 0 go to .8, ...
	stz.b d2
	lda.b d0
	sec
	sbc.w #$FFA4
	bmi .8
	lda.w #$0008
	sta.b d2
	lda.b d0
	sec
	sbc.w #$005C
	bmi .8
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .8
	asl.b d2
	lda.b d0
	sec
	sbc.w #$010E
	bmi .8
	lda.w #$0018
	sta.b d2
.8:									; if d2 is not temp5,x go to .9, if seed+2 >= $0200 go to .10
	lda.b d2
	cmp.w temp5,x
	bne .9
	lda.w seed+2
	cmp.w #$0200
	bcs .10
.9:									; temp5,x = d2, Y = A, a0+2 = CenterOSpots>>16, a0 = CenterOSpots, ...
	lda.b d2
	sta.w temp5,x
	tay
	lda.w #CenterOSpots>>16
	sta.b a0+2
	lda.w #CenterOSpots
	sta.b a0
	iny
	iny
	lda.b [a0],y
	dey
	dey
	jsl.l randomd0s
	adc.b [a0],y
	sta.w temp3,x
	tya
	clc
	adc.w #$0006
	tay
	lda.b [a0],y
	dey
	dey
	jsl.l randomd0s
	adc.b [a0],y
	sta.w temp4,x
.10:								; d0 = temp3,x, d1 = temp4,x, if pfgoal,x is not 0 go to .11, ...
	lda.w temp3,x
	sta.b d0
	lda.w temp4,x
	sta.b d1
	lda.w pfgoal,x
	bne .11
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.11:								; a0+2 = EvadePC>>16, a0 = EvadePC&$FFFF, go to skateto
	lda.w #EvadePC>>16
	sta.b a0+2
	lda.w #EvadePC&$FFFF
	sta.b a0
	jml.l skateto
	rtl								; unreached: no code branches, falls or points here
CenterOSpots:						; the centre's spots on offence, read by asscentero
	db $00,$00,$3C,$00,$BA,$FF,$0A,$00,$00,$00,$3C,$00,$3C,$00,$0A,$00
	db $00,$00,$28,$00,$AA,$00,$1E,$00,$00,$00,$50,$00,$AA,$00,$14,$00
asscenterd:							; called from other segments
	ldy.w puckc
	bmi .2
	lda.w pfteam,x
	cmp.w pfteam,y
	bne .2
	lda.w #$0006
	sta.b d0
	jmp.w assreplace
.rtl:								; return
	rtl
.1:									; go to donothing
	jmp.w donothing
.2:									; if gmclock is not 0 go to .1, call check4bench, ...
	lda.w gmclock
	bne .1
	jsl.l check4bench
	lda.w playerpad,x
	bpl .rtl
	lda.w pflags,x
	bit.w #$0002
	beq .3
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
.3:									; A = temp1,x, A - d7, temp1,x = A, if plus go to .4, ...
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl .4
	lda.w aidef,x
	sta.w temp1,x
.4:									; A = puckx, push A, A * 2, pull A, ...
	lda.w puckx
	pha
	asl a
	pla
	ror a
	sta.b d0
	lda.w #$0084
	sta.b d1
	lda.w pfgoal,x
	beq CenterDefenceTopTarget
	lda.w #$FF7C
	sta.b d1
	lda.w #$FFA4
	sec
	sbc.w pucky
	bpl CenterDefenceSkate
	lda.w #$FF7C
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b d1
	bra CenterDefenceSkate
	rtl								; unreached: no code branches, falls or points here
CenterDefenceTopTarget:				; adjust the defensive center target toward the puck at the top end
	lda.w #$005C
	sec
	sbc.w pucky
	bmi CenterDefenceSkate
	lda.b d1
	clc
	adc.w pucky
	pha
	asl a
	pla
	ror a
	sta.b d1
CenterDefenceSkate:					; skate the defensive center toward d0 and d1 with an empty callback
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss&$FFFF
	sta.b a0
	jmp.w skateto
