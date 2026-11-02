; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C67168
FrameTiles036:						; the raw tiles of frame $036 (FrameTileSource / FrameBankLayout entry
									; $036); pose not traced
	incbin "../Extracted/segments/bankC6_7000.bin":$168..$368
FrameTiles037:						; the raw tiles of frame $037 (FrameTileSource / FrameBankLayout entry
									; $037); pose not traced
	incbin "../Extracted/segments/bankC6_7000.bin":$368..$5C8
FrameTiles038:						; the raw tiles of frame $038 (FrameTileSource / FrameBankLayout entry
									; $038); pose not traced
	incbin "../Extracted/segments/bankC6_7000.bin":$5C8..$828
FrameTiles03A:						; the raw tiles of frame $03A (FrameTileSource / FrameBankLayout entry
									; $03A); pose not traced
	incbin "../Extracted/segments/bankC6_7000.bin":$828..$AA8
FrameTiles03B:						; the raw tiles of frame $03B (FrameTileSource / FrameBankLayout entry
									; $03B); pose not traced
	incbin "../Extracted/segments/bankC6_7000.bin":$AA8..$D08
FrameTiles03E:						; the raw tiles of frame $03E (FrameTileSource / FrameBankLayout entry
									; $03E); pose not traced
	incbin "../Extracted/segments/bankC6_7000.bin":$D08..$F88
FrameTiles03F:						; the raw tiles of frame $03F (FrameTileSource / FrameBankLayout entry
									; $03F); pose not traced
	incbin "../Extracted/segments/bankC6_7000.bin":$F88..$1000
	incbin "../Extracted/segments/bankC6_8000.bin":$0..$1E8
