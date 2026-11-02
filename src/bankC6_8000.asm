; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C681E8
FrameTiles040:						; the raw tiles of frame $040 (FrameTileSource / FrameBankLayout entry
									; $040); pose not traced
	incbin "../Extracted/segments/bankC6_8000.bin":$1E8..$448
FrameTiles041:						; the raw tiles of frame $041 (FrameTileSource / FrameBankLayout entry
									; $041); pose not traced
	incbin "../Extracted/segments/bankC6_8000.bin":$448..$6A8
FrameTiles042:						; the raw tiles of frame $042 (FrameTileSource / FrameBankLayout entry
									; $042); pose not traced
	incbin "../Extracted/segments/bankC6_8000.bin":$6A8..$8A8
FrameTiles043:						; the raw tiles of frame $043 (FrameTileSource / FrameBankLayout entry
									; $043); pose not traced
	incbin "../Extracted/segments/bankC6_8000.bin":$8A8..$A28
FrameTiles044:						; the raw tiles of frame $044 (FrameTileSource / FrameBankLayout entry
									; $044); pose not traced
	incbin "../Extracted/segments/bankC6_8000.bin":$A28..$C28
FrameTiles045:						; the raw tiles of frame $045 (FrameTileSource / FrameBankLayout entry
									; $045); pose not traced
	incbin "../Extracted/segments/bankC6_8000.bin":$C28..$E88
FrameTiles046:						; the raw tiles of frame $046 (FrameTileSource / FrameBankLayout entry
									; $046); pose not traced
	incbin "../Extracted/segments/bankC6_8000.bin":$E88..$1000
	incbin "../Extracted/segments/bankC6_9000.bin":$0..$88
