section .data  
    prompt db "Enter password: ", 0  
    weak_msg db "Password is weak.", 10 
    strong_msg db "Password is strong.", 10 
    err_msg db "No password entered.", 10 

section .bss  
    password resb 80  

section .text  
    global _start   

_start:
    ; Get Password Input 
    mov edx, prompt     
    mov ecx, eax       
    mov ebx, 1         
    mov eax, 4         
    int 0x80

    mov edx, 80         
    mov ecx, password  
    mov ebx, 0         
    mov eax, 3         
    int 0x80

   
    cmp eax, 0          
    jle no_input       
  
    push password      
    call strlen         
    add esp, 4          
 

    cmp eax, 8          
    jl weak_password   

strong_password:

    mov edx, strong_msg 
    jmp output         

weak_password:

    mov edx, weak_msg  
    jmp output  

no_input:
    mov edx, err_msg  
output:
    mov ecx, eax       
    mov ebx, 1         
    mov eax, 4         
    int 0x80


    mov eax, 1   
    xor ebx, ebx 
    int 0x80 
