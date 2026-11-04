TitleStartMusicTask:				; starts the title music after the task delay and disables this task
	lda.w $0008,x
	cmp.w #$0177
	bcc TitleStartMusicTaskReturn
	lda.w #$00A4
	jsl.l StartSound
	stz.w MenuMusicPending
	lda.w #TitleStartMusicTaskReturn
	sta.w $0002,x
TitleStartMusicTaskReturn:			; TitleStartMusicTask's rtl; also the task's routine once the song started
	rtl
