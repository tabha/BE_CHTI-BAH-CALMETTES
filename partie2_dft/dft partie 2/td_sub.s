; ce programme est pour l'assembleur RealView (Keil)
	thumb
	area  moncode, code, readonly
	export	calculReelk;
	import TabSin
	import TabCos
	import TabSig
calculReelk	proc
	
	; r0 = k    r1 : addr de retour du tableau
	push	{r4-r7}
	mov		r12, #0x00  ; i=0
	ldr		r3, =TabCos
	ldr		r2, =TabSig
	b		loop
	
loop
	;calcul ik
	mul		r7,r0,r12
	AND		r7, #0x03F   ;modulo 64
	
	ldrsh	r4,[r3,r7, lsl #0x01]   ;cos(ik)
	ldrsh	r5,[r2,r12, lsl #0x01]   ;x(i)
	
	mul		r4,r4,r5	;cos(ik)x(i)

	add		r6,r4
	
	add		r12,#0x01
	
	cmp		r12,#64
	bne		loop
	
	; on quittz la boucle
	
	str		r6,[r1]
	b 		fin
fin
	pop		{r4-r7}
	bx		lr

	endp
	end