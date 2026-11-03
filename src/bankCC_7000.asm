; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CC7105
FrameTiles3AB:						; the raw tiles of frame $3AB (FrameTileSource / FrameBankLayout entry
									; $3AB); pose not traced
	incbin "../Extracted/segments/bankCC_7000.bin":$105..$305
FrameTiles3AC:						; the raw tiles of frame $3AC (FrameTileSource / FrameBankLayout entry
									; $3AC); pose not traced
	incbin "../Extracted/segments/bankCC_7000.bin":$305..$505
FrameTiles3AD:						; the raw tiles of frame $3AD (FrameTileSource / FrameBankLayout entry
									; $3AD); pose not traced
	incbin "../Extracted/segments/bankCC_7000.bin":$505..$705
FrameTiles3AE:						; the raw tiles of frame $3AE (FrameTileSource / FrameBankLayout entry
									; $3AE); pose not traced
	incbin "../Extracted/segments/bankCC_7000.bin":$705..$965
FrameTiles3AF:						; the raw tiles of frame $3AF (FrameTileSource / FrameBankLayout entry
									; $3AF); pose not traced
	incbin "../Extracted/segments/bankCC_7000.bin":$965..$BC5
FrameTiles3B0:						; the raw tiles of frame $3B0 (FrameTileSource / FrameBankLayout entry
									; $3B0); pose not traced
	incbin "../Extracted/segments/bankCC_7000.bin":$BC5..$E25
FrameTiles3B1:						; the raw tiles of frame $3B1 (FrameTileSource / FrameBankLayout entry
									; $3B1); pose not traced
	incbin "../Extracted/segments/bankCC_7000.bin":$E25..$1000
	incbin "../Extracted/segments/bankCC_8000.bin":$0..$25
