; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C83019
FrameTiles11B:						; the raw tiles of frame $11B (FrameTileSource / FrameBankLayout entry
									; $11B); pose not traced
	incbin "../Extracted/segments/bankC8_3000.bin":$19..$299
FrameTiles11C:						; the raw tiles of frame $11C (FrameTileSource / FrameBankLayout entry
									; $11C); pose not traced
	incbin "../Extracted/segments/bankC8_3000.bin":$299..$519
FrameTiles11D:						; the raw tiles of frame $11D (FrameTileSource / FrameBankLayout entry
									; $11D); pose not traced
	incbin "../Extracted/segments/bankC8_3000.bin":$519..$799
FrameTiles11E:						; the raw tiles of frame $11E (FrameTileSource / FrameBankLayout entry
									; $11E); pose not traced
	incbin "../Extracted/segments/bankC8_3000.bin":$799..$A19
FrameTiles123:						; the raw tiles of frame $123 (FrameTileSource / FrameBankLayout entry
									; $123); pose not traced
	incbin "../Extracted/segments/bankC8_3000.bin":$A19..$C39
FrameTiles124:						; the raw tiles of frame $124 (FrameTileSource / FrameBankLayout entry
									; $124); pose not traced
	incbin "../Extracted/segments/bankC8_3000.bin":$C39..$E99
FrameTiles125:						; the raw tiles of frame $125 (FrameTileSource / FrameBankLayout entry
									; $125); pose not traced
	incbin "../Extracted/segments/bankC8_3000.bin":$E99..$1000
	incbin "../Extracted/segments/bankC8_4000.bin":$0..$F9
