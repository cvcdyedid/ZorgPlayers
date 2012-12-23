add ax, start
stosw
stosw
push es
pop ds
mov si, 0x2
lodsw
jmp ax
start:
mov word[si], 0xcccc
add si, 0x3fe
jmp start
cobiend: