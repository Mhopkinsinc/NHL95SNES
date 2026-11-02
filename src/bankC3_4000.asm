; Segment bankC3_4000: the last team records (labels and ROM cuts: they hold licensed names), then data
; tables and text of the game (not traced; labelled where code reads them).
org $C3402C
Pittsburgh:							; team record 17 (Pittsburgh): not traced; it holds licensed names
	incbin "../Extracted/segments/bankC3_4000.bin":$2C..$A3
Quebec:								; team record 18 (Quebec): not traced; it holds licensed names
	incbin "../Extracted/segments/bankC3_4000.bin":$A3..$113
SanJose:							; team record 19 (SanJose): not traced; it holds licensed names
	incbin "../Extracted/segments/bankC3_4000.bin":$113..$182
StLouis:							; team record 20 (StLouis): not traced; it holds licensed names
	incbin "../Extracted/segments/bankC3_4000.bin":$182..$1F4
TampaBay:							; team record 21 (TampaBay): not traced; it holds licensed names
	incbin "../Extracted/segments/bankC3_4000.bin":$1F4..$262
Toronto:							; team record 22 (Toronto): not traced; it holds licensed names
	incbin "../Extracted/segments/bankC3_4000.bin":$262..$2D7
Vancouver:							; team record 23 (Vancouver): not traced; it holds licensed names
	incbin "../Extracted/segments/bankC3_4000.bin":$2D7..$34B
Winnipeg:							; team record 25 (Winnipeg): not traced; it holds licensed names
	incbin "../Extracted/segments/bankC3_4000.bin":$34B..$3B8
Washington:							; team record 24 (Washington): not traced; it holds licensed names
	incbin "../Extracted/segments/bankC3_4000.bin":$3B8..$427
DATA8_C34427:						; a team record not in TeamList (the same form; not traced)
	incbin "../Extracted/segments/bankC3_4000.bin":$427..$499
Penaltylist:						; per penalty number, the offset (from here) of its record: two bytes, the
									; length-led name, then the referee's animation steps (SetPA2)
	dw $0000,$0036,$0048,$009F,$009F,$00D5,$0078,$0058
	dw $0060,$008A,$013C,$0068,$00DB,$00FC,$015B,$019A
	dw $017A,$011D,$00C2,$01BE,$01D5,$01E7,$01ED,$01F3
	dw $00AE,$0070,$0000
	db $00,$01,$0B,$D0,$E5,$F2,$E9,$EF,$E4,$A0,$CF,$F6,$E5,$F2,$10,$13
	db $F0,$BF,$00,$01,$09,$C7,$E1,$ED,$E5,$A0,$CF,$F6,$E5,$F2,$10,$13
	db $D0,$BF,$00,$01,$01,$A0,$0A,$13,$E0,$BF,$00,$01,$01,$A0,$10,$13
	db $F0,$BF,$00,$01,$01,$A0,$10,$13,$FA,$BF,$00,$01,$01,$A0,$10,$13
	db $D0,$BF,$00,$01,$05,$C9,$E3,$E9,$EE,$E7,$02,$13,$02,$00,$02,$07
	db $0F,$0C,$FA,$BF,$00,$01,$08,$CF,$E6,$E6,$AD,$F3,$E9,$E4,$E5,$02
	db $13,$02,$00,$02,$12,$0F,$05,$FA,$BF,$00,$01,$08,$C6,$E1,$E3,$E5
	db $A0,$CF,$E6,$E6,$0A,$13,$F8,$BF,$00,$00,$07,$D0,$E5,$EE,$E1,$EC
	db $F4,$F9,$03,$13,$01,$00,$02,$12,$1F,$05,$FA,$BF,$01,$01,$0C,$D0
	db $E5,$EE,$E1,$EC,$F4,$F9,$A0,$D3,$E8,$EF,$F4,$10,$13,$FA,$BF,$00
	db $00,$01,$A0,$F6,$EC,$02,$04,$08,$C3,$E8,$E1,$F2,$E7,$E9,$EE,$E7
	db $04,$13,$01,$00,$01,$07,$01,$0A,$01,$11,$01,$0A,$01,$11,$01,$0A
	db $01,$11,$01,$0A,$FF,$EE,$02,$04,$08,$D3,$EC,$E1,$F3,$E8,$E9,$EE
	db $E7,$04,$13,$01,$01,$01,$0E,$01,$01,$01,$0E,$01,$01,$01,$0E,$01
	db $01,$01,$02,$01,$0E,$FF,$FE,$02,$04,$08,$D4,$F2,$E9,$F0,$F0,$E9
	db $EE,$E7,$04,$13,$01,$0F,$01,$08,$01,$0F,$01,$08,$01,$0F,$01,$08
	db $01,$0F,$01,$08,$FF,$F0,$02,$0A,$08,$D2,$EF,$F5,$E7,$E8,$E9,$EE
	db $E7,$04,$13,$01,$0B,$01,$12,$01,$0B,$01,$12,$01,$0B,$01,$12,$01
	db $0B,$01,$12,$FF,$F4,$02,$04,$08,$D2,$EF,$F5,$E7,$E8,$E9,$EE,$E7
	db $04,$13,$01,$0B,$01,$12,$01,$0B,$01,$12,$01,$0B,$01,$12,$01,$0B
	db $01,$12,$FF,$F4,$02,$04,$07,$C8,$EF,$EF,$EB,$E9,$EE,$E7,$04,$13
	db $01,$10,$01,$03,$01,$10,$01,$03,$01,$10,$01,$03,$01,$10,$01,$03
	db $01,$10,$FF,$FC,$02,$04,$0B,$C3,$F2,$EF,$F3,$F3,$A0,$C3,$E8,$E5
	db $E3,$EB,$04,$13,$01,$06,$01,$0D,$01,$06,$01,$0D,$01,$06,$01,$0D
	db $01,$06,$01,$0D,$01,$06,$FF,$F2,$02,$04,$0C,$C9,$EE,$F4,$E5,$F2
	db $E6,$E5,$F2,$E5,$EE,$E3,$E5,$04,$13,$01,$00,$01,$07,$F9,$FB,$02
	db $04,$07,$C8,$EF,$EC,$E4,$E9,$EE,$E7,$04,$13,$01,$00,$06,$07,$FF
	db $F6,$05,$28,$01,$A0,$FF,$FE,$05,$28,$01,$A0,$FF,$FE,$02,$28,$01
	db $A0,$FF,$FE
TxtPleaseWait:						; the packed text "Please Wait==="
	db $8F,$2F,$02,$24,$D9,$DC,$72,$80,$A6,$AF,$AF,$AF,$06
	db $88,$CB,$05,$DA,$20,$51,$6A,$91,$83,$66,$48,$94,$1A,$8F,$83,$B1
	db $39,$F5,$1E,$FE,$5B,$F0,$03,$9A,$21,$9B,$2F,$8E,$1A,$D1,$8F,$83
	db $B1,$F9,$F2,$8E,$FE,$5B,$F0,$03,$9A,$21,$9B,$4B,$3E,$C1,$D4,$8F
	db $83,$B1,$39,$F5,$1E,$FE,$5B,$F0,$03,$9A,$21,$9B,$0F,$8E,$2A,$92
	db $C8,$35,$0D,$96,$13,$39,$49,$6C,$DE,$FC,$71,$20,$50,$41,$42,$03
	db $96,$13,$39,$49,$6C,$DE,$5C,$70,$D2,$66,$04,$4B,$03,$84,$03,$39
	db $49,$6C,$DE,$1C,$F0,$B9,$40,$9B,$48,$68,$84,$03,$39,$49,$6C,$DE
	db $BC,$71,$17,$E7,$21,$40,$4E,$0D
TxtXExitMenu:						; the packed text "X? EXIT MENU"
	db $D7,$7F,$93,$8B,$E6,$66,$A4,$51
	db $0D,$93,$1F,$A2,$01
TxtASeasonIsInProgress:				; the packed text "A Season is in progress="
	db $60,$4B,$4E,$80,$74,$6D,$23,$B9,$51,$DB,$2F
	db $3A,$13,$89,$94,$BE,$1A
TxtWhenANewSeasonIs:				; the packed text "When a new season is"
	db $96,$1F,$D2,$36,$D8,$8D,$D8,$2D,$09,$90
	db $AE,$6D,$24,$35
TxtStartedDataFromThe:				; the packed text "started@ data from the"
	db $5C,$4E,$10,$27,$19,$1F,$7B,$80,$09,$76,$89,$8E
	db $ED,$79,$88,$06
TxtOldSeasonWillBeLost:				; the packed text "old season will be lost="
	db $DC,$AD,$B1,$25,$01,$D2,$B5,$6D,$D1,$5A,$3B,$90
	db $BD,$9C,$9C,$BE,$1A
TxtContinueOld:						; the packed text "Continue Old"
	db $82,$BB,$36,$51,$A3,$64,$73,$C7,$D7,$D0
TxtStartNew:						; the packed text "Start New"
	db $92
	db $4F,$10,$E7,$E6,$8D,$13,$AB,$01,$92,$00,$E9,$DA,$7E,$0B,$60,$57
	db $8A,$D4
TxtNotAvail:						; the packed text "Not Avail="
	db $8D,$BB,$B9,$39,$E0,$15,$A0,$E5,$AB,$01
TxtDefault:							; the packed text "Default"
	db $83,$93,$02,$E8
	db $9A,$1A
TxtWithTrades:						; the packed text "With Trades"
	db $96,$A3,$79,$36,$9F,$3C,$82,$41,$A4,$06
TxtWarning:							; the packed text "WARNING?"
	db $16,$C4,$86,$9A
	db $F1,$D7
TxtAGameMustBe:						; the packed text "A game must be"
	db $60,$73,$03,$18,$D9,$8C,$CA,$B9,$03,$D1
TxtSelected:						; the packed text "selected="
	db $5C,$92,$45,$C4
	db $24,$C3,$57,$03
TxtOkay:							; the packed text "Okay"
	db $8E,$2B,$80,$35
TxtPlayMode:						; the packed text "Play Mode"
	db $8F,$2F,$80,$37,$67,$DC,$0D,$A2
	db $01,$86,$03,$46,$36,$97,$9C,$4C,$FA,$34,$82,$BB,$36,$A3,$5B,$8B
	db $C4,$CD,$25,$27,$93,$3E,$0D,$55,$FA,$6A
TxtHomeTeam:						; the packed text "Home Team"
	db $87,$3B,$46,$36,$9F,$9C
	db $00,$A6,$01
TxtVisitingTeam:					; the packed text "Visiting Team"
	db $95,$23,$89,$26,$6A,$66,$F3,$C9,$09,$60,$1A
TxtPeriodLength:					; the packed text "Period Length"
	db $8F,$93
	db $88,$DC,$D8,$7C,$71,$D2,$CC,$3C,$1A
TxtGoalies:							; the packed text "Goalies"
	db $86,$3B,$B0,$10,$91,$1A
TxtUserRecords:						; the packed text "User Records"
	db $94
	db $4B,$12,$37,$8F,$9C,$08,$17,$87,$D4
TxtPenalties:						; the packed text "Penalties"
	db $8F,$93,$06,$D6,$44,$44,$6A
TxtLineChanges:						; the packed text "Line Changes"
	db $8B,$A3,$46,$36,$17,$FC,$80,$66,$88,$D4
TxtRosters:							; the packed text "Rosters"
	db $91,$3B,$39,$49,$94,$1A
TxtExhibition:						; the packed text "Exhibition"
	db $84,$DF,$83,$02,$9A,$C8,$35,$0D
TxtPractice:						; the packed text "Practice"
	db $8F,$47,$20,$26,$12,$44,$03
TxtSeason:							; the packed text "Season"
	db $92
	db $13,$20,$5D,$D3
TxtTrades:							; the packed text "Trades"
	db $93,$47,$30,$88,$D4,$93,$47,$30,$C8,$E6,$8F,$2F
	db $80,$49,$94,$1A
TxtFreeAgent:						; the packed text "Free Agent"
	db $85,$47,$42,$36,$07,$DC,$90,$36,$35,$BC,$44,$42
	db $34
TxtRelease:							; the packed text "Release"
	db $91,$93,$45,$80,$24,$1A
Txt5Minutes:						; the packed text "5 Minutes"
	db $BD,$9B,$71,$D4,$E8,$24,$52,$03
Txt10Minutes:						; the packed text "10 Minutes"
	db $3D
	db $1D,$9B,$71,$D4,$E8,$24,$52,$03
Txt20Minutes:						; the packed text "20 Minutes"
	db $5D,$1D,$9B,$71,$D4,$E8,$24,$52
	db $03
TxtManual:							; the packed text "Manual"
	db $8C,$83,$46,$C1,$D2
TxtAutomatic:						; the packed text "Automatic"
	db $80,$D3,$E9,$18,$98,$48,$68
TxtOn:								; the packed text "On"
	db $8E,$37,$0D
TxtOff:								; the packed text "Off"
	db $8E,$97,$A2,$01
TxtHomePlayers:						; the packed text "Home Players"
	db $87,$3B,$46,$36,$7F,$7C,$01,$4C,$A2,$D4
TxtVisitorPlayers:					; the packed text "Visitor Players"
	db $95,$23
	db $89,$A6,$8B,$9B,$3F,$BE,$00,$26,$51,$6A
TxtZero:							; the packed text "Zero"
	db $99,$93,$E8,$34
TxtOne:								; the packed text "One"
	db $8E,$37
	db $A2,$01
TxtTwo:								; the packed text "Two"
	db $93,$5B,$A7,$01
TxtThree:							; the packed text "Three"
	db $93,$9F,$48,$88,$06
TxtFour:							; the packed text "Four"
	db $85,$3B,$1A,$35
TxtFive:							; the packed text "Five"
	db $85
	db $A3,$4A,$34
TxtPlayoffs:						; the packed text "Playoffs"
	db $8F,$2F,$80,$5D,$29,$52,$03,$88,$B7,$44,$23,$22,$52
	db $03
TxtSingleGame:						; the packed text "Single Game"
	db $92,$A3,$66,$16,$D9,$DC,$70,$C0,$88,$06
TxtMultiGame:						; the packed text "Multi>Game"
	db $8C,$D3,$35,$91,$37
	db $37,$1C,$30,$A2,$01
TxtTeam1:							; the packed text "Team 1"
	db $93,$13,$C0,$76,$8F,$06
TxtTeam2:							; the packed text "Team 2"
	db $93,$13,$C0,$76,$97
	db $06
TxtTeam:							; the packed text "Team"
	db $93,$13,$C0,$34
TxtMakePlayer:						; the packed text "Make Player"
	db $8C,$03,$45,$36,$7F,$7C,$01,$4C,$A2,$06,$82
	db $47,$02,$26,$D9,$FC,$F1,$05,$30,$89,$1A,$85,$A3,$28,$E7,$E6,$8D
	db $03,$46,$FC,$35,$8B,$03,$39,$37,$6F,$1C,$30,$E2,$AF,$01
TxtAbcdefghi:						; the packed text "ABCDEFGHI"
	db $20,$88
	db $41,$8A,$39,$48,$03
TxtJklmnopqr:						; the packed text "JKLMNOPQR"
	db $49,$2D,$D6,$DC,$83,$51,$03
TxtStuvwxyz:						; the packed text "STUVWXYZ="
	db $72,$D2,$6A,$2F
	db $CE,$BE,$1A
TxtStuvwxyz2:						; the packed text "STUVWXYZ>"
	db $72,$D2,$6A,$2F,$CE,$DE,$1A,$FC,$81,$B1,$A7,$DB,$60
	db $2F,$32,$27,$89,$1A,$3C,$EC,$E9,$B6,$24,$8B,$88,$A9,$01,$1C,$EF
	db $E9,$B6,$71,$3B,$00,$A1,$34,$5C,$4E,$10,$E7,$B6,$87,$B4,$3D,$5C
	db $23,$1A,$98,$13,$A9,$01,$8D,$3B,$0D,$84,$47,$20,$C9,$E6,$93,$13
	db $C0,$36,$8F,$DC,$C9,$49,$A2,$D4,$88,$CB,$3D,$0F,$D9,$6F,$01,$4C
	db $E2,$6E,$80,$91,$ED,$94,$06,$8F,$3B,$89,$26,$72,$CD,$5F,$03,$96
	db $13,$64,$CE,$F4,$D7,$8E,$57,$12,$C1,$5A,$3B,$82,$89,$9A,$F1,$D7
	db $94,$37,$2A,$C9,$D8,$FC,$71,$87,$DA,$94,$FE,$1A,$87,$83,$36,$FC
	db $35,$8D,$53,$16,$48,$F4,$D7,$FC,$81,$E1,$BF,$25,$59,$44,$4C,$0D
	db $5C,$4E,$10,$A7,$FF,$1E,$AE,$11,$0D
TxtGoalie:							; the packed text "Goalie"
	db $86,$3B,$B0,$10,$D1
TxtLeftDefense:						; the packed text "Left Defense"
	db $8B,$93
	db $32,$37,$1F,$9C,$14,$D2,$24,$D1
TxtRightDefense:					; the packed text "Right Defense"
	db $91,$23,$73,$E6,$E6,$83,$93,$42
	db $9A,$24,$1A
TxtCenter:							; the packed text "Center"
	db $82,$93,$36,$49,$D4
TxtLeftWing:						; the packed text "Left Wing"
	db $8B,$93,$32,$37,$B7,$1C,$35,$A3
	db $01
TxtRightWing:						; the packed text "Right Wing"
	db $91,$23,$73,$E6,$E6,$96,$A3,$66,$34
TxtLeft:							; the packed text "Left"
	db $8B,$93,$32,$35
TxtRight:							; the packed text "Right"
	db $91,$23
	db $73,$A6,$06
TxtSpeed:							; the packed text "Speed"
	db $92,$3F,$42,$86,$06
TxtAgility:							; the packed text "Agility"
	db $80,$1B,$B4,$D0,$C4,$1A
TxtEndurance:						; the packed text "Endurance"
	db $84,$B7
	db $41,$23,$68,$82,$68
TxtOffAwareness:					; the packed text "Off= Awareness"
	db $8E,$97,$E2,$BB,$39,$E0,$16,$44,$D2,$88,$94
	db $1A
TxtDefAwareness:					; the packed text "Def= Awareness"
	db $83,$93,$E2,$BB,$39,$E0,$16,$44,$D2,$88,$94,$1A
TxtStickhandling:					; the packed text "Stickhandling"
	db $92,$4F,$24
	db $D4,$01,$6D,$2C,$D4,$8C,$06
TxtShotPower:						; the packed text "Shot Power"
	db $92,$1F,$37,$37,$7F,$DC,$59,$12,$35
TxtShotAccuracy:					; the packed text "Shot Accuracy"
	db $92,$1F,$37,$37,$07,$5C,$08,$1A,$81,$C0,$1A
TxtPassAccuracy:					; the packed text "Pass Accuracy"
	db $8F,$03,$29,$37,$07
	db $5C,$08,$1A,$81,$C0,$1A
TxtAggression:						; the packed text "Aggression"
	db $80,$1B,$13,$89,$94,$C8,$35,$0D
TxtChecking:						; the packed text "Checking"
	db $82,$1F
	db $22,$14,$6A,$46,$03
TxtPuckControl:						; the packed text "Puck Control"
	db $8F,$53,$A1,$36,$17,$DC,$B5,$19,$DD,$D2
TxtStickRight:						; the packed text "Stick Right"
	db $92
	db $4F,$24,$D4,$E6,$91,$23,$73,$A6,$06
TxtStickLeft:						; the packed text "Stick Left"
	db $92,$4F,$24,$D4,$E6,$8B,$93
	db $32,$35
TxtGloveLeft:						; the packed text "Glove Left"
	db $86,$2F,$57,$C9,$E6,$8B,$93,$32,$35
TxtGloveRight:						; the packed text "Glove Right"
	db $86,$2F,$57,$C9,$E6
	db $91,$23,$73,$A6,$06,$D8,$7F,$4B,$6E,$D1,$14,$67,$F3,$C9,$09,$60
	db $52,$03,$72,$82,$38,$FD,$37,$E1,$15,$2C,$0A,$26,$D1,$8F,$3B,$E9
	db $AB,$01,$91,$4F,$E3,$AB,$01,$8B,$13,$60,$28,$D9,$9C,$71,$D2,$A8
	db $06,$8F,$2F,$80,$37,$37,$1C,$30,$22,$35,$ED,$AC,$2D,$F9,$04,$6D
	db $A0,$66,$A4,$06,$86,$03,$46,$E4,$E6,$93,$BB,$01,$B0,$06,$8B,$13
	db $60,$28,$D9,$7C,$71,$02,$06,$89,$52,$03,$93,$13,$C0,$36,$97,$7C
	db $82,$29,$35,$92,$13,$20,$5D,$DB,$7C,$72,$02,$D8,$E6,$92,$4F,$30
	db $A5,$06,$8F,$2F,$80,$49,$DC,$5C,$F2,$09,$A6,$D4,$92,$13,$20,$5D
	db $DB,$FC,$F1,$05,$30,$89,$9B,$4B,$3E,$C1,$94,$1A,$C1,$7F,$33,$0E
	db $A2,$DA,$DC,$70,$C0,$88,$06,$C1,$7F,$4B,$6E,$D1,$14,$67,$F3,$C9
	db $09,$60,$52,$03,$0F,$0C,$FF,$2D,$F8,$01,$CD,$90,$CD,$07,$07,$58
	db $03,$0F,$0C,$FF,$2D,$F8,$01,$CD,$90,$CD,$25,$9F,$60,$4A,$0D,$72
	db $82,$38,$FD,$F7,$E2,$04,$18,$4A,$36,$67,$9C,$34,$AA,$01
TxtNoOffsides:						; the packed text "No Offsides"
	db $8D,$BB
	db $CD,$1D,$2F,$45,$A2,$41,$A4,$06,$8F,$2F,$80,$49,$DC,$7B,$EF,$BD
	db $F7,$DE,$BC,$71,$E7,$BB,$F9,$E4,$CC,$57,$03
TxtGoals:							; the packed text "Goals"
	db $86,$3B,$B0,$A4,$06
TxtAssists:							; the packed text "Assists"
	db $80,$4B,$89,$E4,$94,$1A
TxtPoints:							; the packed text "Points"
	db $8F,$3B,$D4,$A6,$D4
TxtSaves:							; the packed text "Saves"
	db $92,$83,$4A,$A4,$06
	db $88,$AF,$45,$0C,$58,$FE,$1A,$86,$03,$46,$36,$97,$7C,$82,$29,$35
	db $8F,$93,$88,$DC,$D8,$5C,$F2,$09,$A6,$D4,$92,$0B,$17,$89,$06
TxtShots:							; the packed text "Shots"
	db $92
	db $1F,$37,$A5,$06,$92,$1F,$E7,$26,$6A,$66,$F3,$C7,$C5,$F4,$D5,$8F
	db $3B,$4B,$E2,$E6,$8F,$2F,$80,$35,$EF,$6D,$C6,$51,$A3,$93,$48,$0D
	db $EF,$6D,$C9,$8F,$9B,$52,$03,$F2,$6C,$C3,$1D,$58,$52,$03,$F2,$6C
	db $C9,$8F,$9B,$52,$03,$81,$47,$02,$14,$B0,$00,$4B,$0D,$8E,$37,$B2
	db $F9,$E4,$88,$91,$28,$35,$8F,$93,$06,$D6,$C4,$9B,$4B,$7E,$DC,$94
	db $1A,$85,$03,$41,$5C,$29,$52,$03,$81,$BB,$81,$37,$17,$FC,$10,$A1
	db $A4,$06,$80,$CF,$09,$84,$DA,$3C,$73,$D7,$88,$06,$8F,$03,$29,$51
	db $33,$1A,$8F,$03,$29,$51,$33,$9B,$3F,$2E,$A6,$AF,$06
TxtTotal:							; the packed text "Total"
	db $93,$BB,$09
	db $96,$06,$8F,$93,$06,$D6,$C4,$9B,$4B,$4E,$19,$03,$11,$6B
TxtNoPenalties:						; the packed text "No Penalties"
	db $8D,$BB
	db $CD,$1F,$27,$0D,$AC,$89,$88,$D4,$92,$0B,$17,$51,$33,$9B,$4B,$4E
	db $19,$03,$11,$6B
TxtNoScoring:						; the packed text "No Scoring"
	db $8D,$BB,$CD,$25,$17,$2E,$A2,$66,$34,$93,$13,$C0
	db $36,$8F,$DC,$C9,$49,$A2,$06
TxtIce:								; the packed text "Ice"
	db $88,$0B,$A2,$01
TxtBench:							; the packed text "Bench"
	db $81,$93,$26,$8E,$06
TxtInjP:							; the packed text "Inj= P"
	db $88,$B7,$E4,$BB,$F9,$D3
TxtInjG:							; the packed text "Inj= G"
	db $88,$B7,$E4,$BB,$B9,$D1
TxtGloveHand:						; the packed text "Glove Hand"
	db $86,$2F,$57,$C9
	db $E6,$87,$83,$36,$34
TxtBestLine:						; the packed text "Best Line"
	db $81,$13,$39,$37,$5F,$1C,$35,$A2,$01,$84,$0F
	db $34,$37,$5F,$1C,$35,$22,$35
TxtNone:							; the packed text "None"
	db $8D,$BB,$46,$34,$82,$1F,$D0,$0C,$D9
	db $DC,$70,$07,$16,$22,$1A
TxtOtherScores:						; the packed text "Other Scores"
	db $8E,$CF,$43,$E2,$E6,$92,$0B,$17,$89,$D4
TxtScoutingReport:					; the packed text "Scouting Report"
	db $92,$0B,$47,$27,$6A,$66,$F3,$C8,$C9,$73,$71,$6A,$87,$A3,$48,$36
	db $2F,$3C,$12,$B2,$39,$E0,$86,$B4,$29,$35,$91,$93,$45,$80,$24,$9B
	db $3F,$BE,$00,$26,$51,$6A,$92,$4F,$10,$A7,$FF,$E6,$87,$A3,$48,$34
	db $D7,$7F,$0B,$0E,$9A,$20,$4B,$03
TxtPosition:						; the packed text "Position"
	db $8F,$3B,$89,$26,$72,$4D,$03
TxtRating:							; the packed text "Rating"
	db $91
	db $83,$89,$9A,$D1
TxtNoFreeAgents:					; the packed text "No Free Agents"
	db $8D,$BB,$CD,$0B,$8F,$84,$6C,$0E,$B8,$21,$6D,$4A
	db $0D
TxtDefense:							; the packed text "Defense"
	db $83,$93,$42,$9A,$24,$1A
TxtForward:							; the packed text "Forward"
	db $85,$BB,$68,$41,$1C,$1A,$86,$3B,$B0
	db $10,$91,$FE,$1A,$83,$93,$42,$9A,$24,$8C,$34,$7F,$0D,$85,$BB,$68
	db $41,$1C,$D2,$5F,$03,$93,$BB,$09,$96,$BF,$06,$92,$4F,$10,$A7,$FF
	db $E6,$91,$93,$45,$80,$24,$1A,$92,$4F,$10,$A7,$FF,$E6,$82,$BB,$36
	db $51,$A3,$44,$03,$84,$57,$B0,$28,$98,$64,$F3,$C9,$23,$18,$44,$03
TxtNoSelections:					; the packed text "No Selections"
	db $8D,$BB,$CD,$25,$27,$8B,$88,$89,$5C,$93,$1A
TxtEtc:								; the packed text "Etc="
	db $84,$4F,$E1,$AB,$01
	db $85,$BB,$A8,$01
TxtAccepted:						; the packed text "Accepted"
	db $80,$0B,$41,$DE,$24,$43,$03
TxtRejected:						; the packed text "Rejected"
	db $91,$93,$44,$C4,$24
	db $43,$03
TxtAdvantage:						; the packed text "Advantage?"
	db $80,$8F,$0A,$DA,$04,$86,$F8,$6B,$92,$13,$20,$5D,$DB,$1C
	db $70,$0B,$E2,$90,$1A,$8F,$83,$E1,$BF,$B9,$E0,$07,$34,$43,$36,$07
	db $DC,$82,$38,$34,$8D,$03,$46,$36,$27,$BC,$CD,$88,$35,$91,$13,$E1
	db $E2,$D8,$FC,$70,$B7,$06,$89,$52,$03
TxtNoRecordHolders:					; the packed text "no record holders"
	db $BC,$B9,$1D,$89,$70,$71,$EC
	db $E3,$D6,$20,$51,$6A
TxtName:							; the packed text "name"
	db $BC,$01,$46,$34
TxtWin:								; the packed text "win<"
	db $DC,$A2,$E6,$A9,$01
TxtWin2:							; the packed text "win"
	db $DC,$A2
	db $A6,$01
TxtLose:							; the packed text "lose"
	db $7C,$39,$49,$34
TxtTie:								; the packed text "tie"
	db $7C,$22,$A2,$01,$DC,$92,$25,$1C,$23,$7B
	db $BA,$0D,$B6,$74,$6B,$6C,$47,$E7,$D6,$BE,$DB,$87,$4F,$D7,$90,$39
	db $D3,$4B,$EE,$06,$26,$72,$0D,$AC,$7D,$9C,$50,$04,$EF,$45,$80,$A1
	db $64,$1B,$C0,$C8,$2E,$04,$4C,$1A,$89,$DC,$F3,$90,$AD,$01,$9B,$1F
	db $20,$77,$20,$A4,$ED,$B7,$00,$46,$CD,$6C,$0D,$DC,$92,$B5,$76,$24
	db $82,$B4,$B9,$B0,$EF,$F6,$D1,$9B,$83,$48,$B6,$6B,$FB,$B8,$B9,$E5
	db $8C,$04,$28,$B9,$41,$1B,$5B,$03,$9B,$83,$48,$B6,$2B,$65,$CF,$43
	db $50,$DC,$06,$30,$E2,$BB,$7D,$34,$FC,$45,$22,$E5,$96,$13,$C4,$B9
	db $A7,$DB,$81,$18,$D4,$3E,$F6,$3C,$64,$83,$0D,$DA,$D8,$78,$07,$3A
	db $A7,$6B,$72,$4F,$B7,$A5,$88,$6E,$AD,$3D,$4F,$74,$D4,$9C,$3D,$0F
	db $D9,$93,$00,$B6,$19,$98,$E2,$D0,$27,$3F,$B6,$8B,$7B,$1E,$B2,$EF
	db $0E,$74,$4E,$D7,$F6,$74,$3B,$92,$8A,$88,$DD,$F3,$90,$4D,$2A,$58
	db $14,$4C,$E4,$DA,$76,$65,$CF,$43,$F6,$24,$80,$49,$5F,$0D,$8B,$A3
	db $46,$FC,$B7,$06
TxtScoring1:						; the packed text "Scoring 1"
	db $92,$0B,$17,$51,$33,$BB,$47,$03
TxtScoring2:						; the packed text "Scoring 2"
	db $92,$0B,$17,$51
	db $33,$BB,$4B,$03
TxtPowerPlay1:						; the packed text "Power Play 1"
	db $8F,$3B,$4B,$E2,$E6,$8F,$2F,$80,$77,$8F,$06
TxtPowerPlay2:						; the packed text "Power Play 2"
	db $8F
	db $3B,$4B,$E2,$E6,$8F,$2F,$80,$77,$97,$06
TxtPenaltyKill1:					; the packed text "Penalty Kill 1"
	db $8F,$93,$06,$D6,$C4,$9B
	db $2B,$8E,$D6,$DA,$3D,$1A
TxtPenaltyKill2:					; the packed text "Penalty Kill 2"
	db $8F,$93,$06,$D6,$C4,$9B,$2B,$8E,$D6,$DA
	db $5D,$1A,$92,$4F,$30,$FD,$B7,$06
TxtStatus:							; the packed text "Status"
	db $92,$4F,$30,$A9,$D4
TxtOverall:							; the packed text "Overall"
	db $8E,$57,$12
	db $C1,$5A,$1A
TxtEnergy:							; the packed text "Energy"
	db $84,$37,$12,$0D,$D6
TxtHanded:							; the packed text "Handed"
	db $87,$83,$36,$C8,$D0
TxtWeight:							; the packed text "Weight"
	db $96,$13,$64
	db $CE,$D4,$3C,$F8,$6F,$E3,$C0,$92,$1A,$3C,$F8,$6F,$09,$2A,$91,$1A
	db $3C,$F8,$6F,$79,$DC,$94,$1A
TxtBGoalies:						; the packed text "b? goalies"
	db $3C,$F8,$6F,$E3,$C0,$42,$44,$6A
TxtBPlayers:						; the packed text "b? players"
	db $3C
	db $F8,$EF,$B7,$00,$26,$51,$6A
TxtPadLRChangeLine:					; the packed text "pad l>r? change line"
	db $FC,$81,$B1,$97,$77,$F4,$DF,$E2,$80
	db $66,$C8,$5E,$A8,$11,$0D,$FC,$81,$B1,$A9,$F7,$F0,$DF,$E2,$80,$66
	db $C8,$7E,$0B,$60,$12,$35,$FC,$81,$B1,$97,$77,$F4,$DF,$E2,$80,$66
	db $C8,$96,$13,$4C,$0D,$3C,$F8,$6F,$49,$16,$11,$73,$BF,$05,$30,$89
	db $1A
TxtBEditName:						; the packed text "b? edit name"
	db $3C,$F8,$6F,$32,$D0,$DC,$0D,$30,$A2,$01
TxtStartSelectPlayer:				; the packed text "start? select player"
	db $5C,$4E,$10,$A7,$FF
	db $96,$64,$11,$31,$F7,$5B,$00,$93,$A8,$01
Txt1st:								; the packed text "1st"
	db $3D,$5C,$4E,$0D
Txt2nd:								; the packed text "2nd"
	db $5D,$BC
	db $0D,$0D
Txt3rd:								; the packed text "3rd"
	db $7D,$3C,$0E,$0D
TxtOT:								; the packed text "OT"
	db $6E,$6A
TxtFinal:							; the packed text "Final"
	db $85,$A3,$06,$96,$06
TxtPlayer:							; the packed text "Player"
	db $8F,$2F,$80
	db $49,$D4
TxtG:								; the packed text "G"
	db $46,$03
TxtA:								; the packed text "A"
	db $40,$03
TxtPt:								; the packed text "Pt"
	db $8F,$4F,$0D
TxtSh:								; the packed text "Sh"
	db $92,$1F,$0D
TxtPM:								; the packed text "PM"
	db $8F,$69
TxtGA:								; the packed text "GA"
	db $06,$68
TxtPtg:								; the packed text "Ptg"
	db $8F,$4F,$A3,$01
TxtPer:								; the packed text "Per"
	db $8F,$93,$A8,$01
TxtTime:							; the packed text "Time"
	db $93,$23,$46,$34
TxtTm:								; the packed text "Tm"
	db $93,$33,$0D
TxtPS:								; the packed text "P>S"
	db $CF
	db $5B,$6A
TxtGoalAss:							; the packed text "Goal>Ass="
	db $86,$3B,$B0,$BC,$39,$E0,$52,$FA,$6A
TxtSH2:								; the packed text "SH2"
	db $F2,$74,$69
TxtPP:								; the packed text "PP"
	db $EF,$69
TxtPP2:								; the packed text "PP2"
	db $EF,$75,$69
TxtLD:								; the packed text "LD"
	db $6B,$68
TxtRD:								; the packed text "RD"
	db $71,$68
TxtLW:								; the packed text "LW"
	db $CB,$6A
TxtC:								; the packed text "C"
	db $42,$03
TxtRW:								; the packed text "RW"
	db $D1,$6A,$93,$47,$F7
	db $0E,$D6,$8C,$13,$E6,$22,$02,$6B,$F3,$C9,$A3,$7B,$07,$6B,$80,$5B
	db $10,$87,$06,$95,$93,$8C,$1A,$D8,$7C,$F2,$E8,$DE,$C1,$1A,$81,$13
	db $39,$37,$37,$DC,$81,$A5,$08,$79,$24,$6A,$85,$47,$D0,$D4,$E6,$C9
	db $77,$4B,$4E,$96,$22,$1A,$81,$13,$39,$37,$1F,$9C,$14,$D2,$24,$AA
	db $64,$F3,$C2,$5D,$B4,$20,$0E,$0D,$82,$BB,$D6,$36,$97,$9C,$E1,$79
	db $88
