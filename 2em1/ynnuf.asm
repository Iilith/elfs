; code                   | dump                                                   | ;                           |
;------------------------+--------------------------------------------------------+-----------------------------+
section .text            ;                                                        |                             |
_start:                  ;                                                        |                             |
    sub rsp,128+8        ; 48 81 ec 88 00 00 00   sub    $0x88,%rsp               | buffer + stack align        |
    mov al,79            ; b0 4f                  mov    $0x4f,%al                | mov getcwd to al            |
    mov rdi,rsp          ; 48 89 e7               mov    %rsp,%rdi                | mov string to rdi           |
    mov rsi,128          ; be 80 00 00 00         mov    $0x80,%esi               | mov buffer lenght to rsi    |
    syscall              ; 0f 05                  syscall                         | invoke syscall              |
    xor al,al            ; 30 c0                  xor    %al,%al                  | zero out al                 |
    inc al               ; fe c0                  inc    %al                      | mov write to al             |
    xor rdi,rdi          ; 48 31 ff               xor    %rdi,%rdi                | zero out rdi                |
    inc rdi              ; 48 ff c7               inc    %rdi                     | mov stdout to rdi           |
    mov rsi,rsp          ; 48 89 e6               mov    %rsp,%rsi                | mov buffer to rsi           |
    mov rdx,128          ; ba 80 00 00 00         mov    $0x80,%edx               | mov buffer lenght to rdx    |
    syscall              ; 0f 05                  syscall                         | invoke syscall              |
    mov al,60            ; b0 3c                  mov    $0x3c,%al                | mov exit to al              |
    xor rdi,rdi          ; 48 31 ff               48 31 ff                        | zero out rdi                |
    syscall              ; 0f 05                  syscall                         | invoke syscall              |
;------------------------+--------------------------------------------------------+-----------------------------+
