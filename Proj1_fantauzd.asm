TITLE Project 1 Elementary Arithmetic    (Proj1.fantauzd.asm)

; Author:  Dominic Fantauzzo
; Last Modified:  10/13/2023
; OSU email address:  fantauzd@oregonstate.edu
; Course number/section:  CS271 Section 400
; Project Number:	1			Due Date:	10/23/2023
; Description: This program displays the name of its creator and 
;	  the program title on the output screen, prompts the user
;	  to enter three numbers in strictly descending order,
;	  calculates and display the sum and differences of these numbers,
;	  and displays a closing message.

INCLUDE Irvine32.inc

.data

intro_1      BYTE   "		Elementary Arithmetic	  by Dominic Fantauzzo",13,10,"**EC: Program repeats until the user chooses to quit.",13,10,"**EC: Program verifies the numbers are in desceding order.",13,10,0
prompt_1     BYTE   "Enter 3 non-negative numbers, such that A > B > C. I'll show you the sums and differences.",0
promptForA   BYTE   "First number: ",0
valueA       DWORD  ?
promptForB   BYTE   "Second number: ",0
valueB       DWORD  ?
promptForC   BYTE   "Third number: ",0
valueC       DWORD  ?
goodbye      BYTE   "I hope you enjoyed Elementary Arithmetic!  Feel free to go again!",0
orderError	 BYTE   "ERROR: The numbers are not in descending order! Try again!",0
sumA_B       DWORD  ?
diffA_B      DWORD  ?
sumA_C       DWORD  ?
diffA_C      DWORD  ?
sumB_C       DWORD  ?
diffB_C      DWORD  ?
sumA_B_C     DWORD  ?
addSign      BYTE   " + ",0
subSign      BYTE   " - ",0
eqSign       BYTE   " = ",0


.code
main PROC

; introduction
	mov   EDX, OFFSET intro_1
	call  WriteString
	call  CrLf

; get the data, checks if numbers are in descending order
_start:
	mov   EDX, OFFSET prompt_1
	call  WriteString
	call  CrLf
	call  CrLf
	mov   EDX, OFFSET promptForA          ; prompts user for the number A
	call  WriteString
	call  ReadDec
	mov   valueA, EAX                     ; stores it in variable
	call  CrLf
	mov   EDX, OFFSET promptForB          ; prompts user for the number B
	call  WriteString
	call  ReadDec
	mov   valueB, EAX                     ; stores number B in variable
	CMP   valueA, EAX
	JNG   _notdescending
	call  CrLf
	mov   EDX, OFFSET promptForC          ; prompts user for the number C
	call  WriteString
	call  ReadDec
	mov   valueC, EAX                     ; stores number C in variable
	CMP   valueB, EAX
	JNG   _notdescending
	call  CrLf

; calculate the required values
	mov  EAX, valueA                     ; sets EAX reg to valueA
	add  EAX, valueB
	mov  sumA_B, EAX                     ; stores sum of valueA and valueB in variable
	mov  EAX, valueA                     ; resets EAX reg to valueA
	sub  EAX, valueB
	mov  diffA_B, EAX                    ; stores difference of valueA and valueB in variable
	mov  EAX, valueA                     ; repeats process for A and C
	add  EAX, valueC
	mov  sumA_C, EAX
	mov  EAX, valueA
	sub  EAX, valueC
	mov  diffA_C, EAX
	mov  EAX, valueB                     ; repeats process for B and C
	add  EAX, valueC
	mov  sumB_C, EAX
	mov  EAX, valueB
	sub  EAX, valueC
	mov  diffB_C, EAX
	mov  EAX, valueA
	add  EAX, valueB
	add  EAX, valueC
	mov  sumA_B_C, EAX                   ; stores sum of all three input values in variable

; display the results
	mov   EAX, valueA                     
	call  WriteDec
	mov   EDX, OFFSET addSign
	call  WriteString
	mov   EAX, valueB
	call  WriteDec
	mov   EDX, OFFSET eqSign
	call  WriteString
	mov   EAX, sumA_B                     ; with previous calls, outputs "valueA + valueB = sumA_B"
	call  WriteDec
	call  CrLF
	mov   EAX, valueA
	call  WriteDec
	mov   EDX, OFFSET subSign
	call  WriteString
	mov   EAX, valueB
	call  WriteDec
	mov   EDX, OFFSET eqSign
	call  WriteString
	mov   EAX, diffA_B
	call  WriteDec                      ; with previous calls, outputs "valueA - valueB = diffA_B"
	call  CrLf
	mov   EAX, valueA
	call  WriteDec
	mov   EDX, OFFSET addSign
	call  WriteString
	mov   EAX, valueC
	call  WriteDec
	mov   EDX, OFFSET eqSign
	call  WriteString
	mov   EAX, sumA_C
	call  WriteDec                      ; with previous calls, outputs "valueA + valueC = sumA_C"
	call  CrLF
	mov   EAX, valueA
	call  WriteDec
	mov   EDX, OFFSET subSign
	call  WriteString
	mov   EAX, valueC
	call  WriteDec
	mov   EDX, OFFSET eqSign
	call  WriteString
	mov   EAX, diffA_C
	call  WriteDec                     ; with previous calls, outputs "valueA - valueC = diffA_C"
	call  CrLf
	mov   EAX, valueB
	call  WriteDec
	mov   EDX, OFFSET addSign
	call  WriteString
	mov   EAX, valueC
	call  WriteDec
	mov   EDX, OFFSET eqSign
	call  WriteString
	mov   EAX, sumB_C
	call  WriteDec                    ; with previous calls, outputs "valueB + valueC = sumB_C"
	call  CrLF
	mov   EAX, valueB
	call  WriteDec
	mov   EDX, OFFSET subSign
	call  WriteString
	mov   EAX, valueC
	call  WriteDec
	mov   EDX, OFFSET eqSign
	call  WriteString
	mov   EAX, diffB_C
	call  WriteDec                   ; with previous calls, outputs "valueB - valueC = diffB_C"
	call  CrLf
	mov   EAX, valueA
	call  WriteDec
	mov   EDX, OFFSET addSign
	call  WriteString
	mov   EAX, valueB
	call  WriteDec
	call  WriteString
	mov   EAX, valueC
	call  WriteDec
	mov   EDX, OFFSET eqSign
	call  WriteString
	mov   EAX, sumA_B_C
	call  WriteDec
	call  CrLf                     ; with previous calls, outputs "valueA + valueB + valueC = sumA_B_C"
	
; say goodbye
	call  CrLf
	mov   EDX, OFFSET goodbye
	call  WriteString
	call  CrLf
	call  CrLf
	JMP   _start

; return message when user inputs are not in descending order
_notdescending:
	call  CrLF
	mov   EDX, OFFSET orderError
	call  WriteString
	call  CrLf
	call  CrLf
	JMP   _start

	Invoke ExitProcess,0	; exit to operating system
main ENDP

END main
