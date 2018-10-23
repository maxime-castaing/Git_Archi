AlphaCount	; Compte le nombre de minuscules
			; et empile le résultat.
			jsr     LowerCount
			move.l	d0,-(a7)
			
			; Compte le nombre de majuscules et l'additionne
			; au sommet de la pile (sans dépiler).
			; Sommet de la pile = Minuscules + Majuscules
			jsr     UpperCount
			add.l   d0,(a7)

			; Compte le nombre de chiffres.
			; Le sommet de la pile (Minuscules + Majuscules)
			; est additionné au nombre de chiffres (D0).
			; La somme est stockée dans D0.
			; D0 = Minuscules + Majuscules + Chiffres
			; Le sommet de la pile est dépilé (post incrémentation).
			jsr     DigitCount
			add.l   (a7)+,d0

			; Retour de sous-programme.
			rts
