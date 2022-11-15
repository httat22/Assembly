;=========================================================
;Viết chương trình nhập và in ra màn hình số nhị phân. 
;Nếu nhập sai thì yêu cầu nhập lại.
;=========================================================

.model small
.stack 100h
.data   
enter equ 0dh,0ah
msg db "Nhap so nhi phan: $"
msg1 db enter,"Sai roi, nhap lai nao: $" 
msg2 db enter,"So nhi phan vua nhap la: $"
count db ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,msg
    mov ah,9
    int 21h
        
    xor bx, bx
    mov count,16
    ; nhap so nhi phan
    _input:    
        _while:
            mov ah,1
            int 21h            
            
            ; kiem tra bang 0 hoac 1       
            cmp al,30h
            je _in
            cmp al,31h
            je _in
                                    
            cmp al,0dh
            je _print
        
            ; neu sai, nhap lai
            lea dx,msg1
            mov ah,9
            int 21h
            
            xor bx,bx
            mov count,16
            jmp _while
             
        _in:
            and al,0fh     ;doi ra gia tri nhi phan
            shl bx,1
            or bl,al
            
            ; kiem tra da nhap du 16 ky tu
            dec count
            cmp count,0
            je _print
            
            jmp _while 
    
    ; in so nhi phan       
    _print:
        lea dx,msg2
        mov ah,9
        int 21h
         
        mov cx, 16
        mov ah,2    
        _for:
            rol bx,1
            jc _print_1
            
            ; print 0
            mov dl, 30h             
            int 21h
            loop _for
            
            ; ket thuc neu cx = 0
            jcxz _end
            _print_1:
                
                mov dl, 31h
                int 21h
                
            loop _for                 
    _end:
    mov ah,4ch
    int 21h        
            
main endp
    end main