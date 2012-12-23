;CoBiBi:
;	-Stosw+Push happends in the head.
;	-Push pushes Int3+Movsw.
;	-the movsw falls exactly on the head, which makes the player copy the code 
;	-from the group's stack, which is the code from "stjmp" to "enjmp".
;	-the idea is that we don't need to use any counters.
;	-The "length loop", the "Jumping length", the static or "random" position - all have great influence on the behaviour and points.
;	-The code of CoBiBi2 is copied in CoBiBi1 (this is the same group stack...)
%define JumpingLength 0xbd4 ;jamp far
%define LoopsLength 0x3f3 ;Length loop
mov bp, JumpingLength;jamp far
mov cx, LoopsLength;Length loop
;mov dx, 0xff;Entry point;Starts from a Static position.
mov dx, ax               ;Starts from the "Random" position.
mov ax, 0xab53
mov bx, 0xcca5
push cs
pop ss
push es
push ds
pop es
pop ds
mov sp, dx
add sp, word 0x0f3
mov di, dx;2 bytes
mov si, 0x9
stosw;1 bytes
jmp dx;3 bytes
