init:
mov di, 0x10 ;10 First bytes are reserved for data
mov si, ax ;Copy ourselves into stack
add si, loopstart - init
mov cx, (endstart - loopstart) / 2 + 1
rep movsw
push ds
push es
pop ds
pop es
mov si, 0x0
xchg dx,ax
lodsw ;Copy the killer into stack
xchg dx,ax
mov si, dx
push ds
push es
pop ds
pop es
mov cx, 10 / 2
rep movsw
push ds ;initialize variables
push es
pop ds
pop es
mov di, ax
;mov dx, es
;add dx, 2
mov ax, 0xff24
mov si, word[bx]
xchg dx, si
loopstart:
mov cx, (endstart - loopstart + 10) / 2 + 1
mov si, 0x10 ;10 First bytes are reserved for data
add di, 0xffc
rep movsw
sub di, 8
xchg dx, di
stosw
xchg dx,di
sub di, endstart - loopstart + 4
jmp di
endstart: