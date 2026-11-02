; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CA5139
FrameTiles25F:						; the raw tiles of frame $25F (FrameTileSource / FrameBankLayout entry
									; $25F); pose not traced
	incbin "../Extracted/segments/bankCA_5000.bin":$139..$339
FrameTiles260:						; the raw tiles of frame $260 (FrameTileSource / FrameBankLayout entry
									; $260); pose not traced
	incbin "../Extracted/segments/bankCA_5000.bin":$339..$539
FrameTiles261:						; the raw tiles of frame $261 (FrameTileSource / FrameBankLayout entry
									; $261); pose not traced
	incbin "../Extracted/segments/bankCA_5000.bin":$539..$739
FrameTiles262:						; the raw tiles of frame $262 (FrameTileSource / FrameBankLayout entry
									; $262); pose not traced
	incbin "../Extracted/segments/bankCA_5000.bin":$739..$939
FrameTiles263:						; the raw tiles of frame $263 (FrameTileSource / FrameBankLayout entry
									; $263); pose not traced
	incbin "../Extracted/segments/bankCA_5000.bin":$939..$B39
FrameTiles264:						; the raw tiles of frame $264 (FrameTileSource / FrameBankLayout entry
									; $264); pose not traced
	incbin "../Extracted/segments/bankCA_5000.bin":$B39..$D39
FrameTiles265:						; the raw tiles of frame $265 (FrameTileSource / FrameBankLayout entry
									; $265); pose not traced
	incbin "../Extracted/segments/bankCA_5000.bin":$D39..$F39
FrameTiles266:						; the raw tiles of frame $266 (FrameTileSource / FrameBankLayout entry
									; $266); pose not traced
	incbin "../Extracted/segments/bankCA_5000.bin":$F39..$1000
	incbin "../Extracted/segments/bankCA_6000.bin":$0..$139
