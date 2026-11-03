; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C85179
FrameTiles135:						; the raw tiles of frame $135 (FrameTileSource / FrameBankLayout entry
									; $135); pose not traced
	incbin "../Extracted/segments/bankC8_5000.bin":$179..$3B9
FrameTiles136:						; the raw tiles of frame $136 (FrameTileSource / FrameBankLayout entry
									; $136); pose not traced
	incbin "../Extracted/segments/bankC8_5000.bin":$3B9..$5F9
FrameTiles13B:						; the raw tiles of frame $13B (FrameTileSource / FrameBankLayout entry
									; $13B); pose not traced
	incbin "../Extracted/segments/bankC8_5000.bin":$5F9..$839
FrameTiles13C:						; the raw tiles of frame $13C (FrameTileSource / FrameBankLayout entry
									; $13C); pose not traced
	incbin "../Extracted/segments/bankC8_5000.bin":$839..$A79
FrameTiles13D:						; the raw tiles of frame $13D (FrameTileSource / FrameBankLayout entry
									; $13D); pose not traced
	incbin "../Extracted/segments/bankC8_5000.bin":$A79..$CD9
FrameTiles13E:						; the raw tiles of frame $13E (FrameTileSource / FrameBankLayout entry
									; $13E); pose not traced
	incbin "../Extracted/segments/bankC8_5000.bin":$CD9..$F39
FrameTiles143:						; the raw tiles of frame $143 (FrameTileSource / FrameBankLayout entry
									; $143); pose not traced
	incbin "../Extracted/segments/bankC8_5000.bin":$F39..$1000
	incbin "../Extracted/segments/bankC8_6000.bin":$0..$1B9
