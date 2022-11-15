TITLE PGM:
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    MOV AH,1
    INT 21H
    mov bl,al
    
    mov ah,2
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN




