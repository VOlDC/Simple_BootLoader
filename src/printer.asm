_print:
    lodsb
    cmp al, 0
    je _done_printing
    call _print_character
    jmp _print

_print_character:
    mov ah, 0eh
    int 0x10
    ret

_done_printing:
    ret