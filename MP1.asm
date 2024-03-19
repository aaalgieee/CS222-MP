    section .data
                message db 'ORIG', 0

            section .text
                global _start

            _start:
                ; Print 'O'
                mov eax, 4
                mov ebx, 1
                mov ecx, message
                mov edx, 1
                int 0x80

                ; Print newline
                mov eax, 4
                mov ebx, 1
                mov ecx, newline
                mov edx, 1
                int 0x80

                ; Print 'R'
                mov eax, 4
                mov ebx, 1
                mov ecx, message + 1
                mov edx, 1
                int 0x80

                ; Print newline
                mov eax, 4
                mov ebx, 1
                mov ecx, newline
                mov edx, 1
                int 0x80

                ; Print 'I'
                mov eax, 4
                mov ebx, 1
                mov ecx, message + 2
                mov edx, 1
                int 0x80

                ; Print newline
                mov eax, 4
                mov ebx, 1
                mov ecx, newline
                mov edx, 1
                int 0x80

                ; Print 'G'
                mov eax, 4
                mov ebx, 1
                mov ecx, message + 3
                mov edx, 1
                int 0x80

                ; Print newline
                mov eax, 4
                mov ebx, 1
                mov ecx, newline
                mov edx, 1
                int 0x80

                ; Exit the program
                mov eax, 1
                xor ebx, ebx
                int 0x80

            section .data
                newline db 10, 0
