;========================================================
; Su dung vong LOOPNE viet cac lenh doc cac ky tu den khi
;ky tu ve dau don duoc danh vao hoac da nhap du 80 ky tu
;========================================================
.model small
.stack 100h 
.code
main proc
    mov cx,80
    _loopne:
        mov ah,1
        int 21h
        cmp al, 0dh
        ;loopne/loopnz
        loopne _loopne                 
    
    skip:
        mov ah, 4ch
        int 21h        
            
main endp
    end main
