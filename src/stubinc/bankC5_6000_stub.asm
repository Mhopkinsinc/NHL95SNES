;	Segment build for bankC5_6000.asm: sets the mapping and the outside labels it uses, then includes the file
;	on its own for checking against the ROM (tools/verify_segment.sh bankC5_6000). The org is in the segment
;	file.
hirom
incsrc "../inc/snes_regs.asm"
incsrc "../ram95s.asm"

; External addresses outside, read from the ROM. Equates only (the full build has the labels).
MapTileBlock = $C387D8
TeamCityNames = $C3585C
PerLabels = $C35E25
ScoringStrengthTexts = $C35E2D
SeasonDates = $C35F60
ReadMenuPads = $C36C2D
Penaltylist = $C34499
SendTextMap = $C4C2AA
UnpackText = $C4C3BA
AllocWorkBuf = $C4C558
WaitTransfers = $C4CEDB
PrintTextPage = $C4BB5A
PrintBoldCentred = $C4BBE5
PrintBoldCentredStr = $C4BBF1
PrintBoldLeft = $C4BBFC
PrintBoldLeftStr = $C4BC08
PrintBoldRightStr = $C4BC1A
PrintItalicLeft = $C4BC26
PrintItalicCentred = $C4BCA4
PrintTitleBar = $C4BDE6
ShowRosterLine = $C56F5C
AnimateSprites = $C5E9C7
BCDTable = $C08C76
BuildSpriteOAM = $C5F0D1
QuitGame = $C5004E
GetPadTeam = $C53ABC
reenergizeteam = $C54AEF
DrawPauseTab = $C54FA9
PrintPauseItems = $C552AC
SetupScreen = $C55951
ExitToPauseMenu = $C55A09
SetupStatsPage = $C55A40
StartScrollList = $C55ABC
ScrollListArrows = $C55BE8
RedrawScrollList = $C55C12
ScrollListDown = $C55C58
ScrollListUp = $C55CE6
TeamLogoSprite = $C55E57
BCDText = $C55EC7
BCDTextAt = $C55ECA
FitNameToMesarea = $C55F1F
ClearRAM7E = $C58B11
CopyFlipString2 = $C58BB9
BCDDigits4 = $C5A321
DeleteSprite = $C5E596
PackOAMHigh = $C5F3DB
GameStatFormats = $C55D6B
Div16U = $C091F3
Div16x8U = $C09257
FadeOutWait = $C58A99
Mul8U = $C08ED9
WaitFrames_Inc = $C08D89
PlayerStatsPage = $C3533B
TeamRosterPage = $C35369
TxtGoalies = $C347F8
TxtA = $C34F73
TxtBGoalies = $C34EF6
TxtBPlayers = $C34EFE
TxtG = $C34F71
TxtGA = $C34F7D
TxtGoalAss = $C34F91
TxtGoalie = $C349B8
TxtNoPenalties = $C34C2D
TxtNoScoring = $C34C43
TxtPM = $C34F7B
TxtPS = $C34F8E
TxtPer = $C34F83
TxtPlayer = $C34F6C
TxtPt = $C34F75
TxtPtg = $C34F7F
TxtSh = $C34F78
TxtTime = $C34F87
TxtTm = $C34F8B
TxtTotal = $C34C1C
TxtAssists = $C34B6F
TxtGoals = $C34B6A
TxtPenalties = $C34808
TxtPoints = $C34B75
TxtShots = $C34B9E
BlankPauseItems = $C35D41

incsrc "../bankC5_6000.asm"
