; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C66188
FrameTiles02A:						; the raw tiles of frame $02A (FrameTileSource / FrameBankLayout entry
									; $02A); pose not traced
	incbin "../Extracted/segments/bankC6_6000.bin":$188..$3E8
FrameTiles02B:						; the raw tiles of frame $02B (FrameTileSource / FrameBankLayout entry
									; $02B); pose not traced
	incbin "../Extracted/segments/bankC6_6000.bin":$3E8..$5E8
FrameTiles02E:						; the raw tiles of frame $02E (FrameTileSource / FrameBankLayout entry
									; $02E); pose not traced
	incbin "../Extracted/segments/bankC6_6000.bin":$5E8..$848
FrameTiles02F:						; the raw tiles of frame $02F (FrameTileSource / FrameBankLayout entry
									; $02F); pose not traced
	incbin "../Extracted/segments/bankC6_6000.bin":$848..$AA8
FrameTiles030:						; the raw tiles of frame $030 (FrameTileSource / FrameBankLayout entry
									; $030); pose not traced
	incbin "../Extracted/segments/bankC6_6000.bin":$AA8..$CA8
FrameTiles032:						; the raw tiles of frame $032 (FrameTileSource / FrameBankLayout entry
									; $032); pose not traced
	incbin "../Extracted/segments/bankC6_6000.bin":$CA8..$F08
FrameTiles033:						; the raw tiles of frame $033 (FrameTileSource / FrameBankLayout entry
									; $033); pose not traced
	incbin "../Extracted/segments/bankC6_6000.bin":$F08..$1000
	incbin "../Extracted/segments/bankC6_7000.bin":$0..$168
