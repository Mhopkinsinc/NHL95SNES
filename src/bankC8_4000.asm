; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C840F9
FrameTiles126:						; the raw tiles of frame $126 (FrameTileSource / FrameBankLayout entry
									; $126); pose not traced
	incbin "../Extracted/segments/bankC8_4000.bin":$F9..$319
FrameTiles12B:						; the raw tiles of frame $12B (FrameTileSource / FrameBankLayout entry
									; $12B); pose not traced
	incbin "../Extracted/segments/bankC8_4000.bin":$319..$579
FrameTiles12C:						; the raw tiles of frame $12C (FrameTileSource / FrameBankLayout entry
									; $12C); pose not traced
	incbin "../Extracted/segments/bankC8_4000.bin":$579..$7D9
FrameTiles12D:						; the raw tiles of frame $12D (FrameTileSource / FrameBankLayout entry
									; $12D); pose not traced
	incbin "../Extracted/segments/bankC8_4000.bin":$7D9..$A39
FrameTiles12E:						; the raw tiles of frame $12E (FrameTileSource / FrameBankLayout entry
									; $12E); pose not traced
	incbin "../Extracted/segments/bankC8_4000.bin":$A39..$C99
FrameTiles133:						; the raw tiles of frame $133 (FrameTileSource / FrameBankLayout entry
									; $133); pose not traced
	incbin "../Extracted/segments/bankC8_4000.bin":$C99..$EF9
FrameTiles134:						; the raw tiles of frame $134 (FrameTileSource / FrameBankLayout entry
									; $134); pose not traced
	incbin "../Extracted/segments/bankC8_4000.bin":$EF9..$1000
	incbin "../Extracted/segments/bankC8_5000.bin":$0..$179
