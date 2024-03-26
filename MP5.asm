section .data
    ;

section .text
    global _start

_start:
    mov eax, 4       ; System call for 'write'
    mov ebx, 1       ; File descriptor (stdout)

    get_char:
        mov eax, 3       ; System call for 'read'
        mov ebx, 0       ; File descriptor (stdin)
        mov ecx, char_in ; Address to store character 
        mov edx, 1       ; Read 1 byte  
        int 0x80

        ; Check if character is within 'a' to 'z'
        cmp byte [char_in], 'a'
        jl not_lower
        cmp byte [char_in], 'z'
        jg not_lower

        ; Convert to uppercase  
        sub byte [char_in], 0x20  

        jmp print_char

    not_lower:
        ; Check if character is within 'A' to 'Z'
        cmp byte [char_in], 'A'
        jl print_char
        cmp byte [char_in], 'Z'
        jg print_char

        ; Convert to lowercase 
        add byte [char_in], 0x20

    print_char:
        mov eax, 4       ; System call for 'write'
        mov ebx, 1       ; File descriptor (stdout)
        mov ecx, char_in ; Address of character to print
        mov edx, 1       ; Print 1 byte
        int 0x80         ; Call the kernel

        jmp get_char     ; Get the next character 

    ; Exit cleanly
    mov eax, 1       ; System call for 'exit' 
    mov ebx, 0       ; Exit code (0 = success)
    int 0x80         

section .bss
    char_in resb 1   ; Reserve 1 byte for input character
