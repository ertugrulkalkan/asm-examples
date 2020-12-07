	; hello.asm
	
	global _start
	
section .text:
_start:
	mov ecx, message             ; message
	mov edx, message_len         ; length
	call _print
	call _exit

_print:
	push rax
	push rbx
	mov eax, 0x4
	mov ebx, 0x1
	int 0x80
	pop rax
	pop rbx
	ret 

_exit:	
	mov eax, 0x01                ; call exit
	mov ebx, 0                   ; return 0
	int 0x80                     ; system call interrupt
	
section .data:
message: db "Hello, World!", 0x0A ; message to print, '\n'
	message_len equ $ - message  ; length of message
