	AREA Lengthofsquare, CODE, READONLY
	ENTRY
MAIN
	LDR R0,=VALUE ;r0 stores first index of array
	LDRB R1,[R0] ;r1 holds one byte (ASCII character one byte) 
LOOP
	CMP R1,#0 ;Check for end of string
	BEQ L1
	ADD R2,#1
	LDRB R1,[R0,#1]!
	B LOOP
L1	
	LDR R4,=length
	STR R2,[R4] ;length output is saved in reg R2 and addr pointed by R4 (usually 0X40000000)
STOP B STOP
	ALIGN 4
VALUE DCB "ANDY MANDY"

	AREA op, DATA, READWRITE
length	DCD 0X0
	END