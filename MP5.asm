section .data
    ;

section .text
    global _start

_start:
    mov eax, 4       ; syscall for write
    mov ebx, 1       ; output

    get_char:
        mov eax, 3       ; syscall for read
        mov ebx, 0       ; input
        mov ecx, char_in ; store input in char_in 
        mov edx, 1       ; read 1 byte  
        int 0x80

        ; Check if its within 'a' to 'z'
        cmp byte [char_in], 'a'
        jl not_lower
        cmp byte [char_in], 'z'
        jg not_lower

        ; Convert to uppercase  
        sub byte [char_in], 0x20  

        jmp print_char

    not_lower:
        ; Check if its within 'A' to 'Z'
        cmp byte [char_in], 'A'
        jl print_char
        cmp byte [char_in], 'Z'
        jg print_char

        ; Convert to lowercase 
        add byte [char_in], 0x20

    print_char:
        mov eax, 4       ; syscall for write
        mov ebx, 1       ; output
        mov ecx, char_in ; call char_in
        mov edx, 1       ; print 1 byte of char_in
        int 0x80         ; call the kernel

        jmp get_char     ; back to get_char 

    ; exit program
    mov eax, 1       
    mov ebx, 0        
    int 0x80         

section .bss
    char_in resb 1   
