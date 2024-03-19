    
section .data
    line1 db '|--------|',10
          db '|~~~~~~~~|',10
          db '|~~~~~~~~|',10
          db '|~~~~~~~~|',10
          db '|--------|',10

    som equ $ - line1
    
section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, line1
    mov edx, som;
    int 0x80
    
    ; System exit
    mov eax,1            
    mov ebx,0            
    int 80h