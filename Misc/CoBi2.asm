%define JumpingLength 0xff4 ;jamp far
%define LoopsLength 0x3f3 ;Length loop    ;nop ;do movsw/stosw backward
mov si, ax
add si, enjmp
add di , 0xff
mov cx, (enjmp-stjmp)/2+1
rep movsw
mov dx, 0xcccc -2 ;Entry point
mov bp, JumpingLength ;jamp far
mov cx, 0xffff - LoopsLength ;Loop's length.
push cs
pop ss
mov ax, 0xcccc ; int 3 + int 3
mov bx, 0xcccc ;int 3 + int 3
push es
push ds
pop es
pop ds
mov sp, bx
nop
mov di, dx;2 bytes
mov si ,0x0a;2 bytes
jmp bx;3 bytes
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