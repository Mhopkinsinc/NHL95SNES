; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C990AB
FrameTiles213:						; the raw tiles of frame $213 (FrameTileSource / FrameBankLayout entry
									; $213); pose not traced
	incbin "../Extracted/segments/bankC9_9000.bin":$AB..$30B
FrameTiles214:						; the raw tiles of frame $214 (FrameTileSource / FrameBankLayout entry
									; $214); pose not traced
	incbin "../Extracted/segments/bankC9_9000.bin":$30B..$58B
FrameTiles215:						; the raw tiles of frame $215 (FrameTileSource / FrameBankLayout entry
									; $215); pose not traced
	incbin "../Extracted/segments/bankC9_9000.bin":$58B..$80B
FrameTiles216:						; the raw tiles of frame $216 (FrameTileSource / FrameBankLayout entry
									; $216); pose not traced
	incbin "../Extracted/segments/bankC9_9000.bin":$80B..$A8B
FrameTiles217:						; the raw tiles of frame $217 (FrameTileSource / FrameBankLayout entry
									; $217); pose not traced
	incbin "../Extracted/segments/bankC9_9000.bin":$A8B..$D0B
FrameTiles218:						; the raw tiles of frame $218 (FrameTileSource / FrameBankLayout entry
									; $218); pose not traced
	incbin "../Extracted/segments/bankC9_9000.bin":$D0B..$F8B
FrameTiles219:						; the raw tiles of frame $219 (FrameTileSource / FrameBankLayout entry
									; $219); pose not traced
	incbin "../Extracted/segments/bankC9_9000.bin":$F8B..$1000
	incbin "../Extracted/segments/bankC9_A000.bin":$0..$20B
