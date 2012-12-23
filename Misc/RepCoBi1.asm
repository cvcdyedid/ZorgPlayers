;RepCoBi uses rep stosw as an overriding method.
;the speed of writing is fatal.
;it writes the stosw behind the player and gets closer to it, until it wirtes ON it, movsw as a parameter of rep.
; therefore it runs rep movsw and NOT rep stosw, and cx has the EXACT value to copy the stack.
;the movsw makes it copy the private stack, making it run a code which makes it jump.
;put attention to the value of cx, because you need to run exactly the right number of reps.
;
%define JumpingLength 0xff4 ;jamp far
%define LoopsLength 0xf3 ;Length loop
%define EntryPoint 0xfff ;Entry Point
mov si, ax
add si, jumpcode
mov bx, JumpingLength - LoopsLength - (endjumpcode-jumpcode)  + 1
mov dx, 0
;push es ; ss -> es, es -> cs, ds -> ss
push ss
pop es
;pop cs
push ds
pop ss
add sp, 0xff
mov cx, (endjumpcode-jumpcode)/2+1
rep movsw
mov si, dx
mov ax, 0xa5cc ; int3 + int3
mov cx, LoopsLength/2 + (endjumpcode-jumpcode)/2 + 2;The rep will also copy the jump code.
push ds ; es -> ds
push es
pop ds
pop es
mov bp,EntryPoint
mov [bp],word 0xabf3 ;rep stosw
nop
mov di, EntryPoint - LoopsLength 
jmp bp
jumpcode:
rep movsw ; 2 bytes
add bp, JumpingLength
mov cx, LoopsLength/2 + (endjumpcode-jumpcode)/2 + 2;The rep will also copy the jump code. 3 bytes
add di, bx
mov si, dx
mov [bp],word 0xabf3 ;rep stosw 5 bytes
jmp bp
endjumpcode: