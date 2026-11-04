PuckCarrierGlideStopped:			; start backward glide and stand still while play is stopped
	jsl.l GlideBack
	jmp.w donothing
