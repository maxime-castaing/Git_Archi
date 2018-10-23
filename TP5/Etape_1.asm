Convert         ; Si la chaîne est nulle,
				; on quitte en renvoyant false (erreur).
				tst.b	(a0)
				beq 	\false
				
				; (À ce stade, la chaîne n'est pas nulle.)
				; S'il existe une erreur sur les caractères,
				; on quitte en renvoyant false (erreur).
				jsr     IsCharError
				beq  	\false

				; (À ce stade, la chaîne n'est pas nulle
				;  et ne contient que des chiffres.)
				; Si le nombre que contient la chaîne est supérieur à 32767,
				; on quitte en renvoyant false (erreur).
				jsr     IsMaxError
				beq  	\false
				; La chaîne est valide, il ne reste plus qu'à la convertir
				; puis à quitter en renvoyant true (aucune erreur).
				jsr     Atoui

\true           ; Sortie qui renvoie Z = 1 (aucune erreur).
				ori.b	#%00000100,ccr
				rts

\false          ; Sortie qui renvoie Z = 0 (erreur).
				andi.b	#%11111011,ccr
				rts
