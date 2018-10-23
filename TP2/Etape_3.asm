			org		$4

Vector_001  dc.l    Main

			org		$500

Main        move.l	#-1,d0      ; Initialise D0.
		
Abs			clr.l	d1
			cmp.l	d1,d0
			bgt		Exit
			neg.l   d0
Exit
			
			illegal
