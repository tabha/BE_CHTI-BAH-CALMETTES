	thumb
		
	area mesdata, data, readwrite ;
FLAG	DCD 0 ; intialisation d'un flag
	
	
	area  moncode, code, readonly
	export	timer_callback

GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register
	
	
timer_callback proc
	ldr	r0, =FLAG
	ldr	r2, [r0]
	cbz	r2, si_alors ; si r2 = 0 aller au else
	cbnz	r2, sinon    ; si r2 = 1 aller au if
si_alors
; mise a 1 de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00000002
	str	r1, [r3]
	mov	r2, #0x1
	str	r2, [r0]
	bx	lr

sinon		
; mise a 0 de PB1
	ldr	r3, =GPIOB_BSRR
	mov	r1, #0x00020000
	str	r1, [r3]
	mov	r2, #0x0
	str	r2, [r0]
	bx	lr
; N.B. le registre BSRR est write-only, on ne peut pas le relire
	endp
	end