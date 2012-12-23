;The idea of this player is similar to the original zorg (ZorgBomb but the slavery code).
;The differnce is that this player reads all the time from the stack. 
;the begin of the stack is 0x200 bytes of movsw and push dx opcodes (0xa552).
;after that there is the jump code.
;the pushes are behind the player and never bump into the head of the player.
;we multipled the code 5 times for more defense from 0x87 attcks.

%define JumpingLength 0xbd4 * 0x2;0x1745+0x221 ;jamp far


jmp RealStart

db 0x12
db 0xea
mov di, 0x23f;the position the ax is writen to the group's stack
stosw
mov di,0x200
mov si, ax
add si, stjmp
mov cx, (enjmp-stjmp)/2
rep movsw

push ds
push es
pop ds

Zorg21:
pop es
push cs
pop ss
mov bx, ax;Starts from the "Random" position.
mov bp, JumpingLength ;Jump far
mov dx, 0xcccc ;int 3 + int 3
mov cx, JumpingLength + 0x200 + 0x2;Length loop
lea sp, [bx - 0x1f3];
mov di, bx;2 bytes
xor si, si
movsw ;1 bytes
call bx ;2 bytes
;db 0xff ;Consider placing junk.
stjmp1:
movsw
add bx,bp ;2 bytes
movsw
movsw
add sp, cx ;2 bytes
movsw
movsw
movsw
movsw
movsw
movsw
xor si, si ;2 bytes
mov di, bx ;2 bytes
movsw ;1 bytes
call bx ;2 byte
enjmp1:


db 0x12
db 0xea
mov di, 0x23f;the position the ax is writen to the group's stack
stosw
mov di,0x200
mov si, ax
add si, stjmp
mov cx, (enjmp-stjmp)/2
rep movsw

push ds
push es
pop ds

Zorg22:
pop es
push cs
pop ss
mov bx, ax;Starts from the "Random" position.
mov bp, JumpingLength ;Jump far
mov dx, 0xcccc ;int 3 + int 3
mov cx, JumpingLength + 0x200 + 0x2;Length loop
lea sp, [bx - 0x1f3]
mov di, bx;2 bytes
xor si, si
movsw ;1 bytes
call bx ;2 bytes
;db 0xff ;Consider placing junk.
stjmp2:
movsw
add bx,bp ;2 bytes
movsw
movsw
add sp, cx ;2 bytes
movsw
movsw
movsw
movsw
movsw
movsw
xor si, si ;2 bytes
mov di, bx ;2 bytes
movsw ;1 bytes
call bx ;2 byte
enjmp2:

;======================================================================
db 0x12;this bytes
db 0xea;are for made confusion in the dicompile process.
RealStart:
mov di, 0x23f;the position the ax is writen to the group's stack
stosw
mov di,0x200
mov si, ax
add si, stjmp
mov cx, (enjmp-stjmp)/2
rep movsw

push ds
push es
pop ds

Zorg2:
pop es
push cs
pop ss
mov bx, ax;Starts from the "Random" position.
mov bp, JumpingLength ;Jump far
mov dx, 0xcccc ;int 3 + int 3
mov cx, JumpingLength + 0x200 + 0x2;Length loop
lea sp, [bx - 0x1f3];this sets the distance of the pushs behind us
mov di, bx;2 bytes
xor si, si
movsw ;1 bytes
call bx ;2 bytes
;db 0xff ;Consider placing junk.
stjmp:
movsw
add bx,bp ;2 bytes
movsw
movsw
add sp, cx ;2 bytes
movsw
movsw
movsw
movsw
movsw
movsw
xor si, si ;2 bytes
mov di, bx ;2 bytes
movsw ;1 bytes
call bx ;2 byte
enjmp:
;======================================================================

db 0x12
db 0xea
mov di, 0x23f;the position the ax is writen to the group's stack
stosw
mov di,0x200
mov si, ax
add si, stjmp
mov cx, (enjmp-stjmp)/2
rep movsw

push ds
push es
pop ds

Zorg23:
pop es
push cs
pop ss
mov bx, ax;Starts from the "Random" position.
mov bp, JumpingLength ;Jump far
mov dx, 0xcccc ;int 3 + int 3
mov cx, JumpingLength + 0x200 + 0x2;Length loop
lea sp, [bx - 0x1f3]
mov di, bx;2 bytes
xor si, si
movsw ;1 bytes
call bx ;2 bytes
;db 0xff ;Consider placing junk.
stjmp3:
movsw
add bx,bp ;2 bytes
movsw
movsw
add sp, cx ;2 bytes
movsw
movsw
movsw
movsw
movsw
movsw
xor si, si ;2 bytes
mov di, bx ;2 bytes
movsw ;1 bytes
call bx ;2 byte
enjmp3:


db 0x12
db 0xea
mov di, 0x23f;the position the ax is writen to the group's stack
stosw
mov di,0x200
mov si, ax
add si, stjmp
mov cx, (enjmp-stjmp)/2
rep movsw

push ds
push es
pop ds

Zorg24:
pop es
push cs
pop ss
mov bx, ax;Starts from the "Random" position.
mov bp, JumpingLength ;Jump far
mov dx, 0xcccc ;int 3 + int 3
mov cx, JumpingLength + 0x200 + 0x2;Length loop
lea sp, [bx - 0x1f3]
mov di, bx;2 bytes
xor si, si
movsw ;1 bytes
call bx ;2 bytes
;db 0xff ;Consider placing junk.
stjmp4:
movsw
add bx,bp ;2 bytes
movsw
movsw
add sp, cx ;2 bytes
movsw
movsw
movsw
movsw
movsw
movsw
xor si, si ;2 bytes
mov di, bx ;2 bytes
movsw ;1 bytes
call bx ;2 byte
enjmp4:

jmp RealStart1

db 0x12
db 0xea
xchg ax,bx
mov ax,0xa552
mov dx, ax
int 0x86
int 0x86
push ds
push es
pop ds
mov si,0x23f;the position the ax was writen to the group's stack
lodsw
xchg ax, bx
add bx, 0xa2
jmp bx

db 0x12
db 0xea
xchg ax,bx
mov ax,0xa552
mov dx, ax
int 0x86
int 0x86
push ds
push es
pop ds
mov si,0x23f;the position the ax was writen to the group's stack
lodsw
xchg ax, bx
add bx, 0xa2
jmp bx
;=====================================================================
db 0x12
db 0xea
RealStart1:
xchg ax,bx
mov ax,0xa552
mov dx, ax
int 0x86
int 0x86
push ds
push es
pop ds
mov si,0x23f;the position the ax was writen to the group's stack
lodsw
xchg ax, bx
add bx, 0xa2
jmp bx
;========================================================================
db 0x12
db 0xea
xchg ax,bx
mov ax,0xa552
mov dx, ax
int 0x86
int 0x86
push ds
push es
pop ds
mov si,0x23f;the position the ax was writen to the group's stack
lodsw
xchg ax, bx
add bx, 0xa2
jmp bx

db 0x12
db 0xea
xchg ax,bx
mov ax,0xa552
mov dx, ax
int 0x86
int 0x86
push ds
push es
pop ds
mov si,0x23f;the position the ax was writen to the group's stack
lodsw
xchg ax, bx
add bx, 0xa2
jmp bx

dw 0x0000;Junk bytes
dw 0x0000;Junk bytes
dw 0x3FBE;Junk bytes
dw 0xFFE3;Junk bytes
dw 0x3FBE;Junk bytes
dw 0xFF00;Junk bytes
dw 0xBE3F;Junk bytes
dw 0x00E3;Junk bytes
dw 0x3FBE;Junk bytes
dw 0xFFE3;Junk bytes
dw 0x0000;Junk bytes
dw 0xFF35;Junk bytes
dw 0x0045;Junk bytes
dw 0x3FaE;Junk bytes
dw 0x3FBE;Junk bytes
dw 0xFF00;Junk bytes
dw 0x00E3;Junk bytes
dw 0xFFE3;Junk bytes
db 0x00;Junk bytes