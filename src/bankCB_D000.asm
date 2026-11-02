; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CBD035
FrameTiles365:						; the raw tiles of frame $365 (FrameTileSource / FrameBankLayout entry
									; $365); pose not traced
	incbin "../Extracted/segments/bankCB_D000.bin":$35..$235
FrameTiles366:						; the raw tiles of frame $366 (FrameTileSource / FrameBankLayout entry
									; $366); pose not traced
	incbin "../Extracted/segments/bankCB_D000.bin":$235..$435
FrameTiles367:						; the raw tiles of frame $367 (FrameTileSource / FrameBankLayout entry
									; $367); pose not traced
	incbin "../Extracted/segments/bankCB_D000.bin":$435..$635
FrameTiles368:						; the raw tiles of frame $368 (FrameTileSource / FrameBankLayout entry
									; $368); pose not traced
	incbin "../Extracted/segments/bankCB_D000.bin":$635..$835
FrameTiles369:						; the raw tiles of frame $369 (FrameTileSource / FrameBankLayout entry
									; $369); pose not traced
	incbin "../Extracted/segments/bankCB_D000.bin":$835..$A35
FrameTiles36A:						; the raw tiles of frame $36A (FrameTileSource / FrameBankLayout entry
									; $36A); pose not traced
	incbin "../Extracted/segments/bankCB_D000.bin":$A35..$C35
FrameTiles36B:						; the raw tiles of frame $36B (FrameTileSource / FrameBankLayout entry
									; $36B); pose not traced
	incbin "../Extracted/segments/bankCB_D000.bin":$C35..$E35
FrameTiles36C:						; the raw tiles of frame $36C (FrameTileSource / FrameBankLayout entry
									; $36C); pose not traced
	incbin "../Extracted/segments/bankCB_D000.bin":$E35..$1000
	incbin "../Extracted/segments/bankCB_E000.bin":$0..$35
