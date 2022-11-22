	AREA Squareroot, CODE, READONLY
	ENTRY
MAIN
	MOV R0,#0x40000000
	MOV R1,#0x40000030
	LDR R0,[R0]
	
	MOV R2,#1		;Moving Value 1 to R2   
	MOV R3,#1		;Moving 1 to R3 ,Considering Result = 1)
LOOP
	CMP R3,R0 		;Comparing R0 with R3
	BGE NEXT
	ADD R2,#1 		;Adding 1 to R2 (Increment)
	MUL R3,R2,R2 	;Multiplying result R2 with R2
	B LOOP
NEXT
	STR R2,[R1]
STOP
	END
	