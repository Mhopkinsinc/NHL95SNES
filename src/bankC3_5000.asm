; Segment bankC3_5000: data tables and text of the game (not traced; labelled where code reads them), with
; PhotoPaletteTable, the per-team pointers to the player photo sets.
org $C35000
	db $06,$8C,$3B,$39,$37,$AF,$1C,$2C,$0A,$C2,$22,$9B,$3F,$BE,$00,$26
	db $71,$A3,$B6,$F9,$E3,$0B,$60,$57,$8A,$D4,$96,$A3,$B5,$10,$60,$9B
	db $33,$5F,$0D,$86,$3B,$B0,$10,$D9,$16,$CD,$B3,$0B,$B1,$44,$CE,$6D
	db $1C,$58,$72,$03,$03,$50,$93,$53,$03,$89,$93,$D6,$50,$33,$72,$F3
	db $C9,$A3,$7B,$07,$6B,$87,$83,$38,$37,$67,$9C,$30,$17,$11,$58,$1A
	db $8C,$3B,$39,$37,$AF,$1C,$2C,$0A,$C2,$22,$9B,$3F,$BE,$00,$26,$51
	db $03,$80,$C7,$B9,$79,$E4,$4E,$CA,$CD,$27,$8F,$EE,$1D,$AC,$01,$8C
	db $3B,$39,$37,$7F,$DC,$A1,$36,$A5,$06,$89,$03,$46,$E4,$E6,$8D,$BB
	db $18,$91,$D4,$81,$13,$39,$37,$1F,$9C,$14,$D2,$24,$61,$A0,$69,$8F
	db $47,$22,$D1,$20,$6D,$4A,$0D,$81,$13,$39,$77,$24,$86,$2E,$10,$B7
	db $24,$40,$BA,$B6,$23,$11,$2E,$0E,$0D
TxtCongratulations:					; the packed text "CONGRATULATIONS;"
	db $C2,$35,$13,$C1,$A4,$0B,$4C
	db $E4,$9A,$F4,$D3
TxtWinsTheStanleyCup:				; the packed text " wins the stanley cup@"
	db $9B,$5B,$D4,$E4,$9E,$87,$6C,$39,$41,$5B,$04,$6F
	db $41,$DF,$87,$06
TxtDefeating:						; the packed text "defeating "
	db $7C,$90,$42,$C0,$44,$CD,$6C,$0D
TxtInTheFinal:						; the packed text " in the final"
	db $9B,$A3,$B6,$E7
	db $21,$BB,$A0,$06,$96,$06
TxtGameOfThePlayoffs:				; the packed text "game of the playoffs"
	db $DC,$00,$46,$B6,$2B,$7B,$1E,$B2,$DF,$02
	db $D8,$95,$22,$35,$92,$BB,$32,$2D,$88,$64,$73,$C2,$9B,$41,$8D,$90
	db $28,$35,$89,$03,$E9,$DA,$E6,$80,$B7,$41,$A2,$24,$4D,$03,$89,$BB
	db $06,$CE,$E6,$92,$4F,$24,$8E,$06,$83,$13,$89,$4C,$DB,$3C,$70,$AC
	db $01,$8A,$93,$8A,$DA,$E6,$87,$3B,$03,$9A,$06,$8C,$23,$71,$00,$59
	db $9B,$07,$1E,$9D,$53,$1A,$80,$C7,$B9,$79,$E0,$58,$03,$D2,$77,$1B
	db $1E,$09,$69,$1A,$8C,$83,$39,$0F,$B1,$9B,$0B,$1E,$B1,$1C,$60,$11
	db $0D,$83,$3B,$6A,$36,$B7,$1C,$29,$A2,$01,$8B,$BB,$88,$36,$17,$FC
	db $00,$F6,$1A,$C1,$1A,$82,$E3,$36,$0F,$02,$9B,$1F,$0E,$18,$5A,$D3
	db $35,$0D,$93,$93,$18,$F1,$E6,$85,$83,$B5,$A4,$06,$88,$83,$B6,$F9
	db $E1,$8E,$4A,$A2,$01,$8A,$93,$36,$22,$D8,$7C,$71,$C0,$18,$90,$1A
	db $80,$2F,$2C,$5D,$DB,$9C,$71,$10,$15,$59,$1A,$8C,$53,$89,$C4,$06
	db $6D,$6C,$2E,$B9,$A3,$6D,$EC,$80,$35,$91,$53,$29,$C9,$5A,$9B,$2F
	db $8E,$48,$58,$48,$1C,$0D,$91,$BB,$B0,$F9,$E1,$34,$04,$10,$87,$06
	db $8E,$47,$03,$DA,$E6,$8C,$53,$89,$C4,$0E,$58,$03,$83,$23,$32,$49
	db $DC,$3C,$72,$4A,$CE,$22,$1A,$84,$5F,$22,$E8,$44,$95,$6C,$FE,$78
	db $74,$83,$0A,$12,$35,$92,$0B,$37,$E7,$E6,$8E,$C7,$A8,$01,$92,$D3
	db $47,$62,$45,$12,$35,$B3,$F9,$E3,$D1,$0D,$2A,$48,$D4,$91,$BB,$B0
	db $39,$E3,$20,$4E,$DC,$34,$8F,$47,$37,$A8,$20,$51,$03,$8A,$93,$8A
	db $DA,$E6,$87,$3B,$03,$9A,$06,$80,$4B,$89,$E4,$04,$6D,$6E,$FE,$78
	db $74,$83,$0A,$12,$35,$8A,$93,$B6,$79,$E4,$CE,$90,$28,$35,$93,$13
	db $39,$51,$33,$9B,$07,$8E,$35,$8C,$23,$45,$36,$37,$3C,$82,$40,$9A
	db $06,$8C,$83,$39,$37,$27,$1C,$C8,$B9,$50,$33,$1A,$8C,$23,$45,$36
	db $57,$1C,$A0,$4C,$15,$D0,$8C,$23,$45,$36,$3F,$9C,$34,$B9,$08,$D6
	db $93,$13,$71,$1A,$12,$60,$6D,$3E,$38,$8A,$44,$4C,$17,$A5,$06,$84
	db $57,$D0,$36,$8F,$DC,$05,$D4,$A4,$6B,$1A,$83,$83,$4A,$36,$B7,$1C
	db $2C,$45,$A2,$06,$8F,$47,$37,$A8,$98,$9B,$33,$0E,$1A,$30,$24,$6A
	db $82,$1F,$F4,$36,$5F,$1C,$34,$43,$34,$8F,$2F,$80,$49,$DC,$3C,$72
	db $30,$51,$33,$72,$07,$AC,$01,$89,$BB,$D3,$36,$8F,$DC,$49,$20,$85
	db $DB,$A0,$0D,$0D,$8D,$13,$B4,$36,$97,$9C,$A1,$79,$B6,$2B,$7B,$1E
	db $A2,$01,$8D,$13,$BB,$39,$E6,$2E,$AA,$CD,$23,$07,$CD,$90,$28,$35
	db $8F,$2F,$80,$49,$DC,$FC,$71,$17,$67,$04,$68,$CA,$1D,$B0,$06,$92
	db $4F,$52,$C9,$E6,$81,$83,$80,$1A,$01,$54,$03,$8F,$47,$97,$88,$98
	db $9B,$0B,$EE,$5C,$1C,$A8,$81,$E9,$A2,$06,$8A,$E3,$08,$36,$B7,$DC
	db $B9,$81,$35,$92,$3F,$22,$10,$58,$9B,$4F,$7E,$40,$53,$52,$03,$92
	db $0B,$37,$E7,$E6,$8F,$47,$17,$50,$D3,$86,$47,$62,$36,$9F,$FC,$38
	db $06,$A4,$06,$8A,$13,$34,$CF,$E6,$85,$47,$D0,$04,$88,$53,$03,$10
	db $00,$F0,$00,$86,$4B,$02,$00,$D6,$47,$07,$C0,$00,$00,$10,$00,$F0
	db $00,$8F,$4B,$02,$00,$D6,$47,$07,$C0,$00,$00
PlayerStatsPage:					; the Player Stats text page (ShowPlayerStats)
	dw $0010,$00F0,TxtPlayerStats&$FFFF,$0002
	dw $FFFF,$0020
	dw TxtYSwitchTeams&$FFFF,$801A
	dw 0
	db $10,$00,$F0,$00,$21,$4C,$02,$00,$D6,$47,$07,$C0,$00,$00,$10,$00
	db $F0,$00,$37,$4C,$02,$00,$D6,$47,$07,$C0,$00,$00
TeamRosterPage:						; the Team Roster text page (TeamRoster)
	dw $0010,$00F0,TxtTeamRoster&$FFFF,$0002
	dw TxtPadUDChangeLine&$FFFF,$8017
	dw TxtPadLRChangeStat&$FFFF,$8018
	dw TxtYSwitchTeams&$FFFF,$8019
	dw 0
EditLinesPage:						; the Edit Lines text page (EditLinesScreen)
	dw $0010,$00F0,TxtEditLines&$FFFF,$0002
	dw TxtPadLRChangeLine&$FFFF,$8017
	dw TxtPadUDChangePlayer&$FFFF,$8018
	dw TxtBSelectPlayer&$FFFF,$8019
	dw 0
ChangeGoaliePage:					; the Change Goalie text page (PauseGoalie)
	dw $0010,$00F0,TxtChangeGoalie&$FFFF,$0002
	dw TxtPadUDChangePlayer&$FFFF,$8017
	dw TxtPadLRChangeStat2&$FFFF,$8018
	dw TxtBSelectPlayer&$FFFF,$8019
	dw 0
FreeAgentsPage:						; the Hire Free Agents text page (DrawFreeAgentsPage)
	dw $0010,$00F0,TxtHireFreeAgents&$FFFF,$0002
	dw TxtGoalies2&$FFFF,$8006
	dw TxtDefensemen&$FFFF,$8007
	dw TxtForwards&$FFFF,$8008
	dw TxtTotal2&$FFFF,$8009
	dw TxtBSelectPlayer&$FFFF,$8019
	dw TxtStartHire&$FFFF,$801A
	dw $FFFF,$0064
	dw TxtXCancel&$FFFF,$801A
	dw 0
ReleasePlayersPage:					; the Release Players text page (DrawReleasePage)
	dw $0010,$00F0,TxtReleasePlayers&$FFFF,$0002
	dw TxtGoalies2&$FFFF,$8006
	dw TxtDefensemen&$FFFF,$8007
	dw TxtForwards&$FFFF,$8008
	dw TxtTotal2&$FFFF,$8009
	dw TxtBSelectPlayer&$FFFF,$8019
	dw TxtStartRelease&$FFFF,$801A
	dw $FFFF,$0078
	dw TxtXCancel&$FFFF,$801A
	dw 0
EvaluateTradePage:					; the Evaluate Trade text page (DrawGMDecision)
	dw $0010,$00F0,TxtEvaluateTrade&$FFFF,$0002
	dw TxtStartContinue&$FFFF,$8018
	dw TxtXCancel&$FFFF,$8019
	dw $FFFF,$0078
	dw TxtFor&$FFFF,$8006
	dw 0
SeasonAwardsPage:					; the Season Awards text page (SeasonAwards)
	dw $0010,$00F0,TxtSeasonAwards&$FFFF,$0002
	dw TxtPadChangeAward&$FFFF,$8018
	dw TxtStartContinue&$FFFF,$8019
	dw 0
NameLogPage:						; the Name Entry list's text page (DrawNameLog)
	dw $0010,$00F0,TxtNameEntry&$FFFF,$0002
	dw TxtBEditName&$FFFF,$8019
	dw TxtStartSelectPlayer&$FFFF,$801A
	dw 0
NameGridPage:						; the name entry grid's help text page (DrawNameGrid)
	dw $0010,$00F0,0,$0000
	dw TxtPadToALetter&$FFFF,$8018
	dw TxtBToSelect&$FFFF,$8019
	dw TxtYToGoBack&$FFFF,$801A
	dw $FFFF,$0087
	dw TxtStartWhenDone&$FFFF,$8019
	dw TxtXCancel&$FFFF,$801A
	dw 0
RecordHoldersPage:					; the Record Holders text page (RecordHoldersScreen)
	dw $0010,$00F0,TxtRecordHolders&$FFFF,$0002
	dw TxtPadSelect&$FFFF,$8018
	dw TxtStartContinue&$FFFF,$8019
	dw 0
	db $10,$00,$F0,$00,$C7,$54,$02,$00,$87,$54,$0A,$40,$95,$54,$0D,$40
	db $A4,$54,$10,$40,$00,$00,$98,$3B,$BA,$0F,$A8,$64,$47,$02,$C4,$21
	db $63,$CF,$43,$34,$7C,$1E,$B2,$19,$B8,$88,$51,$B6,$1B,$65,$81,$C4
	db $ED,$8A,$06,$82,$47,$02,$26,$19,$9B,$3F,$BE,$00,$26,$51,$FA,$6A
	db $10,$00,$F0,$00,$C7,$54,$02,$00,$CC,$54,$0A,$40,$D9,$54,$0D,$40
	db $E9,$54,$10,$40,$00,$00,$80,$2F,$12,$A7,$06,$80,$AF,$B5,$DF,$02
	db $98,$C4,$3D,$23,$18,$A8,$19,$0D,$FC,$00,$B9,$03,$21,$6D,$97,$E8
	db $32,$69,$1F,$9B,$B6,$89,$96,$06,$7C,$1E,$B2,$1B,$B1,$5B,$12,$20
	db $5D,$DB,$81,$18,$D4,$A4,$AF,$06
CopyrightPage:						; the copyright screen's text page (CopyrightScreen)
	dw $0008,$00F8,0,$0000
	dw TxtCopyright01&$FFFF,$C002
	dw TxtCopyright02&$FFFF,$C003
	dw TxtCopyright03&$FFFF,$C004
	dw TxtCopyright04&$FFFF,$C005
	dw TxtCopyright05&$FFFF,$C007
	dw TxtCopyright06&$FFFF,$C008
	dw TxtCopyright07&$FFFF,$C009
	dw TxtCopyright08&$FFFF,$C00A
	dw TxtCopyright09&$FFFF,$C00B
	dw TxtCopyright10&$FFFF,$C00D
	dw TxtCopyright11&$FFFF,$C00E
	dw TxtCopyright12&$FFFF,$C00F
	dw TxtCopyright13&$FFFF,$C010
	dw TxtCopyright14&$FFFF,$C011
	dw TxtCopyright15&$FFFF,$C013
	dw TxtCopyright16&$FFFF,$C014
	dw TxtCopyright17&$FFFF,$C015
	dw TxtCopyright18&$FFFF,$C017
	dw TxtCopyright19&$FFFF,$C018
	dw TxtCopyright20&$FFFF,$C019
	dw 0
StandingsPage:						; the NHL Standings text page (StandingsScreen)
	dw $0010,$0100,TxtNHLStandings&$FFFF,$0002
	dw TxtPadUDChangeDivision&$FFFF,$8018
	dw TxtPadLRChangeStat&$FFFF,$8019
	dw $FFFF,$0018
	dw TxtTeam&$FFFF,$8007
	dw 0
LeagueLeadersPage:					; the League Leaders text page (DrawLeagueLeaders)
	dw $0010,$0100,TxtLeagueLeaders&$FFFF,$0002
	dw $FFFF,$0018
	dw TxtPlayerNoTm&$FFFF,$8007
	dw TxtPADChangeStats&$FFFF,$8019
	dw 0
SeasonPlayerStatsPage:				; the Season Player Stats text page (SeasonPlayerStats)
	dw $0010,$0100,TxtSeasonPlayerStats&$FFFF,$0002
	dw $FFFF,$0018
	dw TxtBSwitchToGoalies&$FFFF,$8018
	dw TxtPadSwitchTeams&$FFFF,$8019
	dw TxtPlayerNoGlsAstPts&$FFFF,$8009
	dw 0
TxtBSwitchToGoalies:				; the packed text "B? Switch to Goalies"
	db $C1,$7F,$4B
	db $6E,$D1,$14,$67,$4F,$B7,$B9,$E1,$0E,$2C,$44,$A4,$06
TxtBSwitchToLinemen:				; the packed text "B? Switch to Linemen"
	db $C1,$7F,$4B
	db $6E,$D1,$14,$67,$4F,$B7,$F9,$E2,$A8,$11,$46,$9A,$06
TxtPlayerNoGlsAstPts:				; the packed text "Player     No= Gls= Ast= Pts="
	db $8F,$2F,$80
	db $49,$DC,$7B,$EF,$CD,$1B,$77,$BE,$9B,$1B,$BE,$A4,$EF,$E6,$80,$CB
	db $E9,$BB,$F9,$E3,$53,$FA,$6A,$8F,$2F,$80,$49,$DC,$7B,$EF,$CD,$1B
	db $77,$BE,$9B,$4B,$5E,$A5,$EF,$E6,$92,$9F,$E9,$BB,$F9,$E3,$62,$FA
	db $6A
SeasonTeamStatsPage:				; the Season Team Stats text page (SeasonTeamStats)
	dw $0010,$0100,TxtSeasonTeamStats&$FFFF,$0002
	dw TxtPadSwitchTeams&$FFFF,$8019
	dw $FFFF,$0008
	dw TxtWinsLossesTies&$FFFF,$0009
	dw TxtGoalsScoredAvg&$FFFF,$000B
	dw TxtGoalsAllowedAvg&$FFFF,$000D
	dw TxtSavePct&$FFFF,$000F
	dw TxtShootingPct&$FFFF,$0011
	dw TxtShotsPerGame&$FFFF,$0013
	dw TxtShotsAllowed&$FFFF,$0015
	dw 0
TxtPadSwitchTeams:					; the packed text "Pad? Switch Teams"
	db $8F
	db $83,$E1,$BF,$B9,$E4,$16,$4D,$71,$36,$9F,$9C,$00,$26,$35
TxtWinsLossesTies:					; the packed text "Wins>Losses>Ties"
	db $96,$A3
	db $26,$BD,$F9,$E2,$4E,$4A,$22,$BD,$F9,$E4,$88,$48,$0D
TxtGoalsScoredAvg:					; the packed text "Goals Scored Avg="
	db $86,$3B,$B0
	db $E4,$E6,$92,$0B,$17,$C9,$D8,$1C,$F0,$6A,$7C,$35
TxtGoalsAllowedAvg:					; the packed text "Goals Allowed Avg="
	db $86,$3B,$B0,$E4
	db $E6,$80,$AF,$E5,$2C,$19,$9B,$03,$5E,$8D,$AF,$06
TxtSave:							; the packed text "Save <"
	db $92,$83,$4A,$B6
	db $A7,$06
TxtSavePct:							; the packed text "Save Pct="
	db $92,$83,$4A,$36,$7F,$5C,$4C,$5F,$0D
TxtShootingPct:						; the packed text "Shooting Pct="
	db $92,$1F,$E7,$26,$6A
	db $66,$F3,$C7,$C5,$F4,$D5
TxtShotsPerGame:					; the packed text "Shots Per Game"
	db $92,$1F,$37,$E5,$E6,$8F,$93,$B8,$B9,$E1
	db $80,$11,$0D
TxtShotsAllowed:					; the packed text "Shots Allowed"
	db $92,$1F,$37,$E5,$E6,$80,$AF,$E5,$2C,$19,$1A
GamesTodayPage:						; the Games Today text page (GamesToday)
	dw $0010,$0100,TxtGamesToday&$FFFF,$0002
	dw TxtBMarkGame&$FFFF,$801D
	dw TxtPADChangeDay&$FFFF,$801E
	dw TxtStartLeagueMenu&$FFFF,$801F
	dw 0
LeagueMenuPage:						; the League Menu text page (SeasonOptions)
	dw $0010,$0100,TxtLeagueMenu&$FFFF,$0002
	dw TxtXExitMenu&$FFFF,$8019
	dw $FFFF,$003C
	dw TxtPlayGames&$FFFF,$0006
	dw TxtNHLStandings&$FFFF,$0009
	dw TxtGamesToday&$FFFF,$000C
	dw TxtLeagueLeaders&$FFFF,$000F
	dw TxtTeamStats&$FFFF,$0012
	dw TxtPlayerStats&$FFFF,$0015
	dw 0
GameSetupPage:						; the Game Setup text page (setoptions)
	dw $0010,$00F6,TxtGameSetup&$FFFF,$0002
	dw TxtVS&$FFFF,$C007
	dw 0
NameOkPage:							; the "is the player name ok" prompt (NameEntry)
	dw $0000,$0100,0,$0000
	dw TxtIsThePlayerNameOk&$FFFF,$400C
	dw TxtYes&$FFFF,$400F
	dw TxtNo&$FFFF,$4012
	dw 0
TradePlayersPage:					; the Trade Players text page (DrawTradePage)
	dw $0010,$00F0,TxtTradePlayers&$FFFF,$0002
	dw $FFFF,$0020
	dw TxtBSelectPlayer&$FFFF,$8017
	dw TxtYSwitchTeams&$FFFF,$8018
	dw TxtStartEvaluate&$FFFF,$8019
	dw $FFFF,$009B
	dw TxtXCancel&$FFFF,$8017
	dw 0
CreatePlayerPage:					; the Create Player text page (DrawNameEntry)
	dw $0010,$0100,TxtCreatePlayer&$FFFF,$0002
	dw $FFFF,$000D
	dw TxtFirstName&$FFFF,$0006
	dw $FFFF,$0014
	dw TxtLastName&$FFFF,$0008
	dw $FFFF,$0020
	dw TxtPadToALetter&$FFFF,$8016
	dw TxtBToSelect&$FFFF,$8017
	dw TxtYToGoBack&$FFFF,$8018
	dw TxtXCancel&$FFFF,$8019
	dw TxtStartWhenDone&$FFFF,$801A
	dw 0
PlayerInfoPage:						; Create Player's position, weight, number and hand prompts (AnswerNameOk)
	dw $0018,$004B,0,$0000
	dw TxtPosition2&$FFFF,$2008
	dw TxtWeight2&$FFFF,$200B
	dw TxtNumber&$FFFF,$200E
	dw TxtHand&$FFFF,$2011
	dw TxtPadSelect&$FFFF,$8017
	dw TxtXCancel&$FFFF,$8018
	dw TxtStartDone&$FFFF,$8019
	dw 0
CreateGoalieRatingsPage:			; Create Player's goalie ratings text page (position 0)
	dw $0018,$00A0,0,$0000
	dw TxtSpeed&$FFFF,$8008
	dw TxtAgility&$FFFF,$8009
	dw TxtDefAwareness&$FFFF,$800A
	dw TxtPuckControl&$FFFF,$800B
	dw TxtStickLeft&$FFFF,$800C
	dw TxtStickRight&$FFFF,$800D
	dw TxtGloveLeft&$FFFF,$800E
	dw TxtGloveRight&$FFFF,$800F
	dw TxtOverallRating&$FFFF,$A015
	dw TxtUnusedPoints&$FFFF,$A016
	dw TxtPadSelect&$FFFF,$8018
	dw TxtStartDone&$FFFF,$8019
	dw $FFFF,$00A8
	dw TxtXCancel&$FFFF,$8019
	dw 0
CreateSkaterRatingsPage:			; Create Player's skater ratings text page
	dw $0018,$00A0,0,$0000
	dw TxtSpeed&$FFFF,$8007
	dw TxtAgility&$FFFF,$8008
	dw TxtEndurance&$FFFF,$8009
	dw TxtOffAwareness&$FFFF,$800A
	dw TxtDefAwareness&$FFFF,$800B
	dw TxtStickhandling&$FFFF,$800C
	dw TxtShotPower&$FFFF,$800D
	dw TxtShotAccuracy&$FFFF,$800E
	dw TxtPassAccuracy&$FFFF,$800F
	dw TxtAggression&$FFFF,$8010
	dw TxtChecking&$FFFF,$8011
	dw TxtOverallRating&$FFFF,$A015
	dw TxtUnusedPoints&$FFFF,$A016
	dw TxtPadSelect&$FFFF,$8018
	dw TxtStartDone&$FFFF,$8019
	dw $FFFF,$00A8
	dw TxtXCancel&$FFFF,$8019
	dw 0
ControllerSetupPage:				; the Controller Setup text page (ControllerSetupScreen)
	dw $0010,$0100,TxtControllerSetup&$FFFF,$0002
	dw 0
PracPlayerValues:					; the Home / Visitor Players values: a count (6), then texts Zero ... Five
	dw 6
	dw TxtZero&$FFFF,TxtOne&$FFFF,TxtTwo&$FFFF,TxtThree&$FFFF,TxtFour&$FFFF,TxtFive&$FFFF
PenaltyValues:						; the Penalties values: a count (3), then texts Off, On, No Offsides
	dw 3
	dw TxtOff&$FFFF,TxtOn&$FFFF,TxtNoOffsides&$FFFF
UserRecordValues:					; the User Records values: a count (2), then texts Off, On
	dw 2
	dw TxtOff&$FFFF,TxtOn&$FFFF
LineChangeValues:					; the Line Changes values: a count (3), then texts Off, On, Automatic
	dw 3
	dw TxtOff&$FFFF,TxtOn&$FFFF,TxtAutomatic&$FFFF
RosterValues:						; the Rosters values: a count (2), then texts Default, With Trades
	dw 2
	dw TxtDefault&$FFFF,TxtWithTrades&$FFFF
GoalieValues:						; the Goalies values: a count (2), then texts Automatic, Manual
	dw 2
	dw TxtAutomatic&$FFFF,TxtManual&$FFFF
PlayoffValues:						; the Playoffs values: a count (2), then texts Single Game and a multi
									; game series
	dw 2
	dw TxtSingleGame&$FFFF,TxtMultiGame&$FFFF
PlayModeValues:						; the Play Mode values: a count (7), then the play mode texts
	dw 7
	dw TxtExhibition&$FFFF,TxtPractice&$FFFF,TxtSeason&$FFFF,TxtTrades&$FFFF,TxtFreeAgent&$FFFF,TxtRelease&$FFFF,TxtMakePlayer&$FFFF
	db $02,$00,$55,$49,$51,$49
PeriodLengthValues:					; the Period Length values: a count (3), then texts 5, 10, 20 Minutes
	dw 3
	dw Txt5Minutes&$FFFF,Txt10Minutes&$FFFF,Txt20Minutes&$FFFF
TeamValues:							; the team lines' values: a count (28), then TeamCityNames
	dw 28
TeamCityNames:						; per team (A * 2): the address of its city name (packed text, bank $C3),
									; then the texts
	db $94,$58,$9A,$58,$9F,$58,$A5,$58,$AB,$58,$B1,$58,$B6,$58,$BC,$58
	db $C3,$58,$C9,$58,$D0,$58,$DA,$58,$E1,$58,$EA,$58,$F2,$58,$FA,$58
	db $FF,$58,$08,$59,$10,$59,$15,$59,$1D,$59,$26,$59,$2F,$59,$35,$59
	db $3C,$59,$44,$59,$4B,$59,$56,$59,$80,$37,$70,$08,$62,$1A,$81,$3B
	db $39,$5D,$D3,$81,$D3,$52,$C0,$72,$1A,$82,$83,$65,$40,$C4,$1A,$82
	db $1F,$24,$80,$71,$1A,$83,$83,$B5,$80,$D4,$83,$93,$19,$1D,$9A,$1A
	db $84,$0F,$E6,$DA,$74,$4D,$03,$85,$2F,$17,$D1,$00,$1A,$87,$83,$38
	db $8B,$8B,$43,$03,$8B,$3B,$B9,$39,$E0,$CD,$90,$45,$A4,$06,$8C,$BB
	db $36,$23,$01,$4B,$03,$8D,$13,$BB,$79,$E2,$24,$4A,$82,$35,$8D,$13
	db $BB,$39,$E6,$2E,$2A,$0D,$8D,$13,$BB,$39,$E6,$2E,$2A,$0D,$8E,$CF
	db $09,$2C,$D0,$8F,$1F,$B4,$C0,$20,$EB,$1D,$04,$34,$8F,$A3,$39,$65
	db $A0,$D1,$1C,$0D,$90,$53,$12,$88,$D0,$92,$83,$B6,$79,$E2,$4E,$12
	db $0D,$92,$4F,$DF,$CD,$17,$77,$14,$49,$0D,$93,$03,$F6,$C0,$E6,$81
	db $03,$AC,$01,$93,$BB,$E8,$DA,$74,$1A,$95,$83,$26,$1C,$AD,$24,$6A
	db $96,$03,$79,$50,$33,$D3,$35,$0D,$96,$A3,$D6,$D0,$23,$46,$03,$80
	db $AF,$B5,$B9,$E4,$13,$44,$B9,$39,$F1,$D5,$80,$AF,$B5,$B9,$E4,$13
	db $44,$B9,$B9,$F5,$D5
StrBlank12:							; the pause item string "12 spaces" (a length byte, then the characters)
	db $0C,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0,$A0
	db $A0,$A0
StrTeamRoster:						; the pause item string "Team Roster" (a length byte, then the characters)
	db $0B,$D4,$E5,$E1,$ED,$A0,$D2,$EF,$F3,$F4,$E5,$F2
StrScoreSummry:						; the pause item string "Score Summry" (a length byte, then the
									; characters)
	db $0C,$D3
	db $E3,$EF,$F2,$E5,$A0,$D3,$F5,$ED,$ED,$F2,$F9
StrPenalties:						; the pause item string "Penalties" (a length byte, then the characters)
	db $09,$D0,$E5,$EE,$E1
	db $EC,$F4,$E9,$E5,$F3,$0C,$CF,$F4,$E8,$E5,$F2,$A0,$D3,$E3,$EF,$F2
	db $E5,$F3
StrRecords:							; the pause item string "Records" (a length byte, then the characters)
	db $07,$D2,$E5,$E3,$EF,$F2,$E4,$F3
StrGameStats:						; the pause item string "Game Stats" (a length byte, then the characters)
	db $0A,$C7,$E1,$ED,$E5,$A0
	db $D3,$F4,$E1,$F4,$F3
StrPeriodStats:						; the pause item string "Period Stats" (a length byte, then the
									; characters)
	db $0C,$D0,$E5,$F2,$E9,$EF,$E4,$A0,$D3,$F4,$E1
	db $F4,$F3
StrPlayerStats:						; the pause item string "Player Stats" (a length byte, then the
									; characters)
	db $0C,$D0,$EC,$E1,$F9,$E5,$F2,$A0,$D3,$F4,$E1,$F4,$F3
StrInstReplay:						; the pause item string "Inst Replay" (a length byte, then the characters)
	db $0B
	db $C9,$EE,$F3,$F4,$A0,$D2,$E5,$F0,$EC,$E1,$F9
StrEditLines:						; the pause item string "Edit Lines" (a length byte, then the characters)
	db $0A,$C5,$E4,$E9,$F4
	db $A0,$CC,$E9,$EE,$E5,$F3
StrChngeGoalie:						; the pause item string "Chnge Goalie" (a length byte, then the
									; characters)
	db $0C,$C3,$E8,$EE,$E7,$E5,$A0,$C7,$EF,$E1
	db $EC,$E9,$E5,$0C,$CD,$EE,$F5,$E1,$EC,$A0,$C7,$EF,$E1,$EC,$E9,$E5
	db $0B,$C1,$F5,$F4,$EF,$A0,$C7,$EF,$E1,$EC,$E9,$E5,$08,$D4,$E9,$ED
	db $E5,$A0,$CF,$F5,$F4,$02,$E2,$F9,$11,$D3,$F4,$E1,$F2,$F3,$A0,$EF
	db $E6,$A0,$F4,$E8,$E5,$A0,$C7,$E1,$ED,$E5,$0A,$C8,$E1,$F4,$A0,$D4
	db $F2,$E9,$E3,$EB,$A1,$04,$C7,$EF,$E1,$EC,$0A,$C1,$F3,$F3,$E9,$F3
	db $F4,$A0,$E2,$F9,$BA
TxtCopyright01:						; line 1 of the copyright screen's text: "NHL   :95"
	db $ED,$AC,$BD,$B7,$97,$4F,$AF,$06
TxtCopyright02:						; line 2 of the copyright screen's text: "  1994 electronic arts"
	db $7B,$F7,$F8
	db $F8,$74,$6E,$4E,$16,$11,$33,$BA,$86,$C4,$06,$71,$4A,$0D
TxtCopyright03:						; line 3 of the copyright screen's text: "all rights reserved"
	db $1C,$AC
	db $B5,$23,$32,$67,$CA,$1D,$89,$24,$B1,$92,$A1,$01
TxtCopyright04:						; line 4 of the copyright screen's text: "licensed by nintendo"
	db $7C,$21,$41,$9A
	db $24,$63,$07,$BC,$1B,$6A,$93,$B4,$E1,$34
TxtCopyright05:						; line 5 of the copyright screen's text: "national hockey league@ nhl@ the
									; logo"
	db $BC,$81,$89,$5C,$03,$6B
	db $1F,$27,$14,$C1,$7B,$11,$60,$28,$F9,$D8,$ED,$AC,$8F,$3D,$0F,$D9
	db $CB,$19,$A7,$01
TxtCopyright06:						; line 6 of the copyright screen's text: "of the nhl and the stanley cup
									; are"
	db $DC,$95,$3D,$0F,$D9,$ED,$AC,$0D,$DA,$D8,$F3,$90
	db $2D,$27,$68,$8B,$E0,$2D,$E8,$DB,$20,$12,$0D
TxtCopyright07:						; line 7 of the copyright screen's text: "registered trademarks of the"
	db $3C,$12,$83,$E4,$24
	db $91,$8C,$3D,$23,$18,$84,$81,$A8,$E4,$76,$65,$CF,$43,$34
TxtCopyright08:						; line 8 of the copyright screen's text: "national hockey league and are
									; used"
	db $BC,$81
	db $89,$5C,$03,$6B,$1F,$27,$14,$C1,$7B,$11,$60,$28,$D9,$A0,$8D,$0D
	db $22,$D9,$54,$92,$A1,$01
TxtCopyright09:						; line 9 of the copyright screen's text: "under license by electronic
									; arts="
	db $9C,$B6,$41,$E2,$5E,$48,$90,$26,$C9,$0E
	db $78,$93,$45,$C4,$8C,$AE,$21,$B1,$41,$9C,$D2,$57,$03
TxtCopyright10:						; line 10 of the copyright screen's text: "nhlpa@ national hockey league"
	db $BC,$9D,$F5
	db $C0,$C7,$6E,$60,$22,$D7,$C0,$DA,$C7,$09,$45,$F0,$5E,$04,$18,$4A
	db $34
TxtCopyright11:						; line 11 of the copyright screen's text: "players: association and the
									; logo of"
	db $FC,$2D,$80,$49,$94,$5E,$1B,$48,$E9,$04,$02,$13,$B9,$B6,$41
	db $1B,$7B,$1E,$B2,$97,$33,$6E,$BB,$A2,$01
TxtCopyright12:						; line 12 of the copyright screen's text: "nhlpa are trademarks of the"
	db $BC,$9D,$F5,$C0,$06,$91
	db $EC,$19,$C1,$20,$0C,$44,$25,$B7,$2B,$7B,$1E,$A2,$01
TxtCopyright13:						; line 13 of the copyright screen's text: "nhlpa and are used under
									; license"
	db $BC,$9D,$F5
	db $C0,$06,$6D,$6C,$10,$C9,$A6,$92,$8C,$4D,$DB,$20,$71,$2F,$24,$48
	db $93,$44,$03
TxtCopyright14:						; line 14 of the copyright screen's text: "by electronic arts="
	db $3C,$E0,$4D,$16,$11,$33,$BA,$86,$C4,$06,$71,$4A,$5F
	db $0D
TxtCopyright15:						; line 15 of the copyright screen's text: "team names and logos depicted
									; are"
	db $7C,$12,$C0,$76,$03,$8C,$C8,$0D,$DA,$D8,$CB,$19,$27,$F7,$20
	db $0F,$89,$49,$C6,$06,$91,$68
TxtCopyright16:						; line 16 of the copyright screen's text: "officially licensed trademarks
									; of the"
	db $DC,$95,$82,$04,$02,$6B,$E1,$BD,$90
	db $20,$4D,$92,$B1,$67,$04,$83,$30,$10,$95,$DC,$AE,$EC,$79,$88,$06
TxtCopyright17:						; line 17 of the copyright screen's text: "national hockey league=    NHL
									; 1994="
	db $BC,$81,$89,$5C,$03,$6B,$1F,$27,$14,$C1,$7B,$11,$60,$28,$F1,$DD
	db $7B,$6F,$DE,$CE,$DA,$3D,$3E,$3E,$9D,$BE,$1A
TxtCopyright18:						; line 18 of the copyright screen's text: "officially licensed product of
									; the"
	db $DC,$95,$82,$04,$02
	db $6B,$E1,$BD,$90,$20,$4D,$92,$B1,$5F,$74,$83,$8A,$B9,$5D,$D9,$F3
	db $10,$0D
TxtCopyright19:						; line 19 of the copyright screen's text: "national hockey league
									; players:"
	db $BC,$81,$89,$5C,$03,$6B,$1F,$27,$14,$C1,$7B,$11,$60,$28
	db $D9,$6F,$01,$4C,$A2,$F4,$D2
TxtCopyright20:						; line 20 of the copyright screen's text: "association="
	db $1C,$48,$E9,$04,$02,$13,$B9,$E6,$AB
	db $01
ExhibitionOptions:					; the Exhibition setup lines: a count, then per line its title text, value
									; list, variable and routine
	dw 9
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
	dw TxtHomeTeam&$FFFF,TeamValues&$FFFF,HomeTeam,PrintHomeTeamName&$FFFF
	dw TxtVisitingTeam&$FFFF,TeamValues&$FFFF,VisTeam,PrintVisTeamName&$FFFF
	dw TxtPeriodLength&$FFFF,PeriodLengthValues&$FFFF,Optperlen,SaveOptperlen&$FFFF
	dw TxtGoalies&$FFFF,GoalieValues&$FFFF,OptGoalie,SaveOptGoalie&$FFFF
	dw TxtUserRecords&$FFFF,UserRecordValues&$FFFF,OptUserRec,SaveOptUserRec&$FFFF
	dw TxtPenalties&$FFFF,PenaltyValues&$FFFF,OptPen,SaveOptPen&$FFFF
	dw TxtLineChanges&$FFFF,LineChangeValues&$FFFF,OptLine,SaveOptLine&$FFFF
	dw TxtRosters&$FFFF,RosterValues&$FFFF,OptRosters,SaveOptRosters&$FFFF
SeasonOptionLines:					; the Season setup lines: a count, then title, value list, variable,
									; routine per line
	dw 7
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
	dw TxtPeriodLength&$FFFF,PeriodLengthValues&$FFFF,Optperlen,SaveOptperlen&$FFFF
	dw TxtGoalies&$FFFF,GoalieValues&$FFFF,OptGoalie,SaveOptGoalie&$FFFF
	dw TxtPenalties&$FFFF,PenaltyValues&$FFFF,OptPen,SaveOptPen&$FFFF
	dw TxtLineChanges&$FFFF,LineChangeValues&$FFFF,OptLine,SaveOptLine&$FFFF
	dw TxtPlayoffs&$FFFF,PlayoffValues&$FFFF,OptPlayoffs,SaveOptPlayoffs&$FFFF
	dw TxtUserRecords&$FFFF,UserRecordValues&$FFFF,OptUserRec,SaveOptUserRec&$FFFF
TradeOptions:						; the Trades setup lines: a count, then title, value list, variable,
									; routine per line
	dw 3
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
	dw TxtTeam1&$FFFF,TeamValues&$FFFF,HomeTeam,TradeTeam1Hook&$FFFF
	dw TxtTeam2&$FFFF,TeamValues&$FFFF,VisTeam,TradeTeam2Hook&$FFFF
FreeAgentOptions:					; the Free Agent and Release setup lines: a count, then title, value list,
									; variable, routine
	dw 2
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
	dw TxtTeam&$FFFF,TeamValues&$FFFF,VisTeam,PrintVisTeamName&$FFFF
MakePlayerOptions:					; the Make Player setup lines: the Play Mode line only (a count of 1, then
									; its row)
	dw 1
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
PracticeOptions:					; the Practice setup lines: a count, then title, value list, variable,
									; routine per line
	dw 7
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
	dw TxtHomePlayers&$FFFF,PracPlayerValues&$FFFF,homepracplayers,SaveOptHomePracPlayers&$FFFF
	dw TxtVisitorPlayers&$FFFF,PracPlayerValues&$FFFF,awaypracplayers,SaveOptAwayPracPlayers&$FFFF
	dw TxtHomeTeam&$FFFF,TeamValues&$FFFF,HomeTeam,PrintHomeTeamName&$FFFF
	dw TxtVisitingTeam&$FFFF,TeamValues&$FFFF,VisTeam,PrintVisTeamName&$FFFF
	dw TxtPeriodLength&$FFFF,PeriodLengthValues&$FFFF,Optperlen,SaveOptperlen&$FFFF
	dw TxtRosters&$FFFF,RosterValues&$FFFF,OptRosters,SaveOptRosters&$FFFF
	db $01,$00,$58,$49,$4C,$58,$02,$19,$00,$00
PauseInfoItems:						; the Info tab: Team Roster, Score Summry, Penalties, Records, the other
									; scores, a list for PrintPauseItems: a count, then a routine and a string
									; per item
	dw 5
	dw 0,StrTeamRoster&$FFFF
	dw 0,StrScoreSummry&$FFFF
	dw 0,StrPenalties&$FFFF
	dw 0,StrRecords&$FFFF
	dw OtherScoresItemText&$FFFF,0
PracticeInfoItems:					; the Info tab in practice: Team Roster, Score Summry, Records, a list for
									; PrintPauseItems: a count, then a routine and a string per item
	dw 3
	dw 0,StrTeamRoster&$FFFF
	dw 0,StrScoreSummry&$FFFF
	dw 0,StrRecords&$FFFF
PauseStatsItems:					; the Stats tab: Game Stats, Period Stats, Player Stats, a list for
									; PrintPauseItems: a count, then a routine and a string per item
	dw 3
	dw 0,StrGameStats&$FFFF
	dw 0,StrPeriodStats&$FFFF
	dw 0,StrPlayerStats&$FFFF
PracticeOptionsItems:				; the Options tab in practice: Inst Replay, Quit Game, a list for
									; PrintPauseItems: a count, then a routine and a string per item
	dw 2
	dw 0,StrInstReplay&$FFFF
	dw 0,StrQuitGame&$FFFF
PauseOptionsItems:					; the Options tab: Inst Replay, Edit Lines, Chnge Goalie, goalie mode,
									; timeout, Quit Game, a list for PrintPauseItems: a count, then a routine
									; and a string per item
	dw 6
	dw 0,StrInstReplay&$FFFF
	dw 0,StrEditLines&$FFFF
	dw 0,StrChngeGoalie&$FFFF
	dw GoalieModeItemText&$FFFF,0
	dw TimeoutItemText&$FFFF,0
	dw 0,StrQuitGame&$FFFF
QuitPromptItems:					; the quit prompt: Resume Game, Quit Game, a list for PrintPauseItems: a
									; count, then a routine and a string per item
	dw 2
	dw 0,StrResumeGame&$FFFF
	dw 0,StrQuitGame&$FFFF
StrResumeGame:						; the pause item string "Resume Game" (a length byte, then the characters)
	db $0B,$D2,$E5,$F3,$F5,$ED
	db $E5,$A0,$C7,$E1,$ED,$E5
StrQuitGame:						; the pause item string "Quit Game" (a length byte, then the characters)
	db $09,$D1,$F5,$E9,$F4,$A0,$C7,$E1,$ED,$E5
BlankPauseItems:					; seven blank items (12 spaces each): clear the item rows, a list for
									; PrintPauseItems: a count, then a routine and a string per item
	dw 7
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	dw 0,StrBlank12&$FFFF
	db $11,$99,$4B,$00,$AB,$12,$FF,$FF,$9E,$4B,$00,$97,$12,$FF,$FF,$A3
	db $4B,$04,$AB,$12,$97,$12,$AE,$4B,$02,$5F,$12,$63,$12,$B7,$4B,$06
	db $73,$12,$FF,$FF,$BF,$4B,$00,$77,$12,$FF,$FF,$C6,$4B,$00,$7F,$12
	db $FF,$FF,$CD,$4B,$00,$7B,$12,$FF,$FF,$D4,$4B,$02,$E7,$12,$E3,$12
	db $DC,$4B,$02,$FB,$12,$F7,$12,$E5,$4B,$02,$EF,$12,$EB,$12,$F0,$4B
	db $00,$B3,$12,$FF,$FF,$F7,$4B,$00,$D7,$12,$FF,$FF,$08,$48,$00,$67
	db $12,$6B,$12,$01,$4C,$06,$6F,$12,$FF,$FF,$0B,$4C,$02,$DB,$12,$DF
	db $12,$11,$4C,$04,$DB,$12,$DF,$12,$0B,$99,$4B,$00,$AB,$12,$FF,$FF
	db $9E,$4B,$00,$97,$12,$FF,$FF,$A3,$4B,$04,$AB,$12,$97,$12,$D4,$4B
	db $02,$E7,$12,$E3,$12,$DC,$4B,$02,$FB,$12,$F7,$12,$E5,$4B,$02,$EF
	db $12,$EB,$12,$F0,$4B,$00,$B3,$12,$FF,$FF,$F7,$4B,$00,$D7,$12,$FF
	db $FF,$01,$4C,$06,$6F,$12,$FF,$FF,$0B,$4C,$02,$DB,$12,$DF,$12,$11
	db $4C,$04,$DB,$12,$DF,$12
PerLabels:							; the period labels (1st, 2nd, 3rd, OT): addresses of packed texts, by
									; period
	dw Txt1st&$FFFF,Txt2nd&$FFFF,Txt3rd&$FFFF,TxtOT&$FFFF
ScoringStrengthTexts:				; a goal's strength mark: SH2, SH, none ($FFFF), PP, PP2 (packed text
									; addresses)
	dw TxtSH2&$FFFF,TxtSh&$FFFF,$FFFF,TxtPP&$FFFF,TxtPP2&$FFFF
LineNames:							; the line names by line: Best Line, Scoring 1 / 2, Checking, Power Play 1
									; / 2, Penalty Kill 1 / 2
	dw TxtBestLine&$FFFF,TxtScoring1&$FFFF,TxtScoring2&$FFFF,TxtChecking&$FFFF,TxtPowerPlay1&$FFFF
	dw TxtPowerPlay2&$FFFF,TxtPenaltyKill1&$FFFF,TxtPenaltyKill2&$FFFF
PositionNames:						; the position abbreviations LD, RD, LW, C, RW (packed text addresses)
	dw TxtLD&$FFFF,TxtRD&$FFFF,TxtLW&$FFFF,TxtC&$FFFF,TxtRW&$FFFF
PositionLongNames:					; the position names, Left Defense to Right Wing, in PositionNames order
	dw TxtLeftDefense&$FFFF,TxtRightDefense&$FFFF,TxtLeftWing&$FFFF,TxtCenter&$FFFF,TxtRightWing&$FFFF
PositionGroupNames:					; each roster slot group's name by position: Goalie, Defense, Defense,
									; Forward x 3
	dw TxtGoalie&$FFFF,TxtDefense&$FFFF,TxtDefense&$FFFF,TxtForward&$FFFF,TxtForward&$FFFF
	dw TxtForward&$FFFF
RatingNames:						; the skater rating headings: Status, Overall, Energy, Agility ...
									; Aggression, Checking
	dw TxtStatus&$FFFF,TxtOverall&$FFFF,TxtEnergy&$FFFF,TxtAgility&$FFFF,TxtSpeed&$FFFF,TxtHanded&$FFFF
	dw TxtOffAwareness&$FFFF,TxtDefAwareness&$FFFF,TxtShotPower&$FFFF,TxtShotAccuracy&$FFFF
	dw TxtPassAccuracy&$FFFF,TxtStickhandling&$FFFF,TxtWeight&$FFFF,TxtEndurance&$FFFF
	dw TxtAggression&$FFFF,TxtChecking&$FFFF
GoalieRatingNames:					; the goalie rating headings: Status, Overall, Agility ... Glove Left,
									; Weight
	dw TxtStatus&$FFFF,TxtOverall&$FFFF,TxtAgility&$FFFF,TxtSpeed&$FFFF,TxtGloveHand&$FFFF
	dw TxtDefAwareness&$FFFF,TxtPuckControl&$FFFF,TxtStickRight&$FFFF,TxtStickLeft&$FFFF
	dw TxtGloveRight&$FFFF,TxtGloveLeft&$FFFF,TxtWeight&$FFFF
RosterStatusTexts:					; the roster status words (Ice, Bench, Inj. P, Inj. G), then the hands
									; (Right, Left)
	dw TxtIce&$FFFF,TxtBench&$FFFF,TxtInjP&$FFFF,TxtInjG&$FFFF,TxtRight&$FFFF,TxtLeft&$FFFF
PhotoPaletteTable:					; per team (team order) a long pointer to its photo set: 6 palettes,
									; then the photos (as 94S PhotoPaletteTable); read 1-based (-4 + team x 4)
	dd PhotoPalettesANH,PhotoPalettesBOS,PhotoPalettesBUF,PhotoPalettesCGY
	dd PhotoPalettesCHI,PhotoPalettesDAL,PhotoPalettesDET,PhotoPalettesEDM
	dd PhotoPalettesFLA,PhotoPalettesHFD,PhotoPalettesLA,PhotoPalettesMTL
	dd PhotoPalettesNJ,PhotoPalettesNYI,PhotoPalettesNYR,PhotoPalettesOTW
	dd PhotoPalettesPHI,PhotoPalettesPIT,PhotoPalettesQUE,PhotoPalettesSJ
	dd PhotoPalettesSTL,PhotoPalettesTB,PhotoPalettesTOR,PhotoPalettesVAN
	dd PhotoPalettesWSH,PhotoPalettesWPG
	db $03,$F6,$F3,$AE,$05,$D7,$E9,$EE,$F3,$A1,$0A,$C9,$EE,$EA,$F5,$F2
	db $F9,$A0,$F4,$EF,$BA,$0E,$CF,$F5,$F4,$A0,$E6,$EF,$F2,$A0,$F0,$E5
	db $F2,$E9,$EF,$E4,$08,$F4,$E8,$E5,$A0,$E7,$E1,$ED,$E5,$09,$D0,$E5
	db $EE,$AE,$A0,$D3,$E8,$EF,$F4,$07,$D0,$E5,$EE,$E1,$EC,$F4,$F9,$50
	db $6C,$61,$79,$6F,$66,$66,$73,$40,$20,$44,$61,$79,$20
SeasonDates:						; per season day (A * 2) its date: bits 0-4 the day of the month, 5-7 the
									; weekday (DayNames), the high byte the month (MonthNames); 0 after the
									; last day
	db $25,$09
	db $46,$09,$67,$09,$88,$09,$A9,$09,$CA,$09,$0B,$09,$2C,$09,$4D,$09
	db $6E,$09,$8F,$09,$B0,$09,$D1,$09,$12,$09,$33,$09,$54,$09,$75,$09
	db $96,$09,$B7,$09,$D8,$09,$19,$09,$3A,$09,$5B,$09,$7C,$09,$9D,$09
	db $BE,$09,$DF,$09,$01,$0A,$22,$0A,$43,$0A,$64,$0A,$85,$0A,$A6,$0A
	db $C7,$0A,$08,$0A,$29,$0A,$4A,$0A,$6B,$0A,$AD,$0A,$CE,$0A,$0F,$0A
	db $30,$0A,$51,$0A,$72,$0A,$93,$0A,$B4,$0A,$D5,$0A,$16,$0A,$37,$0A
	db $58,$0A,$79,$0A,$9A,$0A,$BB,$0A,$DC,$0A,$1D,$0A,$3E,$0A,$41,$0B
	db $62,$0B,$83,$0B,$A4,$0B,$C5,$0B,$06,$0B,$27,$0B,$48,$0B,$69,$0B
	db $8A,$0B,$AB,$0B,$CC,$0B,$0D,$0B,$2E,$0B,$4F,$0B,$70,$0B,$91,$0B
	db $B2,$0B,$D3,$0B,$14,$0B,$35,$0B,$56,$0B,$77,$0B,$DA,$0B
