SPAglideback:						; per direction (facedir & 7, * 2): gliding backwards
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFskateb+4,-8
.d1:								; direction 1
	dw SPFskateb+7,-8
.d2:								; direction 2
	dw SPFskateb+15,-8
.d3:								; direction 3
	dw SPFskateb+22,-8
.d4:								; direction 4
	dw SPFskateb+24,-8
.d5:								; direction 5
	dw SPFskateb+35,-8
.d6:								; direction 6
	dw SPFskateb+36,-8
.d7:								; direction 7
	dw SPFskateb+46,-8
