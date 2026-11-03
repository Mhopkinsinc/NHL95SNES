; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CB5015
FrameTiles32B:						; the raw tiles of frame $32B (FrameTileSource / FrameBankLayout entry
									; $32B); pose not traced
	incbin "../Extracted/segments/bankCB_5000.bin":$15..$295
FrameTiles32C:						; the raw tiles of frame $32C (FrameTileSource / FrameBankLayout entry
									; $32C); pose not traced
	incbin "../Extracted/segments/bankCB_5000.bin":$295..$515
FrameTiles32D:						; the raw tiles of frame $32D (FrameTileSource / FrameBankLayout entry
									; $32D); pose not traced
	incbin "../Extracted/segments/bankCB_5000.bin":$515..$715
FrameTiles32E:						; the raw tiles of frame $32E (FrameTileSource / FrameBankLayout entry
									; $32E); pose not traced
	incbin "../Extracted/segments/bankCB_5000.bin":$715..$975
FrameTiles32F:						; the raw tiles of frame $32F (FrameTileSource / FrameBankLayout entry
									; $32F); pose not traced
	incbin "../Extracted/segments/bankCB_5000.bin":$975..$BF5
FrameTiles330:						; the raw tiles of frame $330 (FrameTileSource / FrameBankLayout entry
									; $330); pose not traced
	incbin "../Extracted/segments/bankCB_5000.bin":$BF5..$E75
FrameTiles331:						; the raw tiles of frame $331 (FrameTileSource / FrameBankLayout entry
									; $331); pose not traced
	incbin "../Extracted/segments/bankCB_5000.bin":$E75..$1000
	incbin "../Extracted/segments/bankCB_6000.bin":$0..$D5
