;==========================================================================
;Viết chương trình nhập và in ra màn hình số thập lục phân. 
;Nếu sai yêu cầu nhập lại.
;==========================================================================
.model small
.stack 100h
.data
enter equ 0ah, 0dh
msg db "Nhap vao so hex: $"
msg1 db enter,"Sai roi, nhap lai nao: $" 
msg2 db enter,"So vua nhap la: $"
count db ? 
num db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, msg
    mov ah, 9
    int 21h
    
    ; nhap so hex va kiem tra tinh hop le
    mov count, 4
	xor bx, bx
	mov cl, 4   ; bo dem 4 lan dich
	
	_while:
		dec count
		mov ah, 1
		int 21h
		
		; neu an enter thi in
		cmp al, 0dh
		je _print
		; 0-9, neu khong thuoc, kiem tra khoang A-F
		cmp al, 30h
		jnge _af_uper
		cmp al, 39h
		jnle _af_uper
		sub al, 30h
		jmp _jmp_while   
		
		_af_uper:
		; A-F, neu khong thuoc, kiem tra khoang a-f
		cmp al, 'A'
		jnge _af_lower
		cmp al, 'F'
		jnle _af_lower
		sub al, 37h
		jmp _jmp_while
		
		; a-f, neu khong thuoc, nhap lai
		_af_lower:
		; >=a, <=f
		cmp al, 'a'
		jnge _re_in
		cmp al, 'f'
		jnle _re_in
		sub al, 57h
		jmp _jmp_while
		
		; neu nhap du thi in, khong thi tiep tuc nhap
		_jmp_while:
		    shl bx, 4   ; danh 4 cho cho gia tri moi
		    or bl, al    ; chen gia tri moi vao 4 bit thap
		    cmp count, 0
		    je _print
		    jmp _while
		_re_in:
			lea dx, msg1
			mov ah,9
			int 21h
			
			mov count, 4
			xor bx,bx
			jmp _while
	; in so hex
	_print:
	    lea dx, msg2
	    mov ah,9
	    int 21h
	    	
	    mov cx, 4
	    mov num, 4
	    _for:
	        xor dx, dx
	        mov dl, bh      
	        shr dl, cl
	        ; doi thanh ky tu va in ra
	        cmp dl, 9     ; >9, chuyen sang ky tu
	        ja _letter
	        add dl, 30h   ; <=9, chuyen sang so
	        jmp _out
	        
	        _letter:
	            add dl,37h
	        _out:    
	        mov ah, 2
	        int 21h	
	        rol bx, cl
	        
	        dec num
	        cmp num, 0
	        jne _for 
	        
    mov ah, 4ch
    int 21h
main endp
    end main
