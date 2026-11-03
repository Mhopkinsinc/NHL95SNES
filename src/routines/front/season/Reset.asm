Reset:								; reset vector: native mode, decimal off, 16-bit A and index, then the
									; rest of the reset in FastROM
	sei
	clc
	xce
	rep #$39						; 16-bit A and index, decimal and carry clear
	jml.l Reset_Fast
