;stosw
;mov di, ax
push ds
pop es
push cs
pop ss
mov sp, 0x8000
mov ax, 0x50ab
;add di, loopst+0x1
mov di, 0xc000
stosw
mov bx, 0xc000
jmp bx
;loopst:
;stosw