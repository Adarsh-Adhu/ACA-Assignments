	AREA HexatoASCII, CODE, READONLY
	ENTRY
MAIN
	LDR R0,=0X40000000 ;32-bit number to be converted to ascii
	LDR R4,=0x40000100 ; addrs to store the ascii string
	LDR R1,[R0]
	LDR R2,=8				; no of iterations

LOOP
	CMP R2,#0
	BEQ	STOP
	AND R3,R1,#0XF 			; only get last nibble of the No in R3
	CMP R3,#0XA 
	BLT NEXT
	ADD R3,R3,#"A"-"0"-0XA 	;find offset if digit is more than 9
NEXT
	ADD R3,R3,#"0" 			;add ASCII value of '0' to the digit
	STRB R3,[R4],#1 		; store the ascii in dest addr 
	MOV R1,R1,LSR #1 		; right shift to find ascii of the next bit
	SUB R2,#1 				;decrement the looping variable
	B LOOP  				;repeat process
STOP B STOP
	END