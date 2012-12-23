;RepCoBi uses rep stosw as an overriding method.
;the speed of writing is fatal.
;it writes the stosw behind the player and gets closer to it, until it wirtes ON it, movsw as a parameter of rep.
; therefore it runs rep movsw and NOT rep stosw, and cx has the EXACT value to copy the stack.
;the movsw makes it copy the private stack, making it run a code which makes it jump.
;put attention to the value of cx, because you need to run exactly the right number of reps.
;In this player, one player (RRepCoBi1) writes BACKWARD (std). He changes the rep's stosw to movsw (WOW!).
;put ttention that in the exact SAME turn, RRepCoBi1 will run rep stosw, but RRepCoBi2 will run rep MOVSW!!!
;The player which does rep with std, writes his own stack, but it has no value...(consider changing it to a slaving code...)
%define JumpingLength 0xf114 ;jamp far
%define LoopsLength 0x106 ;Length loop
%define EntryPoint 0xff ;Entry Point
mov si, ax
add si, jumpcode
mov dx, (2*LoopsLength + JumpingLength +0x4)
mov bx, 0xa5
;push es ; ss -> es, es -> cs, ds -> ss
push ss
pop es
;pop cs
push ds
pop ss
nop
mov cx, (endjumpcode-jumpcode)/2+1
rep movsw
mov ax, 0xa5cc
mov cx, (endjumpcode-jumpcode)/2
xor si,si
push ds ; es -> ds
push es
pop ds
pop es
mov bp,EntryPoint
mov [bp],word 0x50cc
mov [bp+0x2],word 0x1fff ;call word far bp
mov sp, EntryPoint+ 2*LoopsLength
add bp, 0x2
mov [bx], bp
mov [bx+0x2], cs
mov di,bp
add di,0x2
jmp bp
jumpcode:
rep movsw ; 2 bytes
add bp, JumpingLength
mov cx, (endjumpcode-jumpcode)/2 ;The rep will also copy the jump code. 3 bytes
add sp, dx
xor si,si
inc bp
mov di,bp
inc di ;better then add di,0x3 since we add only two, since we did inc bp
inc di
mov [bp],byte 0x50
mov [bp+0x1],word 0x1fff ;rep stosw 5 bytes
mov [bx], bp
jmp bp
endjumpcode: