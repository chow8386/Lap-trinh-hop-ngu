dseg segment  
    buffer db 11 dup ('$')
    tbao1 db "Nhap chuoi max 10 ky tu: $"  
    tbao2 db 10, 13, "Chuoi: $"
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
        
        cmp al, 1Bh
        je exit 
        
        mov [di], al
        mov ah, 2
        mov dl, '*'
        int 21h
        
        inc di
        loop input 
        
    exit: 
    mov ah, 09
    lea dx, tbao2
    int 21h 
    
    mov ah, 09
    lea dx, buffer
    int 21h 
     
    mov ah, 4ch
    int 21h
cseg ends
end begin
 
