;CoBiBi:
;	-Stosw+Push happends in the head.
;	-Push pushes Int3+Movsw.
;	-the movsw falls exactly on the head, which makes the player copy the code 
;	-from the group's stack, which is the code from "stjmp" to "enjmp".
;	-the idea is that we don't need to use any counters.
;	-The "length loop", the "Jumping length", the static or "random" position - all have great influence on the behaviour and points.
;	-The code of CoBiBi2 is copied in CoBiBi1 (this is the same group stack...)
%define JumpingLength 0xbd4 ;jump far
%define LoopsLength (0xfc * 0x4) + 0x1 ;Length loop
jmp RealStart
RealStart:
mov si, ax

;Bomb's start
;push es
;push cs
;pop es
;mov bx, 0xdb31;xor bx, bx - consider revise for undetection
;mov cx, 0xe3ff;jmp bx
;mov ax, 0xfb73;Searching bytes
;mov dx, 0x061e
;int 0x87
;pop es
;Bomb's end

mov dx, si ;Starts from the "Random" position.
mov bp, JumpingLength;jamp far
mov cx, LoopsLength;Length loop
mov ax, 0xab53
mov bx, 0xcca5
push cs
push es
push ds
pop es
pop ds
pop ss
mov sp, dx
add sp, word 0x0f3
mov di, dx;2 bytes
xor si, si
stosw;1 bytes
jmp dx;3 bytes
enjmp: