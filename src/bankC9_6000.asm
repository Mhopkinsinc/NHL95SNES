; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C9620B
FrameTiles1FD:						; the raw tiles of frame $1FD (FrameTileSource / FrameBankLayout entry
									; $1FD); pose not traced
	incbin "../Extracted/segments/bankC9_6000.bin":$20B..$38B
FrameTiles1FE:						; the raw tiles of frame $1FE (FrameTileSource / FrameBankLayout entry
									; $1FE); pose not traced
	incbin "../Extracted/segments/bankC9_6000.bin":$38B..$50B
FrameTiles1FF:						; the raw tiles of frame $1FF (FrameTileSource / FrameBankLayout entry
									; $1FF); pose not traced
	incbin "../Extracted/segments/bankC9_6000.bin":$50B..$68B
FrameTiles200:						; the raw tiles of frame $200 (FrameTileSource / FrameBankLayout entry
									; $200); pose not traced
	incbin "../Extracted/segments/bankC9_6000.bin":$68B..$80B
FrameTiles201:						; the raw tiles of frame $201 (FrameTileSource / FrameBankLayout entry
									; $201); pose not traced
	incbin "../Extracted/segments/bankC9_6000.bin":$80B..$98B
FrameTiles202:						; the raw tiles of frame $202 (FrameTileSource / FrameBankLayout entry
									; $202); pose not traced
	incbin "../Extracted/segments/bankC9_6000.bin":$98B..$B8B
FrameTiles203:						; the raw tiles of frame $203 (FrameTileSource / FrameBankLayout entry
									; $203); pose not traced
	incbin "../Extracted/segments/bankC9_6000.bin":$B8B..$D8B
FrameTiles204:						; the raw tiles of frame $204 (FrameTileSource / FrameBankLayout entry
									; $204); pose not traced
	incbin "../Extracted/segments/bankC9_6000.bin":$D8B..$F8B
FrameTiles205:						; the raw tiles of frame $205 (FrameTileSource / FrameBankLayout entry
									; $205); pose not traced
	incbin "../Extracted/segments/bankC9_6000.bin":$F8B..$1000
	incbin "../Extracted/segments/bankC9_7000.bin":$0..$18B
