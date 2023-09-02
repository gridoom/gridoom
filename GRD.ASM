
format PE64 console
entry runpoint



include 'win64a.inc'






section '.text' readable executable
runpoint:

sub rsp,8    ;align stack for call WinAPI in future



mov rax,0xD87219BF
xor rdx,rdx

jmpoint:

shr rax,1

mov rcx,rax

and rcx,1

add rdx,rcx

cmp rax,1

je endprog

jmp jmpoint



endprog:

invoke ExitProcess,0


;section '.data' readable writeable





section '.idata' import data readable writeable

library kernel32,'kernel32.dll',\
        user32,'user32.dll',\
        msvcrt,'msvcrt.dll'



include 'api\kernel32.inc'
include 'api\user32.inc'