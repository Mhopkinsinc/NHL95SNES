; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C7A07E
FrameTiles0DA:						; the raw tiles of frame $0DA (FrameTileSource / FrameBankLayout entry
									; $0DA); pose not traced
	incbin "../Extracted/segments/bankC7_A000.bin":$7E..$2FE
FrameTiles0DB:						; the raw tiles of frame $0DB (FrameTileSource / FrameBankLayout entry
									; $0DB); pose not traced
	incbin "../Extracted/segments/bankC7_A000.bin":$2FE..$57E
FrameTiles0DC:						; the raw tiles of frame $0DC (FrameTileSource / FrameBankLayout entry
									; $0DC); pose not traced
	incbin "../Extracted/segments/bankC7_A000.bin":$57E..$7FE
FrameTiles0DD:						; the raw tiles of frame $0DD (FrameTileSource / FrameBankLayout entry
									; $0DD); pose not traced
	incbin "../Extracted/segments/bankC7_A000.bin":$7FE..$A7E
FrameTiles0DE:						; the raw tiles of frame $0DE (FrameTileSource / FrameBankLayout entry
									; $0DE); pose not traced
	incbin "../Extracted/segments/bankC7_A000.bin":$A7E..$CFE
FrameTiles0DF:						; the raw tiles of frame $0DF (FrameTileSource / FrameBankLayout entry
									; $0DF); pose not traced
	incbin "../Extracted/segments/bankC7_A000.bin":$CFE..$F7E
FrameTiles0E0:						; the raw tiles of frame $0E0 (FrameTileSource / FrameBankLayout entry
									; $0E0); pose not traced
	incbin "../Extracted/segments/bankC7_A000.bin":$F7E..$1000
	incbin "../Extracted/segments/bankC7_B000.bin":$0..$1FE
