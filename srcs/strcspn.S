    BITS 64
    global strcspn:function
    section .text

strcspn:
    mov rax, 0

start:
    cmp byte [rdi], 0
    je end
    xor rcx, rcx

loop_find:
    mov r8b, [rsi + rcx]
    cmp r8b, 0
    je loop_end

    cmp byte [rdi], r10b
    je end

    inc rcx
    jmp loop_find

loop_end:
    inc rdi
    inc rax
    jmp start

end:
    ret