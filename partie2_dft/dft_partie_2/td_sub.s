; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
	export	calculk;
		
calculk	proc
	
	; r0 = tabSig    r1 : k   r2 : tabCos ou TaSig
	push	{lr}
	push	{r4-r7}
	mov		r12, #0x00  ; i=0
	b		loop
	
loop
	;calcul ik
	mul		r7,r1,r12
	AND		r7, #0x03F   ;modulo 64
	
	ldrsh	r4,[r2,r7, lsl #0x01]   ;cos(ik) ou sin(ik)
	ldrsh	r5,[r0,r12, lsl #0x01]   ;x(i)
	
	mul		r4,r4,r5	;cos(ik)x(i) ou sin(ik)x(i)

	add		r6,r4
	
	add		r12,#0x01
	
	cmp		r12,#64
	bne		loop
	
	; on quitte la boucle
	
	mov		r0,r6
	b 		fin
fin
	pop		{r4-r7}
	pop		{pc}
	
	endp
	end