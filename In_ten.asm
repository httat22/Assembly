TITLE PGM:
.MODEL SMALL
.STACK 100H
.DATA
TEN DB  "HA TRONG THUAN $"
LOP DB  "LOP B15D52 $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, TEN
    MOV AH, 9
    INT 21H 
    
    MOV AH, 2
    MOV DL, 0AH 
    INT 21H  
    MOV DL, 0DH
    INT 21H
    
    LEA DX, LOP
    MOV AH, 9
    INT 21H
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
    END MAIN



