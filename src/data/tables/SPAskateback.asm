SPAskateback:						; per direction (facedir & 7, * 2): skating backwards
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFskateb,4,SPFskateb+2,4,SPFskateb+3,4,SPFskateb+5,-4
.d1:								; direction 1
	dw SPFskateb+6,4,SPFskateb+8,4,SPFskateb+9,4,SPFskateb+11,-4
.d2:								; direction 2
	dw SPFskateb+12,4,SPFskateb+14,4,SPFskateb+15,4,SPFskateb+17,-4
.d3:								; direction 3
	dw SPFskateb+18,4,SPFskateb+20,4,SPFskateb+21,4,SPFskateb+23,-4
.d4:								; direction 4
	dw SPFskateb+24,4,SPFskateb+26,4,SPFskateb+27,4,SPFskateb+29,-4
.d5:								; direction 5
	dw SPFskateb+30,4,SPFskateb+32,4,SPFskateb+33,4,SPFskateb+35,-4
.d6:								; direction 6
	dw SPFskateb+36,4,SPFskateb+38,4,SPFskateb+39,4,SPFskateb+41,-4
.d7:								; direction 7
	dw SPFskateb+42,4,SPFskateb+44,4,SPFskateb+45,4,SPFskateb+47,-4
