

format PE console ;Assembler 32 Bit


include 'win32axp.inc'


section '.text' code readable executable



push 0

gen:
invoke rand

cmp ax,1000
jnc putval


jmp gen

putval:
pop ecx

mov [chgen+ecx*2],ax


inc ecx

push ecx

cmp ecx,512

je next_stage

jmp gen


next_stage:
xor ecx,ecx
mov ebx,1000

div_val:

xor edx,edx
xor eax,eax


mov ax,[chgen+ecx*2]
div ebx

add edx,1000
mov [dstobj+ecx*2],dx

inc ecx

cmp ecx,512


je exstop

jmp div_val



exstop:

invoke ExitProcess,0



section '.data' data readable writeable

chgen rw 512

dstobj rw 512



section '.idata' import data readable writeable


library kernel32,'kernel32.dll',\
        msvcrt,'msvcrt.dll'


import kernel32,\
       ExitProcess,'ExitProcess'


import msvcrt,\
       rand,'rand'


