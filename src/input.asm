%include "src/utilities.asm"

_input:
    mov ah, 00h  ; this is a function to get the user input
    int 0x16     ; interrupt is 0x16

    cmp al, 13   ; "13" is "Enter"
    je _done

    mov ah, 0eh  ; this is the function to display anything to the console
    int 0x10     ; interrupt is 0x19

    mov [si], al ; [si] is the "buffer" memory address
    inc si       ; what this line does it basically does it moves to the next memory location in the buffer

    ; inc is usually used to move the pointer to the next memory location in a buffer (moving forward)
    ; dec is usually used to move the pointer to the previous memory location in a buffer (moving backward)

    ;inc cx

    ; quick note: i might be wrong on some stuff

    jmp _input  ; we continue to loop untill "Enter" is pressed