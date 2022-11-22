	AREA Sum532bit, CODE, READONLY
	ENTRY
MAIN
	LDR R1,=0X40000000 ; R1 Holds starting addr of the array
	LDR R3,=5; ;holds size of array
	LDR R5,[R1]
LOOP
	CMP R3,#0
	BEQ NEXT
	ADD R2,R2,R5
	SUB R3,#1
	LDR R5,[R1,#4]! ; pre index increment with write back to r1 => r1=r1+k
	B LOOP
NEXT 
	LDR R4,=0X40001000
	STR R2,[R4]
STOP	
	
	END