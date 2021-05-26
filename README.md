Some x86 shellcode I made for a binary exploitation challenge. Jump to the beginning and you should get a shell.

No null bytes until the end so it can be stored in a null-terminated string. Code modifies itself so needs to be writable.

I assembled it with `rasm2 -f shellcode.s`.
