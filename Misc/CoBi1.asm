%define JumpingLength 0xff4 ;jamp far
%define LoopsLength 0x3f3 ;Length loop
mov si, ax
add si, stjmp
mov cx, (enjmp-stjmp)/2+1
rep movsw
mov dx, 0xcccc;Entry point
mov bp, JumpingLength ;jamp far
mov cx, LoopsLength ;Length loop
push cs
pop ss
mov ax, 0xab53;stosw + push bx
mov bx, 0xcca5;int 3 + movsw
push es
push ds
pop es
pop ds
mov sp, dx
add sp, cx
mov di, dx;2 bytes
mov si, 0xa;2 bytes
stosw;1 bytes
jmp dx;3 bytes
stjmp:
movsw
movsw
movsw
movsw
mov di, dx;2 bytes
stosw;1 bytes
jmp word JumpingLength - LoopsLength/2+0x2A;0x2CF;3 bytes
movsw
movsw
add dx,bp;2 bytes
movsw
movsw
mov sp, dx;2 bytes
movsw
movsw
add sp, cx;2 bytes
movsw
movsw
xor si, si;2 bytes
movsw
enjmp: