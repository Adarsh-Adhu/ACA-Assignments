;Using ARM assembly, Check whether a decimal number stored in 4000 0000h is an Armstrong number or not.	
	AREA ARMSTRONG, CODE, READONLY
    ENTRY
MAIN
    LDR R0,=0X40000000 ;LOAD THE ADDRESS VALUE TO R0 REGISTER
    LDR R1,[R0] ;LOAD THE CONTENT TO REGISTER R1
    MOV R3,R1 ;KEEP A COPY AT REGISTER R3
    LDR R10,=0 ;CLEAR THE CONTENTS of R10
	
LOOP1
    CMP R1,#9 ;CHECK IF THE REMAINDER IS LESS THAN 9
    BLE LAST_ITR ;IF YES THEN PERFORM THE CUBE OPERATION FOR THE LAST DIGIT
    BL DIV ;BRANCH WITH LINK TO DIV
    MUL R8,R1,R1 ;FINDING THE CUBE
    MUL R9,R8,R1 ;STORE THE CUBE IN R9
    ADD R10,R10,R9 ;ADD THE VALUE AND STORE IN R10
    MOV R1,R2 ;MOVE TO QUOTIENT BACK TO R1
    B LOOP1 ;ITERATIVE LOOP
    
LAST_ITR
    MUL R8,R1,R1 ;FINDING CUBE
    MUL R9,R8,R1 ;STORE THE RESULT IN R9
    ADD R10,R10,R9 ;ADD THE VALUE
    B EN ;BRANCH TO EN TO CHECK IF THE NUMBER IS ARMSTRONG OR NOT
DIV
    MOV R2,#0 ;MAKE R2 ZERO
LOOP
    CMP R1,#9 ;CHECK IF THE REMAINDER IS LESS THAN 9
    BXLE LR ;SUB-ROUTINE IS USED AND WILL BRANCH TO THE NEXT INSTRUCTION IF LESS THAN 
    SUB R1,R1,#10 ;REPEATED DIVISION IS PERFORMED
    ADD R2,R2,#1 ;INCREMENTING THE VALUE TO GET THE QUOTIENT
    B LOOP ;ITERATIVELY PERFORM TILL CONDITION FAILS
EN
  CMP R10,R3 ;CHECK IF THE NUMBERS ARE EQUAL 
  BNE STOP ;IF NOT EQUAL THEN STOP THE EXECUTION 
  LDR R5,=0XFF ;ELSE SET R5 TO 1 INDICATING THAT THE NUMBER IS ARMSTRONG 
STOP B STOP ;INFINITE LOOP
    END ;END OF EXECUTION