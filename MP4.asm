section .data
    newline db 10   

section .bss
    buffer resb 1

section .text
    global _start

_start:
    ; Read a character from stdin
    mov eax, 3          
    mov ebx, 0           
    mov ecx, buffer     
    mov edx, 1         
    int 0x80        

    
    cmp byte [buffer], 'A'
    jl not_uppercase
    cmp byte [buffer], 'Z'
    jg not_uppercase

   
    add byte [buffer], 32 

not_uppercase:
    
    mov eax, 4          
    mov ebx, 1          
    mov ecx, buffer      
    mov edx, 1         
    int 0x80

    mov eax, 4          
    mov ebx, 1        
    mov ecx, newline  
    mov edx, 1      
    int 0x80

    ; Exit the program
    mov eax, 1           ; sys_exit system call number
    xor ebx, ebx         ; exit code 0
    int 0x80             ; invoke system call