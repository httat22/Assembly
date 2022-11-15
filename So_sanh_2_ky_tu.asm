TITLE PGM:
.MODEL SMALL
.STACK 100H
.DATA
MSG DB "ENTER A CHAR: $"
.CODE
MAIN PROC  
    MOV AX, @DATA
    MOV DS,AX
    ;NHAP KY TU 1
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H        
    
    MOV BL,AL
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    ;NHAP KY TU 2
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    ;HIEN THI
    MOV AH,2 
    
    MOV DL, 0AH
    INT 21H
    
    MOV DL, 0DH
    INT 21H
    
    ;XU LY
    CMP BL,CL     ;BL>CL
    JG  THEN
    
    MOV DL,BL
    INT 21H
    JMP ELSE_
    
    THEN:  
        ;MOV AH,2
        MOV DL,CL
        INT 21H
        JMP ELSE_
    ELSE_:    
        MOV AH,4CH
        INT 21H
MAIN ENDP
    END MAIN




