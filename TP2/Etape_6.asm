			org		$4
			
Vector_001  dc.l    Main

			org		$500
			
Main		movea.l	#STRING,a0  ; Initialise A0 avec l'adresse de la chaîne.

LowerCount  

			illegal

			org		$550
			
STRING      dc.b	"Cette chaine comporte 28 minuscules.",0
