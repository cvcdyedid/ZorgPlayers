;CoBiBi:
;	-Stosw+Push happends in the head.
;	-Push pushes Int3+Movsw.
;	-the movsw falls exactly on the head, which makes the player copy the code 
;	-from the group's stack, which is the code from "stjmp" to "enjmp".
;	-the idea is that we don't need to use any counters.
;	-The "length loop", the "Jumping length", the static or "random" position - all have great influence on the behaviour and points.
;	-The code of Zorg2 is copied in Zorg1 (this is the same group stack...)
%define JumpingLength 0xbd4 * 0x2 ;jump far
%define LoopsLength 0x3f3;(0xfc * 0x4) + 0x3 ;Length loop
jmp RealStart


;==============================
RealStart1:
mov si, ax

;Bomb's start
push es
push cs
pop es
mov bx, 0xdb31;xor bx, bx - consider revise for undetection
mov cx, 0xe3ff;jmp bx
mov ax, 0x0789;Searching bytes
mov dx, 0xFEEB;Searching bytes
int 0x87
pop es
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
enjmp1:

;===

RealStart2:
mov si, ax

;Bomb's start
push es
push cs
pop es
mov bx, 0xdb31;xor bx, bx - consider revise for undetection
mov cx, 0xe3ff;jmp bx
mov ax, 0x0789;Searching bytes
mov dx, 0xFEEB;Searching bytes
int 0x87
pop es
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
enjmp2:
;===================================


RealStart:
mov si, ax

;Bomb's start
push es
push cs
pop es
mov bx, 0xdb31;xor bx, bx - consider revise for undetection
mov cx, 0xe3ff;jmp bx
mov ax, 0x0789;Searching bytes
mov dx, 0xFEEB;Searching bytes   the bytes are of the 2012's zombies.
int 0x87
pop es
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

;==============================
RealStart3:
mov si, ax

;Bomb's start
push es
push cs
pop es
mov bx, 0xdb31;xor bx, bx - consider revise for undetection
mov cx, 0xe3ff;jmp bx
mov ax, 0x0789;Searching bytes
mov dx, 0xFEEB;Searching bytes
int 0x87
pop es
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
enjmp3:

;===

RealStart4:
mov si, ax

;Bomb's start
push es
push cs
pop es
mov bx, 0xdb31;xor bx, bx - consider revise for undetection
mov cx, 0xe3ff;jmp bx
mov ax, 0x0789;Searching bytes
mov dx, 0xFEEB;Searching bytes
int 0x87
pop es
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
enjmp4:
;===================================