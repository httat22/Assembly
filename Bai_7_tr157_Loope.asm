;========================================================
; Su dung vong LOOPE viet cac lenh doc cac ky tu den khi
;mot ky tu khac ky tu trang duoc danh vao hoac da nhap du
;80 ky tu
;========================================================
.model small
.stack 100h 
.code
main proc
    mov cx,80   
    _loope:          
        mov ah,1
        int 21h 
        cmp al, 20h
        ;loope/loopz
        loope _loope                
    
    skip:
        mov ah, 4ch
        int 21h        
            
main endp
    end main
