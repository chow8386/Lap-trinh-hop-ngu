dseg segment 
    msg_sang db 10,13,'Good morning!$'
    msg_chieu db 10,13,'Good afteroon!$'
    msg_toi db 10,13,'Good evening!$'
dseg ends  

cseg segment  
    assume ds:dseg, cs:cseg
start:  
    mov ax, dseg
    mov ds, ax  
    
    mov ah, 1
    int 21h  
    
    cmp al, 'S'
    je sang
    cmp al, 's'
    je sang 
    
    cmp al, 'C'
    je chieu
    cmp al, 'c'
    je chieu
    
    cmp al, 'T'
    je toi
    cmp al, 't' 
    je toi
    
sang:
    lea dx, msg_sang
    jmp print  
    
chieu:
    lea dx, msg_chieu
    jmp print 
             
toi:
    lea dx, msg_toi
    jmp print 
    
print:
    mov ah, 9
    int 21h
    jmp exit

exit:      
    mov ah, 4Ch
    int 21h  
    
cseg ends
end start
