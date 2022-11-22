	AREA Factorialsubroutine, CODE, READONLY
	ENTRY
MAIN
	LDR R0,VALUE
	LDR R3,=1
	BL LOOP ;Call subroutine to calculate factorial and store next inst in link register
	LDR R4,=0X40000000 
	STR R3,[R4] ;store result of factorial in memory
;sub-routine
LOOP
	CMP R0,#1
	BXEQ LR ;return to instruction stored in link register
	MUL R5,R3,R0
	MOV R3,R5
	SUB R0,#1
	B LOOP
STOP B STOP	
VALUE DCD 10	
	END