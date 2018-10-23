IsCharError     ; Sauvegarde les registres dans la pile.
				movem.l	d0/a0,-(a7)
				
\loop           ; Charge un caractère de la chaîne dans D0 et incrémente A0.
                ; Si le caractère est nul, on renvoie false (pas d'erreur).
				move.b	(a0)+,d0
                beq  	\false
				; Compare le caractère au caractère '0'.
				; S'il est inférieur, on renvoie true (ce n'est pas un chiffre).
				cmpi.b	#'0',d0
				blo		\true
				
				; Compare le caractère au caractère '9'.
                ; S'il est inférieur ou égal, on reboucle (c'est un chiffre).
				; S'il est supérieur, on renvoie true (ce n'est pas un chiffre).
				cmpi.b	#'9',d0
				bls  	\loop

\true           ; Sortie qui renvoie Z = 1 (erreur).
				; (L'instruction BRA ne modifie pas le flag Z.)
				ori.b	#%00000100,ccr
				bra 	\quit

\false          ; Sortie qui renvoie Z = 0 (aucune erreur).
				andi.b	#%11111011,ccr

\quit           ; Restaure les registres puis sortie.
				; (Les instructions MOVEM et RTS ne modifient pas le flag Z.)
				movem.l	(a7)+,d0/a0
				rts
