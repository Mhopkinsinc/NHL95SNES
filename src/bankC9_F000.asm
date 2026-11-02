; Raw planar frame tiles, followed by an award picture that ends in the next bank.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C9F14B
FrameTiles23B:						; the raw tiles of frame $23B (FrameTileSource / FrameBankLayout entry
									; $23B); pose not traced
	incbin "../Extracted/segments/bankC9_F000.bin":$14B..$3CB
FrameTiles23C:						; the raw tiles of frame $23C (FrameTileSource / FrameBankLayout entry
									; $23C); pose not traced
	incbin "../Extracted/segments/bankC9_F000.bin":$3CB..$62B
FrameTiles23D:						; the raw tiles of frame $23D (FrameTileSource / FrameBankLayout entry
									; $23D); pose not traced
	incbin "../Extracted/segments/bankC9_F000.bin":$62B..$8AB
FrameTiles23E:						; the raw tiles of frame $23E (FrameTileSource / FrameBankLayout entry
									; $23E); pose not traced
	incbin "../Extracted/segments/bankC9_F000.bin":$8AB..$B2B
FrameTiles23F:						; the raw tiles of frame $23F (FrameTileSource / FrameBankLayout entry
									; $23F); pose not traced
	incbin "../Extracted/segments/bankC9_F000.bin":$B2B..$D8B
FrameTiles240:						; the raw tiles of frame $240 (FrameTileSource / FrameBankLayout entry
									; $240); pose not traced
	incbin "../Extracted/segments/bankC9_F000.bin":$D8B..$FEB
JenningsPicMap:						; the picture of award 3 (AwardPictures): William M. Jennings Trophy
	dw JenningsPicTiles-JenningsPicMap-2	; map chunk length
	db $09,$0D						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00EA						; unpacked map size
check bankcross off
	incbin "../Extracted/segments/bankC9_F000.bin":$FF2..$1000
	incbin "../Extracted/segments/bankCA_0000.bin":$0..$D6
JenningsPicTiles:					; its tiles (95)
	dw JenningsPicPalette-JenningsPicTiles-2	; tiles chunk length
	dw $005F						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $0BE0						; unpacked tile size
	incbin "../Extracted/segments/bankCA_0000.bin":$E0..$9B2
JenningsPicPalette:					; its colours (16)
	dw .end-JenningsPicPalette-2	; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $7C00,$5AD6,$4A56,$4A52,$35AD,$2529,$35B2,$2529
	dw $252D,$1084,$0000,$1089,$6F7B,$7FFF,$5AD6,$0000
.end:								; end of the picture
check bankcross full
