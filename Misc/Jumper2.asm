;mov di, ax
;mov cx, 0x2
;div cx
;mov bx, dx
;push es
push ds
pop es
;pop ds
;lodsw
;div cx
;cmp dx,bx
;jnz jump
;nop
;jump:
push cs
pop ss
mov sp, 0x0
mov ax, 0x50ab
;add di, loopst+0x1
mov di, 0x4000
stosw
mov bx, 0x4000
jmp bx
;loopst:
;stosw