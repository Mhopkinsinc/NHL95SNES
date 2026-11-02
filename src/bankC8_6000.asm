; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C861B9
FrameTiles144:						; the raw tiles of frame $144 (FrameTileSource / FrameBankLayout entry
									; $144); pose not traced
	incbin "../Extracted/segments/bankC8_6000.bin":$1B9..$439
FrameTiles145:						; the raw tiles of frame $145 (FrameTileSource / FrameBankLayout entry
									; $145); pose not traced
	incbin "../Extracted/segments/bankC8_6000.bin":$439..$6B9
FrameTiles146:						; the raw tiles of frame $146 (FrameTileSource / FrameBankLayout entry
									; $146); pose not traced
	incbin "../Extracted/segments/bankC8_6000.bin":$6B9..$8F9
FrameTiles14C:						; the raw tiles of frame $14C (FrameTileSource / FrameBankLayout entry
									; $14C); pose not traced
	incbin "../Extracted/segments/bankC8_6000.bin":$8F9..$B59
FrameTiles14D:						; the raw tiles of frame $14D (FrameTileSource / FrameBankLayout entry
									; $14D); pose not traced
	incbin "../Extracted/segments/bankC8_6000.bin":$B59..$DB9
FrameTiles150:						; the raw tiles of frame $150 (FrameTileSource / FrameBankLayout entry
									; $150); pose not traced
	incbin "../Extracted/segments/bankC8_6000.bin":$DB9..$1000
	incbin "../Extracted/segments/bankC8_7000.bin":$0..$19
