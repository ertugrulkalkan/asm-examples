  ; loop.asm
  
  global _start
  
section .text:

_start:
  mov rax, 0x00
  mov rbx, step_count_limit

_loop:
  call _printlp
  inc rax
  cmp rbx,rax
  jnz _loop
  call _exit

_printlp:
  ; push
  push rax
  push rbx
  push rcx
  push rdx
  ; sys_write(file, message, len)
  mov rax, 0x04
  mov rbx, 0x01
  mov rcx, message
  mov rdx, message_len
  int 0x80
  ; pop
  pop rdx
  pop rcx
  pop rbx
  pop rax
  ; return
  ret

_exit:
  ; sys_exit(int_val)
  mov rax, 0x01
  mov rbx, 0x00
  int 0x80

section .data:
message: db "looping...", 0x0A
  message_len equ $ - message
  step_count_limit equ 0x04
