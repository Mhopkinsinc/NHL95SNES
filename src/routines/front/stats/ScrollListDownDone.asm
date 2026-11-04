ScrollListDownDone:					; the end of a list scroll: padlast1 and padchangeany cleared, then
									; ScrollListDownReturn
	stz.w padlast1
	stz.w padchangeany
ScrollListDownReturn:				; the rts ScrollListDown leaves through when the list is at its end
	rts
