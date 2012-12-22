;CoBiBi:
;	-Stosw+Push happends in the head.
;	-Push pushes Int3+Movsw.
;	-the movsw falls exactly on the head, which makes the player copy the code 
;	-from the group's stack, which is the code from "stjmp" to "enjmp".
;	-the idea is that we don't need to use any counters.
;	-The "length loop", the "Jumping length", the static or "random" position - all have great influence on the behaviour and points.
;   -We multipled the code for 0x87 attck. the rael code is int the middle.
%define JumpingLength 0xbd4 * 0x2 ;jump far
%define LoopsLength 0x3f3;(0xfc * 0x4) + 0x3 ;Length loop
jmp RealStart

;================================
RealStart01:
ZombJmp01:
add si, stjmp0
mov cx, (enjmp0-stjmp0)/2
movsb
rep movsw
add si, ZombiesCopy-enjmp0
mov cx, (enjmp-ZombiesCopy)/2+1
rep movsw
mov bp, 0xff;Zombies Life's length (the number of jumps the slave will do)
jmp SameCodeForZombie
stjmp01:
movsw
movsw
movsw
add dx,JumpingLength;2 bytes
movsw
dec bp
movsw
movsw
dw 0x0f74; jz - this will jump to the death when bp == 0
enjmp01:
RealStart1:
mov si, ax

;Bomb's start
nop
add ax ,ZombJmp0-0x8
mov [0x0],byte 0xbe;mov our si to zombie's si
mov [0x1],si
mov [0x3],word 0xc289;mov zombie's ax into zombie's dx
mov [0x5],byte 0xe9 ;jmp to our ax
mov [0x6],ax
nop
nop
nop
nop
push es
push cs
pop es
mov bx, 0xdb31;xor bx, bx - consider revise for undetection
mov cx, 0xe3ff;jmp bx
mov ax, 0xcccc;Searching bytes
mov dx, 0xFFcc;Searching bytes  
int 0x87
pop es
;Bomb's end

mov dx, si ;Starts from the "Random" position.
add si, stjmp
mov cx, (enjmp-stjmp)/2+1
rep movsw
mov bp, JumpingLength;jump far
SameCodeForZombie1:
mov cx, LoopsLength;Length loop
push cs
push es
push ds
pop es
pop ds
pop ss
mov ax, 0xab53;stosw + push bx
mov bx, 0xcca5;int 3 + movsw
mov sp, dx
add sp,word 0x00f3
mov di, dx;2 bytes
xor si, si
stosw;1 bytes
jmp dx;3 bytes
stjmp1:
movsw
add dx,bp;2 bytes
ZombiesCopy1:
movsw
movsw
mov sp, dx;2 bytes
movsw
movsw
add sp, cx;2 bytes
movsw
movsw
movsw
movsw
movsw
movsw
xor si, si;2 bytes
mov di, dx;2 bytes
stosw;1 bytes
jmp dx;2 bytes
enjmp1:
;================================

RealStart0:
ZombJmp0:
add si, stjmp0
mov cx, (enjmp0-stjmp0)/2
movsb
rep movsw
add si, ZombiesCopy-enjmp0
mov cx, (enjmp-ZombiesCopy)/2+1
rep movsw
mov bp, 0xff;Life's Length
jmp SameCodeForZombie
stjmp0:
movsw
movsw
movsw
add dx,JumpingLength;2 bytes
movsw
dec bp
movsw
movsw
dw 0x0f74
enjmp0:
RealStart:
mov si, ax

;Bomb's start
nop
add ax ,ZombJmp0-0x8
mov [0x0],byte 0xbe;mov our si to zombie's si
mov [0x1],si
mov [0x3],word 0xc289;mov zombie's ax into zombie's dx
mov [0x5],byte 0xe9 ;jmp to our ax
mov [0x6],ax
nop
nop
nop
nop
push es
push cs
pop es
mov bx, 0xdb31;xor bx, bx - consider revise for undetection
mov cx, 0xe3ff;jmp bx
mov ax, 0xcccc;Searching bytes
mov dx, 0xFFcc;Searching bytes
;				 the bytes here are of EndOfWorld.
;				 the idea of our searching is that the first byte of the call [something] is 0xff and the ring is inited to 0xcc.
;				 so we search 0xccccccff and that work for all the variations of this opcode.
int 0x87
pop es
;Bomb's end

mov dx, si ;Starts from the "Random" position.
add si, stjmp
mov cx, (enjmp-stjmp)/2+1
rep movsw
mov bp, JumpingLength;jump far
SameCodeForZombie:
mov cx, LoopsLength;Length loop
push cs
push es
push ds
pop es
pop ds
pop ss
mov ax, 0xab53;stosw + push bx
mov bx, 0xcca5;int 3 + movsw
mov sp, dx
add sp,word 0x00f3
mov di, dx;2 bytes
xor si, si
stosw;1 bytes
jmp dx;3 bytes
stjmp:
movsw
add dx,bp;2 bytes
ZombiesCopy:
movsw
movsw
mov sp, dx;2 bytes
movsw
movsw
add sp, cx;2 bytes
movsw
movsw
movsw
movsw
movsw
movsw
xor si, si;2 bytes
mov di, dx;2 bytes
stosw;1 bytes
jmp dx;2 bytes
enjmp:

;================================
RealStart02:
ZombJmp02:
add si, stjmp0
mov cx, (enjmp0-stjmp0)/2
movsb
rep movsw
add si, ZombiesCopy-enjmp0
mov cx, (enjmp-ZombiesCopy)/2+1
rep movsw
mov bp, 0xff;Life's Length
jmp SameCodeForZombie
stjmp02:
movsw
movsw
movsw
add dx,JumpingLength;2 bytes
movsw
dec bp
movsw
movsw
dw 0x0f74
enjmp02:
RealStart2:
mov si, ax

;Bomb's start
nop
add ax ,ZombJmp0-0x8
mov [0x0],byte 0xbe;mov our si to zombie's si
mov [0x1],si
mov [0x3],word 0xc289;mov zombie's ax into zombie's dx
mov [0x5],byte 0xe9 ;jmp to our ax
mov [0x6],ax
nop
nop
nop
nop
push es
push cs
pop es
mov bx, 0xdb31;xor bx, bx - consider revise for undetection
mov cx, 0xe3ff;jmp bx
mov ax, 0xcccc;Searching bytes
mov dx, 0xFFcc;Searching bytes
int 0x87
pop es
;Bomb's end

mov dx, si ;Starts from the "Random" position.
add si, stjmp
mov cx, (enjmp-stjmp)/2+1
rep movsw
mov bp, JumpingLength;jump far
SameCodeForZombie2:
mov cx, LoopsLength;Length loop
push cs
push es
push ds
pop es
pop ds
pop ss
mov ax, 0xab53;stosw + push bx
mov bx, 0xcca5;int 3 + movsw
mov sp, dx
add sp,word 0x00f3
mov di, dx;2 bytes
xor si, si
stosw;1 bytes
jmp dx;3 bytes
stjmp2:
movsw
add dx,bp;2 bytes
ZombiesCopy2:
movsw
movsw
mov sp, dx;2 bytes
movsw
movsw
add sp, cx;2 bytes
movsw
movsw
movsw
movsw
movsw
movsw
xor si, si;2 bytes
mov di, dx;2 bytes
stosw;1 bytes
jmp dx;2 bytes
enjmp2:
;================================