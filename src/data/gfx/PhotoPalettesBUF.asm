PhotoPalettesBUF:					; Buffalo player photos: 16 colours for each of its 6 photos, then the
									; photos (PlayerPhotosBUF); the team photo table points here
	incbin "../../../Extracted/segments/bankCD_6000.bin":$FF6..$1000
	incbin "../../../Extracted/segments/bankCD_7000.bin":$0..$B6
