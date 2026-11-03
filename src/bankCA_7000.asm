; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CA7199
FrameTiles26F:						; the raw tiles of frame $26F (FrameTileSource / FrameBankLayout entry
									; $26F); pose not traced
	incbin "../Extracted/segments/bankCA_7000.bin":$199..$419
FrameTiles270:						; the raw tiles of frame $270 (FrameTileSource / FrameBankLayout entry
									; $270); pose not traced
	incbin "../Extracted/segments/bankCA_7000.bin":$419..$679
FrameTiles271:						; the raw tiles of frame $271 (FrameTileSource / FrameBankLayout entry
									; $271); pose not traced
	incbin "../Extracted/segments/bankCA_7000.bin":$679..$8D9
FrameTiles272:						; the raw tiles of frame $272 (FrameTileSource / FrameBankLayout entry
									; $272); pose not traced
	incbin "../Extracted/segments/bankCA_7000.bin":$8D9..$B39
FrameTiles273:						; the raw tiles of frame $273 (FrameTileSource / FrameBankLayout entry
									; $273); pose not traced
	incbin "../Extracted/segments/bankCA_7000.bin":$B39..$D99
FrameTiles274:						; the raw tiles of frame $274 (FrameTileSource / FrameBankLayout entry
									; $274); pose not traced
	incbin "../Extracted/segments/bankCA_7000.bin":$D99..$F99
FrameTiles275:						; the raw tiles of frame $275 (FrameTileSource / FrameBankLayout entry
									; $275); pose not traced
	incbin "../Extracted/segments/bankCA_7000.bin":$F99..$1000
	incbin "../Extracted/segments/bankCA_8000.bin":$0..$1F9
