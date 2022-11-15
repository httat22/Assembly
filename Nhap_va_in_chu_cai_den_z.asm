.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC 
    MOV DX, 0
    MOV AH, 1
     
    _WHILE:
        INT 21H
        ; IF (AL >= 'a') AND (AL <= 'z')
        CMP AL, 'a'
        JNGE _WHILE
        CMP AL, 'z'
        JNLE _WHILE
        
        MOV BL, AL
		
		; XUONG DONG
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        MOV DL, 0DH
        INT 21H
        
    ; PRINT
        MOV DX, 0
        MOV AH, 2
        MOV DL, BL
        
        _WHILE_TWO:
            ; PRINT CHAR             
            INT 21H
            INC BL
            
            CMP BL, 'z'
            JNLE _END
             
            INC DX
            JMP _WHILE_TWO
    _END:
        MOV AH, 4CH
        INT 21H
MAIN ENDP
    END MAIN