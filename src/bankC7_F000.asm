; Raw planar frame tiles, followed by an award picture that ends in the next bank.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C7F09E
FrameTiles0FB:						; the raw tiles of frame $0FB (FrameTileSource / FrameBankLayout entry
									; $0FB); pose not traced
	incbin "../Extracted/segments/bankC7_F000.bin":$9E..$31E
FrameTiles0FC:						; the raw tiles of frame $0FC (FrameTileSource / FrameBankLayout entry
									; $0FC); pose not traced
	incbin "../Extracted/segments/bankC7_F000.bin":$31E..$57E
FrameTiles0FD:						; the raw tiles of frame $0FD (FrameTileSource / FrameBankLayout entry
									; $0FD); pose not traced
	incbin "../Extracted/segments/bankC7_F000.bin":$57E..$77E
FrameTiles0FE:						; the raw tiles of frame $0FE (FrameTileSource / FrameBankLayout entry
									; $0FE); pose not traced
	incbin "../Extracted/segments/bankC7_F000.bin":$77E..$9DE
FrameTiles0FF:						; the raw tiles of frame $0FF (FrameTileSource / FrameBankLayout entry
									; $0FF); pose not traced
	incbin "../Extracted/segments/bankC7_F000.bin":$9DE..$C5E
FrameTiles100:						; the raw tiles of frame $100 (FrameTileSource / FrameBankLayout entry
									; $100); pose not traced
	incbin "../Extracted/segments/bankC7_F000.bin":$C5E..$E7E
SelkePicMap:						; the picture of award 1 (AwardPictures): Frank J. Selke Trophy
	dw SelkePicTiles-SelkePicMap-2	; map chunk length
	db $09,$0D						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $00EA						; unpacked map size
	incbin "../Extracted/segments/bankC7_F000.bin":$E85..$F65
SelkePicTiles:						; its tiles (47); LZSS stream continues into the next bank
	dw SelkePicPalette-SelkePicTiles-2	; tiles chunk length
	dw $002F						; tile count
	db $80,$04,$04,$00				; packed tiles; bits per pixel twice, then zero
	dw $05E0						; unpacked tile size
check bankcross off
	incbin "../Extracted/segments/bankC7_F000.bin":$F6F..$1000
	incbin "../Extracted/segments/bankC8_0000.bin":$0..$532
SelkePicPalette:					; its colours (16)
	dw .end-SelkePicPalette-2		; palette chunk length
	db $01							; palette count
	dw $0010,$0010					; colours per palette and total colours
	dw $7C00,$0000,$5ADB,$5AD6,$5816,$35AD,$4A52,$35B2
	dw $1089,$2529,$1084,$35B2,$252D,$7F7F,$6F7B,$0000
.end:								; end of the picture
check bankcross full
