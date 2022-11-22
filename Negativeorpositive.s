	AREA Negativeorpositive, CODE, READONLY
	ENTRY
MAIN
	LDR R0,VALUE ;assume that the 32 bit number is signed number 
	LDR R1,=1	
	ANDS R0,R1,LSL #31 ; check for the 32nd bit 
	BNE NEXT	; if 32 bit is not zero number is negative
	LDR R2,=0XFFFFFFFF ; if 32 bit number is positive make all bits of R2 as 1
	B STOP 	
NEXT				;R2 is used as a flag for number being +ve or -ve
	LDR R2,=0	; if 32 bit number is negative make all bits of R2 as 0
VALUE DCD 115		;value to check
STOP B STOP
	END