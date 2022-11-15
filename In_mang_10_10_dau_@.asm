.MODEL SMALL
.STACK 100H
.DATA
    LF EQU 0AH  ;XUONG DONG
    CR EQU 0DH  ;VE DAU DONG
    ;MSG DB "**********", 0DH, 0AH, "$"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
   
    MOV CX, 10
    ;LEA DX, MSG
    ;MOV AH, 9
    JCXZ _SKIP
    
    _FOR_1:
		MOV BL, 10
		MOV AH, 2
		MOV DL, '@'
		
		_FOR_2:
			INT 21H
			DEC BL
			JNZ _FOR_2
			
			; XUONG DONG
			MOV AH, 2
			MOV DL, 0AH
			INT 21H
			MOV DL, 0DH
			INT 21H
			
			LOOP _FOR_1
    
    _SKIP:
        MOV AH, 4CH
        INT 21H
    
MAIN ENDP
    END MAIN