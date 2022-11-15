TITLE PGM:
.MODEL SMALL
.STACK 100H
.DATA
CR EQU 0DH
LF EQU 0AH
MSG1 DB "ENTER A LOWER CASE LETTER: $"
MSG2 DB CR,LF,"IN UPER CASE IT IS: "
CHAR DB ?, "$" 
MSG3 DB CR,LF,"KY TU KO NAM TRONG a - z!$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX, MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    ; IF (AL >= 'A') AND (AL <= 'Z')
    CMP AL, 'a'
    JNGE _ELSE
    CMP AL, 'z'
    JNLE _ELSE 
    
    ; PRINT 
        SUB AL,20H
        MOV CHAR,AL
              
        LEA DX, MSG2
        MOV AH, 9
        INT 21H
        JMP _END
    
    _ELSE:
        LEA DX, MSG3
        MOV AH,9
        INT 21H
    
    _END:
        MOV AH,4CH
        INT 21H
MAIN ENDP
    END MAIN




