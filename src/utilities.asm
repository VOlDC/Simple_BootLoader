%define ENDL 0xA, 0xD

; define bytes
message: db 'Hello World', ENDL, 0
input_message: db 'user: ', 0

; reserve bytes
buffer resb 256 ; create a buffer to restore 256 bytes

_done:
    ret
