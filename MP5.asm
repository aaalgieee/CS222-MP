section .data
    ;

section .text
    global _start

_start:
    mov eax, 4       
    mov ebx, 1       

    get_char:
        mov eax, 3       
        mov ebx, 0       
        mov ecx, char_in 
        mov edx, 1       
        int 0x80

        
        cmp byte [char_in], 'a'
        jl not_lower
        cmp byte [char_in], 'z'
        jg not_lower

        
        sub byte [char_in], 0x20  

        jmp print_char

    not_lower:
        
        cmp byte [char_in], 'A'
        jl print_char
        cmp byte [char_in], 'Z'
        jg print_char

        
        add byte [char_in], 0x20

    print_char:
        mov eax, 4       
        mov ebx, 1       
        mov ecx, char_in 
        mov edx, 1       
        int 0x80         

        jmp get_char     

    
    mov eax, 1       
    mov ebx, 0        
    int 0x80         

section .bss
    char_in resb 1   
