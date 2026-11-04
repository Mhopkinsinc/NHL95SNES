asstab:								; the assignment routines, by assignment number (as 94S asstab; the
									; first is an rtl); the code calls one through a long call patched in RAM
	dd rtss,assdefo,assdefd,asswingd
	dd asswingo,asscenterd,asscentero,assgoalie
	dd assscore,assstanley,asseben,assepen
	dd assbench,asspenalty,assdopen,assgoalietopuck
	dd assbreakaway,asspuckc,assnearest,assshoot
	dd assdumpin,asspassrec,assfaceoff,assfaceoffpl
	dd pucknorm,puckshadow,puckunflip,puckfaceoff
	dd puckfaceoff2
