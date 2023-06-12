bits 32
org 101000h
push ebp
mov eax,21cd4cffh
mov eax,0
mov ds,ax
mov edx,319
mov ebp,199
fors:
push edx
push ebp
mov eax,0
mov ebx,0
mov edx,319
mov ebp,199
mov ecx,1
	call BOX
pop ebp
pop edx
	mov ecx,9
	mov eax,0
	mov ebx,0
	call BOX
	mov eax,2
	call sleep
	sub ebp,6
	sub edx,10
	cmp edx,20
	ja fors
pop ebp	
ret
ret
ret
ret
clock:
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ds
	push es
	mov ax,0
	mov ds,ax
	mov esi,46ch
	ds
	mov eax,[esi]
	pop es
	pop ds
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	ret
sleep:
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ds
	push es
	mov edx,eax
	call clock
	add edx,eax
	jc sleep20
	sleep1:
		call clock
		cmp edx,eax
		ja sleep1
	jmp sleep21
	sleep20:
		call clock
		cmp eax,edx
		ja sleep20
	sleep21:
	pop es
	pop ds
	pop edi
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
	ret

BOX:                
          push esi                
          push edi                
          push ds                
          push ebp                
          push edx                
          push ecx                
          push ebx                
          push eax                
          and eax,511
          and ebx,255
          and edx,511
          and ebp,255
          cmp eax,edx
          JB BOX1                
          xchg eax,edx
          BOX1:                
          cmp ebx,ebp
          JB BOX2                
          xchg ebx,ebp
          BOX2:                
          mov esi,ebp
          mov ebp,boxxx1
          ds
          mov [ebp],eax
          mov ebp,boxxx2
          ds
          mov [ebp],edx
          mov ebp,boxyy1
          ds
          mov [ebp],ebx
          mov ebp,boxyy2
          ds
          mov [ebp],esi
          mov ebp,boxcolor
          ds
          mov [ebp],ecx
                          
                          
                          
          mov ebp,boxyy1
          ds
          mov eax,[ebp]
          mov ebx,320
          xor edx,edx
          clc                
          imul bx                
          mov ebp,boxxx1
          ds
          mov ebx,[ebp]
          clc                
          add eax,ebx
                          
          mov ebp,boxstart
          ds
          mov [ebp],eax
                          
          mov ebp,boxxx1
          ds
          mov ebx,[ebp]
          mov ebp,boxxx2
          ds
          mov eax,[ebp]
                          
          sub eax,ebx
          mov ebp,boxxxx
          ds
          mov [ebp],eax
          mov ebx,eax
          mov eax,320
          sub eax,ebx
          mov ebp,boxxxxx
          ds
          mov [ebp],ax
                          
                          
          mov ebp,boxyy1
          ds
          mov ebx,[ebp]
          mov ebp,boxyy2
          ds
          mov eax,[ebp]
                          
          sub eax,ebx
          mov ebp,boxyyy
          ds
          mov [ebp],eax
                          
          ;push start -------------------
                          
          mov ebp,boxstart
          ds
          mov eax,[ebp] 
          push eax                
                          
          mov ebp,boxcolor
          ds
          mov eax,[ebp] 
          push eax                
                          
          mov ebp,boxyyy
          ds
          mov eax,[ebp] 
          push eax                
                          
                          
          mov ebp,boxxxx
          ds
          mov eax,[ebp] 
          push eax                
                          
          mov ebp,boxxxxx
          ds
          mov eax,[ebp] 
          mov edx,eax
                          
          pop esi                
          pop ebx                
          pop eax                
          pop ebp                
          clc                
          add ebp,0a0000h               
          clc
          and edx,65535               
                          
          BOXLOOP1:
                    mov cx,si
                    BOXLOOP2:
                              ds
                              mov [ebp],al
                              inc ebp                
                              dec ecx                
                              JNZ BOXLOOP2
                    clc
                    add ebp,edx
                    dec ebx                
                    JNZ BOXLOOP1
                          
                          
                          
                          
                          
                          
          pop eax                
          pop ebx                
          pop ecx                
          pop edx                
          pop ebp                
          pop ds                
          pop edi                
          pop esi                
          ret                
                
                
boxxx1     dd      0
boxxx2     dd      0
boxyy1     dd      0
boxyy2     dd      0
boxxxx     dd      0  
boxyyy     dd      0  
boxxxxx    dd      0  
boxyyyy    dd      0  
boxstart   dd      0  
boxcolor   dd      0  
                
                

