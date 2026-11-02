; Raw planar frame tiles, followed by an award picture that ends in the next bank.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CAF039
FrameTiles2D0:						; the raw tiles of frame $2D0 (FrameTileSource / FrameBankLayout entry
									; $2D0); pose not traced
	incbin "../Extracted/segments/bankCA_F000.bin":$39..$299
FrameTiles2D1:						; the raw tiles of frame $2D1 (FrameTileSource / FrameBankLayout entry
									; $2D1); pose not traced
	incbin "../Extracted/segments/bankCA_F000.bin":$299..$4F9
FrameTiles2D2:						; the raw tiles of frame $2D2 (FrameTileSource / FrameBankLayout entry
									; $2D2); pose not traced
	incbin "../Extracted/segments/bankCA_F000.bin":$4F9..$779
FrameTiles2D3:						; the raw tiles of frame $2D3 (FrameTileSource / FrameBankLayout entry
									; $2D3); pose not traced
	incbin "../Extracted/segments/bankCA_F000.bin":$779..$979
FrameTiles2D4:						; the raw tiles of frame $2D4 (FrameTileSource / FrameBankLayout entry
									; $2D4); pose not traced
	incbin "../Extracted/segments/bankCA_F000.bin":$979..$BF9
FrameTiles2D5:						; the raw tiles of frame $2D5 (FrameTileSource / FrameBankLayout entry
									; $2D5); pose not traced
	incbin "../Extracted/segments/bankCA_F000.bin":$BF9..$DF9
ArtRossPicMap:						; the picture of award 5 (AwardPictures): Art Ross Trophy
	dw ArtRossPicTiles-ArtRossPicMap-2	; map chunk length
	db $09,$0D						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00EA						; unpacked map size
	incbin "../Extracted/segments/bankCA_F000.bin":$E00..$ECC
ArtRossPicTiles:					; its tiles (82); LZSS stream continues into the next bank
	dw ArtRossPicPalette-ArtRossPicTiles-2	; tiles chunk length
	dw $0052						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $0A40						; unpacked tile size
check bankcross off
	incbin "../Extracted/segments/bankCA_F000.bin":$ED6..$1000
	incbin "../Extracted/segments/bankCB_0000.bin":$0..$88E
ArtRossPicPalette:					; its colours (16)
	dw .end-ArtRossPicPalette-2		; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $7C00,$7FFF,$1084,$6F7B,$252D,$4A52,$2529,$1089
	dw $112D,$35B2,$1132,$25B6,$5AD6,$35AD,$4AD6,$0000
.end:								; end of the picture
check bankcross full
