TITLE PGM:
.MODEL SMALL
.STACK 100H
.DATA 
CR EQU 0DH
LF EQU 0AH
MSG  DB "NHAP KY TU: $"
MSG1 DB CR,LF,"GOOD MORNING!$"
MSG2 DB CR,LF,"GOOD AFTERNOON!$"
MSG3 DB CR,LF,"GOOD EVERNING!$"
MSG4 DB CR,LF,"NHAP SAI KY TU!$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    ;NHAP KY TU
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H  
    
    ;XU LY
    MOV AH,9
    
    ;CHAR = 'S' OR 's'
    CMP AL,'S'
    JE _MORNING
    CMP AL,'s'
    JE _MORNING
    
    ;CHAR = 'C' OR 'c'
    CMP AL,'C'
    JE _AFTERNOON
    CMP AL,'c'
    JE _AFTERNOON
    
    ;CHAR = 'E' OR 'e'
    CMP AL,'E'
    JE _EVERNING
    CMP AL,'e'
    JE _EVERNING 
	
	JMP _ERROR
    
    JMP _END_IF
    
    _MORNING:
       LEA DX,MSG1 
       ;MOV AH,9
       INT 21H
    _AFTERNOON:
       LEA DX,MSG2 
       ;MOV AH,9
       INT 21H   
    _EVERNING:
       LEA DX,MSG3
       ;MOV AH,9
       INT 21H  
	_ERROR:
	   LEA DX,MSG4
       ;MOV AH,9
       INT 21H
    
    _END_IF:
       MOV AH,4CH
       INT 21H
MAIN ENDP
    END MAIN
