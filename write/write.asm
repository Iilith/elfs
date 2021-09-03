;% objdump -D write
;----------------------------------------------------------------------+
;write:     file format elf64-x86-64                                   |
;                                                                      |
;                                                                      |
;Disassembly of section .text:                                         |
;----------------------------------------------------------------------+
;0000000000400080 <_start>:                                            |
;  400080:	b0 01                	mov    $0x1,%al                |
;  400082:	48 ff c7             	inc    %rdi                    |
;  400085:	48 be 9a 00 40 00 00 	movabs $0x40009a,%rsi          |
;  40008c:	00 00 00                                               |
;  40008f:	b2 08                	mov    $0x8,%dl                |
;  400091:	0f 05                	syscall                        |
;  400093:	48 31 ff             	xor    %rdi,%rdi               |
;  400096:	b0 3c                	mov    $0x3c,%al               |
;  400098:	0f 05                	syscall                        |
;----------------------------------------------------------------------+
;000000000040009a <msg>:                                               |
;  40009a:	5b                   	pop    %rbx                    |
;  40009b:	7e 55                	jle    4000f2 <_end+0x4a>      |
;  40009d:	77 55                	ja     4000f4 <_end+0x4c>      |
;  40009f:	7e 5d                	jle    4000fe <_end+0x56>      |
;  4000a1:	0a                   	.byte 0xa                      |
;                                                                      |
section .text;---------------------------------------------------------+
;------------|                write(1, "[~UwU~]\n", 8);                |
global _start;---------------------------------------------------------+
_start:  mov al,1         ; mov 1 (write) to al register               |
         inc rdi          ; inc 1 to rdi register                      |
         mov rsi,msg      ; mov string (msg label) to rsi register     |
         mov dl,8         ; mov strsize to dl register                 |
	 syscall          ; invoke syscall                             |
;----------------------------------------------------------------------+
	 xor rdi,rdi      ; zero out rdi register                      |
         mov al,60        ; mov 60 (exit) to al register               |
         syscall          ; invoke syscall                             |
msg:;------------------------------------------------------------------+
         db "[~UwU~]",0xa ; define string                              |
;----------------------------------------------------------------------+
