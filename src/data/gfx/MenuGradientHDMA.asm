MenuGradientHDMA:					; the menu screens' blue background: HDMA to CGADD / CGDATA, per group of
									; lines one of colours $11-$1C set to a blue (SetupHDMA, DMAP 3)
	incbin "../../../Extracted/segments/bankC0_4000.bin":$91B..$9A8
