IsMaxError      ; Sauvegarde les registres dans la pile.
				movem.l	d0/a0,-(a7)
				
				; On récupère la taille de la chaîne (dans D0).
				jsr     StrLen
				
				; Si la chaîne a plus de 5 caractères, renvoie true (erreur).
				; Si la chaîne a moins de 5 caractères, renvoie false (pas d'erreur).
				cmpi.l	#5,d0
				bhi  	\true
				blo  	\false
				
				; Si la chaîne contient exactement 5 caractères :
				; comparaisons successives avec '3', '2', '7', '6' et '7'.
				; Si supérieur, on quitte en renvoyant une erreur.
				; Si inférieur, on quitte sans renvoyer d'erreur.
				; Si égal, on compare le caractère suivant.
				cmpi.b	#'3',(a0)+
				bhi  	\true
				blo  	\false
				
				cmpi.b	#'2',(a0)+
				bhi  	\true
				blo	 	\false
				
				cmpi.b	#'7',(a0)+
				bhi  	\true
				blo  	\false
				
				cmpi.b	#'6',(a0)+
				bhi  	\true
				blo  	\false
				
				cmpi.b	#'7',(a0)
				bhi 	\true
				
\false          ; Sortie qui renvoie Z = 0 (aucune erreur).
				; (L'instruction BRA ne modifie pas le flag Z.)
				andi.b	#%11111011,ccr
				bra  	\quit

\true           ; Sortie qui renvoie Z = 1 (erreur).
				ori.b	#%00000100,ccr
				
\quit           ; Restaure les registres puis sortie.
				; (Les instructions MOVEM et RTS ne modifient pas le flag Z.)
				movem.l	(a7)+,d0/a0
				rts
