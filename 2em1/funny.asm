; code                   | dump                                                   | ;                           |
;------------------------+--------------------------------------------------------+-----------------------------+
section .text            ;                                                        |                             |  
_start:                  ;                                                        |                             |
    mov al,1             ;  b0 01                  mov    $0x1,%al                | mov write to al             |
    mov rdi,1            ;  bf 01 00 00 00         mov    $0x1,%edi               | mov stdout to rdi           |
    mov rsi,msg          ;  48 be 9f 00 40 00 00   movabs $0x40009f,%rsi          | mov msg to rsi              |
    mov rdx,8            ;  ba 08 00 00 00         mov    $0x8,%edx               | mov msg lenght to rdi       |
    syscall              ;  0f 05                  syscall                        | invoke syscall              |
    mov al,60            ;  b0 3c                  mov    $0x3c,%al               | mov exit to al              |
    xor rdi,rdi          ;  48 31 ff               xor %rdi,%rdi                  | zero out rdi                |
    syscall              ;  0f 05                  syscall                        | invoke syscall              | 
msg: db "[~UwU~]",0xa    ;  7e 55 77 55 7e 5d 0a   "[~UwU~]\n"                    | define string               |
;------------------------+--------------------------------------------------------+-----------------------------+
