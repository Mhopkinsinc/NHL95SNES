; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C7811E
FrameTiles0CD:						; the raw tiles of frame $0CD (FrameTileSource / FrameBankLayout entry
									; $0CD); pose not traced
	incbin "../Extracted/segments/bankC7_8000.bin":$11E..$31E
FrameTiles0CE:						; the raw tiles of frame $0CE (FrameTileSource / FrameBankLayout entry
									; $0CE); pose not traced
	incbin "../Extracted/segments/bankC7_8000.bin":$31E..$59E
FrameTiles0CF:						; the raw tiles of frame $0CF (FrameTileSource / FrameBankLayout entry
									; $0CF); pose not traced
	incbin "../Extracted/segments/bankC7_8000.bin":$59E..$81E
FrameTiles0D0:						; the raw tiles of frame $0D0 (FrameTileSource / FrameBankLayout entry
									; $0D0); pose not traced
	incbin "../Extracted/segments/bankC7_8000.bin":$81E..$A7E
FrameTiles0D1:						; the raw tiles of frame $0D1 (FrameTileSource / FrameBankLayout entry
									; $0D1); pose not traced
	incbin "../Extracted/segments/bankC7_8000.bin":$A7E..$CFE
FrameTiles0D2:						; the raw tiles of frame $0D2 (FrameTileSource / FrameBankLayout entry
									; $0D2); pose not traced
	incbin "../Extracted/segments/bankC7_8000.bin":$CFE..$F7E
FrameTiles0D3:						; the raw tiles of frame $0D3 (FrameTileSource / FrameBankLayout entry
									; $0D3); pose not traced
	incbin "../Extracted/segments/bankC7_8000.bin":$F7E..$1000
	incbin "../Extracted/segments/bankC7_9000.bin":$0..$1FE
