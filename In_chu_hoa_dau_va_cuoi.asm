;========================================================
; Nhap vao mot chuoi. Hien thi chu hoa dau tien va sau 
;cung tinh theo thu tu ma ASCII cua chuoi vua nhap.
;Neu khong co chu hoa nao dduoc nhap vao thi hien thi 
;thong bao 'Khong co chu hoa!'.
;========================================================
.MODEL SMALL
.STACK 100H
.DATA
    LF EQU 0AH
    CR EQU 0DH
    PROMPT DB "NHAP VAO MOT DONG VAN BAN: ", CR, LF, "$"
	NOCAP_MSG DB "KHONG CO CHU HOA! $"
	CAP_MSG DB "CHU HOA DAU TIEN = "
	FIRST DB '['
		  DB " CHU HOA SAU CUNG = "
	LAST  DB '@ $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; HIEN THI THONG BAO BAN DAU
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H
    
    ; DOC VA XU LY VAN BAN
    MOV AH, 1
    ;INT 21H 
	
    _WHILE:
		; KHONG PHAI KY TU XUONG DONG
		CMP AL, 0DH
		JE _END_WHILE
		
		; IF KY TU LA CHU HOA
		CMP AL, 'A'
		JNGE _END_IF
		CMP AL, 'Z'
		JNLE _END_IF
		
		; THEN
		; IF KY TU DUNG TRUOC CHU HOA DAU
		CMP AL, FIRST
		JNL _CHECK_LAST		
		; THEN - CHU HOA DAU BANG KY TU
		MOV FIRST, AL
		
		;END IF
		_CHECK_LAST:
		; IF KY TU DUNG TRUOC CHU HOA CUOI
			CMP AL, LAST
			JNG _END_IF
			; THEN - CHU HOA DAU BANG KY TU
			MOV LAST, AL
		;END IF

		_END_IF:
			INT 21H
			JMP _WHILE		
			
	_END_WHILE:
	; HIEN THI KET QUA
		MOV AH, 9
		; IF KHONG CO CHU HOA
		CMP FIRST, '['
		JNE _CAPS
		; THEN
		LEA DX, NOCAP_MSG
		JMP _DISPLAY
		
		_CAPS: 
		    LEA DX, CAP_MSG
		_DISPLAY:
			INT 21H
	;END IF
	;TRO VE DOS
	MOV AH, 4CH
	INT 21H
	
MAIN ENDP
    END MAIN