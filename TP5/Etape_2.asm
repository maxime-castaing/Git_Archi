Print           ; Sauvegarde les registres dans la pile.
				movem.l	d0/d1/a0,-(a7)

\loop           ; Charge un caractère de la chaîne dans D0.
				; Si le caractère est nul, il s'agit de la fin de la chaîne.
				; On peut sortir du sous-programme.
				move.b	(a0)+,d0
				beq		\quit

				; Affiche le caractère.
				jsr     PrintChar

				; Incrémente la colonne d'affichage du caractère,
				; et reboucle.
				addq.b	#1,d1
				bra	  \loop

\quit           ; Restaure les registres puis sortie.
				movem.l	(a7)+,d0/d1/a0
				rts
