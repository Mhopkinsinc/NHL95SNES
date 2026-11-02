; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C9E04B
FrameTiles234:						; the raw tiles of frame $234 (FrameTileSource / FrameBankLayout entry
									; $234); pose not traced
	incbin "../Extracted/segments/bankC9_E000.bin":$4B..$2CB
FrameTiles235:						; the raw tiles of frame $235 (FrameTileSource / FrameBankLayout entry
									; $235); pose not traced
	incbin "../Extracted/segments/bankC9_E000.bin":$2CB..$52B
FrameTiles236:						; the raw tiles of frame $236 (FrameTileSource / FrameBankLayout entry
									; $236); pose not traced
	incbin "../Extracted/segments/bankC9_E000.bin":$52B..$78B
FrameTiles237:						; the raw tiles of frame $237 (FrameTileSource / FrameBankLayout entry
									; $237); pose not traced
	incbin "../Extracted/segments/bankC9_E000.bin":$78B..$A0B
FrameTiles238:						; the raw tiles of frame $238 (FrameTileSource / FrameBankLayout entry
									; $238); pose not traced
	incbin "../Extracted/segments/bankC9_E000.bin":$A0B..$C8B
FrameTiles239:						; the raw tiles of frame $239 (FrameTileSource / FrameBankLayout entry
									; $239); pose not traced
	incbin "../Extracted/segments/bankC9_E000.bin":$C8B..$EEB
FrameTiles23A:						; the raw tiles of frame $23A (FrameTileSource / FrameBankLayout entry
									; $23A); pose not traced
	incbin "../Extracted/segments/bankC9_E000.bin":$EEB..$1000
	incbin "../Extracted/segments/bankC9_F000.bin":$0..$14B
