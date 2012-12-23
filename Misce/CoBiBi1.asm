;CoBiBi:
;	-Stosw+Push happends in the head.
;	-Push pushes Int3+Movsw.
;	-the movsw falls exactly on the head, which makes the player copy the code 
;	-from the group's stack, which is the code from "stjmp" to "enjmp".
;	-the idea is that we don't need to use any counters.
;	-The "length loop", the "Jumping length", the static or "random" position - all have great influence on the behaviour and points.
%define JumpingLength 0xbd4 ;jamp far
%define LoopsLength 0x3f3 ;Length loop
mov si, ax
add si, stjmp
mov cx, (enjmp-stjmp)/2+1
rep movsw
;mov dx, 0xff;Entry point;Starts from a Static position.
mov dx, ax               ;Starts from the "Random" position.
mov bp, JumpingLength;jamp far
mov cx, LoopsLength;Length loop
push cs
pop ss
mov ax, 0xab53;stosw + push bx
mov bx, 0xcca5;int 3 + movsw
push es
push ds
pop es
pop ds
mov sp, dx
add sp, word 0x0f3
mov di, dx;2 bytes
mov si, mdjmp-stjmp
stosw;1 bytes
jmp dx;3 bytes
stjmp:
;~~Copied at the end
movsw
movsw
movsw
movsb
mov di, dx;2 bytes
stosw;1 bytes
jmp dx;3 bytes
mdjmp: ;~~END Copied at the end
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
xor si, si;2 bytes
movsw
enjmp: