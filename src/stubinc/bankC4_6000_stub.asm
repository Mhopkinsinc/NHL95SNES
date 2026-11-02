;	Segment build for bankC4_6000.asm: sets the mapping and the outside labels it uses, then includes the file
;	on its own for checking against the ROM (tools/verify_segment.sh bankC4_6000). The org is in the segment
;	file.
hirom
incsrc "../inc/snes_regs.asm"
incsrc "../ram95s.asm"

; External addresses outside, read from the ROM. Equates only (the full build has the labels).
SignedSquareTable = $C38A4A
vtoa = $C37F6D
goalieacc = $C486FD
SetSPA = $C457A1
SetSPAFromA = $C457B5
dostop = $C458A2
playeracc = $C45ABE
getpde = $C54A0E
setpde = $C54A2F
MaxSpeed = $C09BC4
ScaleSkatingSpeeds = $C45C7D
Mul16x8S = $C08FB7
SPAglide = $C41958
SPAglideback = $C41F6C
SPAskate = $C41A3C
SPAskateback = $C41F9E
SPAskatewp = $C4198A
SPAstumble = $C425D2
SPAsweepchk = $C42082

incsrc "../bankC4_6000.asm"
