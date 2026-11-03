; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C88019
FrameTiles15C:						; the raw tiles of frame $15C (FrameTileSource / FrameBankLayout entry
									; $15C); pose not traced
	incbin "../Extracted/segments/bankC8_8000.bin":$19..$299
FrameTiles15D:						; the raw tiles of frame $15D (FrameTileSource / FrameBankLayout entry
									; $15D); pose not traced
	incbin "../Extracted/segments/bankC8_8000.bin":$299..$4F9
FrameTiles160:						; the raw tiles of frame $160 (FrameTileSource / FrameBankLayout entry
									; $160); pose not traced
	incbin "../Extracted/segments/bankC8_8000.bin":$4F9..$739
FrameTiles161:						; the raw tiles of frame $161 (FrameTileSource / FrameBankLayout entry
									; $161); pose not traced
	incbin "../Extracted/segments/bankC8_8000.bin":$739..$979
FrameTiles162:						; the raw tiles of frame $162 (FrameTileSource / FrameBankLayout entry
									; $162); pose not traced
	incbin "../Extracted/segments/bankC8_8000.bin":$979..$BB9
FrameTiles164:						; the raw tiles of frame $164 (FrameTileSource / FrameBankLayout entry
									; $164); pose not traced
	incbin "../Extracted/segments/bankC8_8000.bin":$BB9..$E19
FrameTiles165:						; the raw tiles of frame $165 (FrameTileSource / FrameBankLayout entry
									; $165); pose not traced
	incbin "../Extracted/segments/bankC8_8000.bin":$E19..$1000
	incbin "../Extracted/segments/bankC8_9000.bin":$0..$79
