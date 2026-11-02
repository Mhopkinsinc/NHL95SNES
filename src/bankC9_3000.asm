; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C9302B
FrameTiles1E6:						; the raw tiles of frame $1E6 (FrameTileSource / FrameBankLayout entry
									; $1E6); pose not traced
	incbin "../Extracted/segments/bankC9_3000.bin":$2B..$22B
FrameTiles1E7:						; the raw tiles of frame $1E7 (FrameTileSource / FrameBankLayout entry
									; $1E7); pose not traced
	incbin "../Extracted/segments/bankC9_3000.bin":$22B..$42B
FrameTiles1E8:						; the raw tiles of frame $1E8 (FrameTileSource / FrameBankLayout entry
									; $1E8); pose not traced
	incbin "../Extracted/segments/bankC9_3000.bin":$42B..$6AB
FrameTiles1E9:						; the raw tiles of frame $1E9 (FrameTileSource / FrameBankLayout entry
									; $1E9); pose not traced
	incbin "../Extracted/segments/bankC9_3000.bin":$6AB..$90B
FrameTiles1EA:						; the raw tiles of frame $1EA (FrameTileSource / FrameBankLayout entry
									; $1EA); pose not traced
	incbin "../Extracted/segments/bankC9_3000.bin":$90B..$B8B
FrameTiles1EB:						; the raw tiles of frame $1EB (FrameTileSource / FrameBankLayout entry
									; $1EB); pose not traced
	incbin "../Extracted/segments/bankC9_3000.bin":$B8B..$DEB
FrameTiles1EC:						; the raw tiles of frame $1EC (FrameTileSource / FrameBankLayout entry
									; $1EC); pose not traced
	incbin "../Extracted/segments/bankC9_3000.bin":$DEB..$1000
	incbin "../Extracted/segments/bankC9_4000.bin":$0..$4B
