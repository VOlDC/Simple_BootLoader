org 0x7c00 ; origin
bits 16 ; 16-bit

; global labels
global _start

_start:
    mov si, message
    call _print

    mov si, input_message
    call _print

    mov si, buffer
    call _input ; calling the input label from the "input.asm" file

    hlt         ; this "halts" the hard disk, u can just write "jmp $" which just repeats itself

%include "src/printer.asm"
%include "src/input.asm"

times 510 - ($-$$) db 0 ; the "db 0" means that the remained unused bytes out of 512 bytes will be set to 0
dw 0xAA55 ; 511-512 bytes (2 bytes/two bytes)

; DEFINITIONS

; 64 bits :  RAX RBX RCX RDX
; 32 bits :  EAX EBX ECX EDX
; 16 bits :  AX BX CX DX
; 8 bits  :  AH AL BH BL CH CL DH DL

; al is the low 8 bits, ah is the high 8 bits
; "al" is the member of "ah"    
; for example:
; mov ah, 0eh (this is to print characters to the terminal)
; but what if u want to print just one character? you use "al"
; mov al, 'A' (for example)
; int 0x10 (this is needed if u use "0eh", there are different int 0x.. values, or these are also
; interrupts, "int =  interrupt")

; repe    : Repeat while equal (or repz, which is an alias for repe)
; cmpsb   : Compare string byte at [DS:SI] with byte at [ES:DI]
; cmpsw   : Compare string word at [DS:SI] with word at [ES:DI]
; cmpsd   : Compare string doubleword at [DS:SI] with doubleword at [ES:DI]

; example with "repe":
; mov si, buffer
; mov di, print_string
; repe cmpsb ; compare both strings

; what is "lodsb" and "si"
; "si" stands for source index, anyway an example with "lodsb" and "si" is this:


; text: db 'Hello', 0
; some later code..
; mov si, text
; some later code.. (maybe)
; lodsb
; cmp al, 0

; alright, in this example u create a memory address named "text"
; then you set this memory address to a register named "si"
; after that you loop through each letter inside the "si" register
; and "lodsb" works with "si" and "al"
; "al" is the bytes (digits)
; and "si" is the whole string
; and after that you compare if the digit it found is equal to 0
; that means if its the end of the string

; quick note: i might be wrong on lots of stuff