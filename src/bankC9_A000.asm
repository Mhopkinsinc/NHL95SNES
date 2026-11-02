; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C9A20B
FrameTiles21A:						; the raw tiles of frame $21A (FrameTileSource / FrameBankLayout entry
									; $21A); pose not traced
	incbin "../Extracted/segments/bankC9_A000.bin":$20B..$48B
FrameTiles21B:						; the raw tiles of frame $21B (FrameTileSource / FrameBankLayout entry
									; $21B); pose not traced
	incbin "../Extracted/segments/bankC9_A000.bin":$48B..$70B
FrameTiles21C:						; the raw tiles of frame $21C (FrameTileSource / FrameBankLayout entry
									; $21C); pose not traced
	incbin "../Extracted/segments/bankC9_A000.bin":$70B..$98B
FrameTiles21D:						; the raw tiles of frame $21D (FrameTileSource / FrameBankLayout entry
									; $21D); pose not traced
	incbin "../Extracted/segments/bankC9_A000.bin":$98B..$C0B
FrameTiles21E:						; the raw tiles of frame $21E (FrameTileSource / FrameBankLayout entry
									; $21E); pose not traced
	incbin "../Extracted/segments/bankC9_A000.bin":$C0B..$E8B
FrameTiles21F:						; the raw tiles of frame $21F (FrameTileSource / FrameBankLayout entry
									; $21F); pose not traced
	incbin "../Extracted/segments/bankC9_A000.bin":$E8B..$1000
	incbin "../Extracted/segments/bankC9_B000.bin":$0..$10B
