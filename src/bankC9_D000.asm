; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C9D20B
FrameTiles22E:						; the raw tiles of frame $22E (FrameTileSource / FrameBankLayout entry
									; $22E); pose not traced
	incbin "../Extracted/segments/bankC9_D000.bin":$20B..$48B
FrameTiles22F:						; the raw tiles of frame $22F (FrameTileSource / FrameBankLayout entry
									; $22F); pose not traced
	incbin "../Extracted/segments/bankC9_D000.bin":$48B..$6AB
FrameTiles230:						; the raw tiles of frame $230 (FrameTileSource / FrameBankLayout entry
									; $230); pose not traced
	incbin "../Extracted/segments/bankC9_D000.bin":$6AB..$92B
FrameTiles231:						; the raw tiles of frame $231 (FrameTileSource / FrameBankLayout entry
									; $231); pose not traced
	incbin "../Extracted/segments/bankC9_D000.bin":$92B..$B8B
FrameTiles232:						; the raw tiles of frame $232 (FrameTileSource / FrameBankLayout entry
									; $232); pose not traced
	incbin "../Extracted/segments/bankC9_D000.bin":$B8B..$DEB
FrameTiles233:						; the raw tiles of frame $233 (FrameTileSource / FrameBankLayout entry
									; $233); pose not traced
	incbin "../Extracted/segments/bankC9_D000.bin":$DEB..$1000
	incbin "../Extracted/segments/bankC9_E000.bin":$0..$4B
