%define JumpingLength 0xbd4 ;jamp far ;old=0xff4
%define LoopsLength 0x6*30-3 ;Length loop
mov si, ax
add si, stjmp
mov cx, (enjmp-stjmp)/2+1
rep movsw
mov si, mmmmm-stjmp
mov bp, JumpingLength+1
mov cx,  LoopsLength
add ax, Calll   ;3 bytes
mov dx, ax
mov di, ax
add di, 0x2
push ds       ;1 bytes
push es       ;1 bytes
pop ds        ;1 bytes
pop es        ;1 bytes
mov bx, 0x3f0+0x4
;mov [bx], ax  ;2 bytes
mov [bx+0x2], cs
dec word [bx]
dec word [bx]
push es       ;1 bytes
pop ss        ;1 bytes
;add sp, 0xff
mov sp, ax    ;2 bytes
sub sp,cx   ;2 bytes
mov ax, 0xcca5 ;3 bytes
Calll:
push ax       ;1 bytes
sub sp, 0x6
call word far [bx]     ;2 bytes

stjmp:
movsw
movsw
movsw

mov di, dx;2 bytes
movsw
jmp dx; 2 bytes
DXJAMP:
movsw
movsw
add dx,Caller2sCode-DXJAMP ;3 bytes
movsw
movsw
mov [bx], dx;2 bytes
movsw
movsw
movsw
add word[bx],Caller1sCode-Caller2sCode;3 bytes
movsw
movsw;53
movsw;53
movsw;54
movsw;54
movsw;55
movsw;55
movsw;56
movsw;56
movsw;57
movsw;57
movsw;58
movsw;58
movsw;59
movsw;59
movsw
movsw
movsw
dec di;60
mov [bx+0x4],dx;3 bytes;60+61
call word far [bx];2 bytes;62
Caller2sCode:
mov sp,[bx];2 bytes <=the Caller2's Code;63
add word [bx],0x5;3 bytes;64+65
call word far [bx]     ;2 bytes;65+66
Caller1sCode:
push ax       ;1 bytes;66
call word far [bx]     ;2 bytes;67
mmmmm:
movsw
add dx, bp ;2 bytes

movsw
movsw
mov sp, dx ;2 bytes
movsw
movsw
add sp, cx ;2 bytes
movsw
movsw
xor si,si;2 bytes
movsw
enjmp: