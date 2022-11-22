;check whether the given 32-bit number stored in memory 4000 0000h is palindrome or not
   AREA PALINDROME, CODE, READONLY
   ENTRY
MAIN
    LDR R0,=0X40000000; LOAD THE ADDRESS FOR 32-BIT NUMBER
    LDR R1,[R0] ;LOAD THE VALUE INTO REGISTER R1
	LDR R9,=4 ;COUNTER VARIABLE
    LDR R2,=0X0000FFFF ;LOAD THE VALUE TO REGISTER R2
    LDR R3,=0XFFFF0000 ;LOAD THE VALUE TO REGISTER R3
    AND R4,R1,R2 ;AND OPERATION TO GET THE LOWER HALF-WORD 
    AND R5,R1,R3 ;;AND OPERATION TO GET THE UPPER HALF-WORD 
    MOV R5,R5,LSR #16 ;LOGICAL SHIFT-RIGHT AND STORE IN R5
    LDR R2,=0X0000000F ;GET THE FIRST VALUE
    LDR R3,=0X0000F000 ;GET THE LAST VALUE
LOOP
    CMP R9,#0 ;CHECK IF THE COUNT IS ZERO
    BEQ EXIT ;IF YES BRANCH TO EXIT
    AND R6,R4,R2 ;AND THE CONTENTS AND STORE FIRST VALUE IN R6
    AND R7,R5,R3 ;AND THE CONTENTS AND STORE THE LAST VALUE IN R7
    MOV R7,R7,LSR #12 ;LOGICAL SHIFT-RIGHT THE LAST VALUE AND RETAIN IT IN R7
    CMP R7,R6 ;COMPARE R7 AND R6
    BNE NOT_PAL ;BRANCH TO NOT_PAL IF NOT EQUAL
    MOV R4,R4,LSR #4 ;LOGICAL SHIFT-RIGHT R4 TO GET THE NEXT VALUE
    MOV R5,R5,LSL #4 ;LOGICAL SHIFT-LEFT R5 TO GET THE NEXT VALUE
    SUB R9,R9,#1 ;DECREMENT THE COUNT
    B LOOP ;ITERATE THE LOOP TILL COUNT EQUALS ZERO
EXIT
    LDR R10,=0 ;SET R10(FLAG) TO ZERO IF ITS A PALINDROME
    B STOP ;STOP THE EXECUTION
NOT_PAL
    LDR R10,=0xFF ;SET THE R10 TO 1 IF ITS NOT A PALINDROME
    B STOP
STOP B STOP    ;INFINITE LOOPING
    END ;END OF EXECUTION