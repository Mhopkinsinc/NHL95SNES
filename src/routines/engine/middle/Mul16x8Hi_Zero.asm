Mul16x8Hi_Zero:						; the zero result of the Mul16x8Hi forms: r2+1 = 0, pull Y
	stz.b r2+1
	ply
	rtl
