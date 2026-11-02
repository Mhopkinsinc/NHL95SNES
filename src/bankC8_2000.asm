; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C82239
FrameTiles10D:						; the raw tiles of frame $10D (FrameTileSource / FrameBankLayout entry
									; $10D); pose not traced
	incbin "../Extracted/segments/bankC8_2000.bin":$239..$499
FrameTiles10E:						; the raw tiles of frame $10E (FrameTileSource / FrameBankLayout entry
									; $10E); pose not traced
	incbin "../Extracted/segments/bankC8_2000.bin":$499..$699
FrameTiles113:						; the raw tiles of frame $113 (FrameTileSource / FrameBankLayout entry
									; $113); pose not traced
	incbin "../Extracted/segments/bankC8_2000.bin":$699..$919
FrameTiles114:						; the raw tiles of frame $114 (FrameTileSource / FrameBankLayout entry
									; $114); pose not traced
	incbin "../Extracted/segments/bankC8_2000.bin":$919..$B99
FrameTiles115:						; the raw tiles of frame $115 (FrameTileSource / FrameBankLayout entry
									; $115); pose not traced
	incbin "../Extracted/segments/bankC8_2000.bin":$B99..$E19
FrameTiles116:						; the raw tiles of frame $116 (FrameTileSource / FrameBankLayout entry
									; $116); pose not traced
	incbin "../Extracted/segments/bankC8_2000.bin":$E19..$1000
	incbin "../Extracted/segments/bankC8_3000.bin":$0..$19
