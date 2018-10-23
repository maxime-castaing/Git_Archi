UpperCount  movem.l	d1/a0,-(a7)

			clr.l	d0

\loop       move.b	(a0)+,d1
			beq		\quit
			
			cmp.b	#'A',d1
			blo		\loop

			cmp.b	#'Z',d1
			bhi		\loop

			addq.l	#1,d0
			bra		\loop

\quit 		movem.l	(a7)+,d1/a0
			rts
