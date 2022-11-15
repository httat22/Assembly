;==========================================================================
;Viết chương trình nhập vào số nhị phân. 
;Đếm số lượng bit 1 và bit 0 trong số vừa nhập và in kết quả ra màn hình. 
;Nếu nhập sai yêu cầu nhập lại.
;==========================================================================

.model small
.stack 100h
.data   
enter equ 0dh,0ah
msg db "Nhap so nhi phan: $"
msg1 db enter,"Sai roi, nhap lai nao: $" 
msg2 db enter,"So luong bit 1: $"
msg3 db enter,"So luong bit 0: $"

num1 db 0
num0 db 0  
count db 0
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx, msg
    mov ah, 9
    int 21h
                                 
    ; nhap so nhi phan
    _input:
        mov ah, 1
        int 21h
        cmp al, 0dh
        je _print_1
        
        cmp al, 30h
        je _count_0
        cmp al, 31h
        je _count_1
        
        ;sai, nhap lai        
        lea dx, msg1
        mov ah, 9
        int 21h
        mov num1, 0
        mov num0, 0
        jmp _input   
        _count_0:
            inc num0
            jmp _input
        _count_1:
            inc num1
            jmp _input
    
    ; in so luong bit 1
    _print_1:
        lea dx, msg2
        mov ah, 9
        int 21h
        
        mov bl, 10                    
        mov ax, 0 
        mov al, num1
                            
        _push:
            mov dx, 0
            div bx                
            push dx
            inc count
            cmp ax, 0
            jne _push
            
        _pop:
            pop dx
            add dl, 30h
            mov ah, 2 
            int 21h
            dec count
            cmp count, 0
            jne _pop
            
     ; in so luong bit 0
     _print_0:
        lea dx, msg3
        mov ah, 9
        int 21h
        
        mov bl, 10                    
        mov ax, 0 
        mov al, num0
                            
        _push0:
            mov dx, 0
            div bx                
            push dx
            inc count
            cmp ax, 0
            jne _push0
            
        _pop0:
            pop dx
            add dl, 30h
            mov ah, 2 
            int 21h
            dec count
            cmp count, 0
            jne _pop0                       
    _out:    
        mov ah, 4ch
        int 21h        
            
main endp
    end main