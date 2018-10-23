NextOp          ; Si le caratère est nul (fin de chaîne),
				; il n'y a pas d'opérateur dans la chaîne.
				; A0 pointe sur le caractère nul. On quitte.
				tst.b	(a0)
				beq  	\quit
				
				; Comparaisons successives du caractère aux 4 opérateurs.
				; Si le caractère est un opérateur, on peut quitter.
				; (A0 contient l'adresse de l'opérateur.)
				cmpi.b	#'+',(a0)
				beq 	\quit
				
				cmpi.b	#'-',(a0)
				beq	 	\quit

				cmpi.b	#'*',(a0)
				beq		\quit

				cmpi.b	#'/',(a0)
				beq 	\quit

				; Passage au caractère suivant.
				addq.l	#1,a0
				bra     NextOp

\quit           ; Sortie.
				rts
