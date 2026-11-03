; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CC2225
FrameTiles387:						; the raw tiles of frame $387 (FrameTileSource / FrameBankLayout entry
									; $387); pose not traced
	incbin "../Extracted/segments/bankCC_2000.bin":$225..$4A5
FrameTiles388:						; the raw tiles of frame $388 (FrameTileSource / FrameBankLayout entry
									; $388); pose not traced
	incbin "../Extracted/segments/bankCC_2000.bin":$4A5..$6A5
FrameTiles389:						; the raw tiles of frame $389 (FrameTileSource / FrameBankLayout entry
									; $389); pose not traced
	incbin "../Extracted/segments/bankCC_2000.bin":$6A5..$905
FrameTiles38A:						; the raw tiles of frame $38A (FrameTileSource / FrameBankLayout entry
									; $38A); pose not traced
	incbin "../Extracted/segments/bankCC_2000.bin":$905..$B05
FrameTiles38B:						; the raw tiles of frame $38B (FrameTileSource / FrameBankLayout entry
									; $38B); pose not traced
	incbin "../Extracted/segments/bankCC_2000.bin":$B05..$D05
FrameTiles38C:						; the raw tiles of frame $38C (FrameTileSource / FrameBankLayout entry
									; $38C); pose not traced
	incbin "../Extracted/segments/bankCC_2000.bin":$D05..$F05
FrameTiles38D:						; the raw tiles of frame $38D (FrameTileSource / FrameBankLayout entry
									; $38D); pose not traced
	incbin "../Extracted/segments/bankCC_2000.bin":$F05..$1000
	incbin "../Extracted/segments/bankCC_3000.bin":$0..$85
