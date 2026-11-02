; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C910CB
FrameTiles1D9:						; the raw tiles of frame $1D9 (FrameTileSource / FrameBankLayout entry
									; $1D9); pose not traced
	incbin "../Extracted/segments/bankC9_1000.bin":$CB..$34B
FrameTiles1DA:						; the raw tiles of frame $1DA (FrameTileSource / FrameBankLayout entry
									; $1DA); pose not traced
	incbin "../Extracted/segments/bankC9_1000.bin":$34B..$5AB
FrameTiles1DB:						; the raw tiles of frame $1DB (FrameTileSource / FrameBankLayout entry
									; $1DB); pose not traced
	incbin "../Extracted/segments/bankC9_1000.bin":$5AB..$7AB
FrameTiles1DC:						; the raw tiles of frame $1DC (FrameTileSource / FrameBankLayout entry
									; $1DC); pose not traced
	incbin "../Extracted/segments/bankC9_1000.bin":$7AB..$A0B
FrameTiles1DD:						; the raw tiles of frame $1DD (FrameTileSource / FrameBankLayout entry
									; $1DD); pose not traced
	incbin "../Extracted/segments/bankC9_1000.bin":$A0B..$C6B
FrameTiles1DE:						; the raw tiles of frame $1DE (FrameTileSource / FrameBankLayout entry
									; $1DE); pose not traced
	incbin "../Extracted/segments/bankC9_1000.bin":$C6B..$EEB
FrameTiles1DF:						; the raw tiles of frame $1DF (FrameTileSource / FrameBankLayout entry
									; $1DF); pose not traced
	incbin "../Extracted/segments/bankC9_1000.bin":$EEB..$1000
	incbin "../Extracted/segments/bankC9_2000.bin":$0..$16B
