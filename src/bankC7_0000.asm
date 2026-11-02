; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C7053E
FrameTiles098:						; the raw tiles of frame $098 (FrameTileSource / FrameBankLayout entry
									; $098); pose not traced
	incbin "../Extracted/segments/bankC7_0000.bin":$53E..$7BE
FrameTiles099:						; the raw tiles of frame $099 (FrameTileSource / FrameBankLayout entry
									; $099); pose not traced
	incbin "../Extracted/segments/bankC7_0000.bin":$7BE..$A3E
FrameTiles09A:						; the raw tiles of frame $09A (FrameTileSource / FrameBankLayout entry
									; $09A); pose not traced
	incbin "../Extracted/segments/bankC7_0000.bin":$A3E..$CBE
FrameTiles09B:						; the raw tiles of frame $09B (FrameTileSource / FrameBankLayout entry
									; $09B); pose not traced
	incbin "../Extracted/segments/bankC7_0000.bin":$CBE..$EBE
FrameTiles09C:						; the raw tiles of frame $09C (FrameTileSource / FrameBankLayout entry
									; $09C); pose not traced
	incbin "../Extracted/segments/bankC7_0000.bin":$EBE..$1000
	incbin "../Extracted/segments/bankC7_1000.bin":$0..$BE
