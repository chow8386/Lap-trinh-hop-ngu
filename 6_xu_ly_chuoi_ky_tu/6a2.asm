dseg segment  
    oldpass db "1234567890"  
    buffer db 11 dup ('$')
    tbao1 db 10, 13, "Nhap chuoi max 10 ky tu: $"  
    tbao2 db 10, 13, "Ban da nhap dung roi $" 
    tbao3 db 10, 13, "Sai mat khau! Nhap lai! $"
dseg ends    

cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: 
    mov ax, dseg    
    mov ds, ax
    mov es, ax   
    
    mov ah, 09
    lea dx, tbao1
    int 21h  
    
    mov cx, 10
    lea di, buffer
    
    input:
        mov ah, 8
        int 21h
        
        mov [di], al
        mov ah, 2
        mov dl, '*'
        int 21h
        
        inc di
        loop input 
        
    cld
    mov cx, 10
    lea si, oldpass
    lea di, buffer
    repe cmpsb
    je correct_pass
    
    mov ah, 09
    lea dx, tbao3
    int 21h      
    
    jmp begin
    
    correct_pass: 
    mov ah, 09
    lea dx, tbao2
    int 21h 
     
    mov ah, 4ch
    int 21h
cseg ends
end begin
 
