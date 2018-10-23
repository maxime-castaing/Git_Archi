RemoveSpace     ; Sauvegarde les registres dans la pile.
				movem.l	d0/a0/a1,-(a7)
				
				; Fait pointer A1 sur la chaîne destination.
				; (Même chaîne que la source.)
				movea.l	a0,a1

\loop          	; Charge un caractère de la chaîne dans D0 et incrémente A0.
				move.b	(a0)+,d0

				; Si le caractère est un espace, saut à \loop.
				cmpi.b	#' ',d0
				beq  	\loop

				; Sinon, on copie le caractère dans la destination
				; et on incrémente le pointeur destination.
				; Si le caractère qui vient d'être copié n'est pas nul,
				; saut à loop.
				move.b	d0,(a1)+
				bne  \loop

\quit       	; Restaure les registres puis sortie.
				movem.l	(a7)+,d0/a0/a1
				rts
