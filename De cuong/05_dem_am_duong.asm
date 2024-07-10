inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h 
endm 

dseg segment   
    tbao1 db "Nhap chuoi so (1,2,3): $"
    tbao2 db 10, 13, "So luong so am: $"
    tbao3 db 10, 13, "So luong so duong: $"
    str db 100 dup("$") 
    soam db 0 
    soduong db 0  
    tongso db 1 
dseg ends 

cseg segment
    assume cs:cseg, ds:dseg  
begin: 
    mov ax, dseg
    mov ds, ax
    
    inchuoi tbao1
    mov ah, 0Ah
    lea dx, str
    int 21h  
             
    call xu_ly   
    
    xor ax,ax
    mov al, tongso
    sub al, soam
    mov soduong, al 

    inchuoi tbao2
    xor ax, ax 
    mov al, soam 
    call so_thanh_chu 
    
    inchuoi tbao3
    xor ax, ax 
    mov al, soduong 
    call so_thanh_chu  
    
    mov ah, 4ch
    int 21h

xu_ly proc
    lea si, str + 2
    kiemtra:
        mov dx, [si]
        cmp dl, '$'
        je exit   
        
        cmp  dl, '-'  
        je dem_so_am
        cmp dl, ',' 
        je dem_so
        inc si
        jmp kiemtra
          
    dem_so_am: 
        inc soam
        inc si
        jmp kiemtra 
        
    dem_so:    
        inc tongso
        inc si
        jmp kiemtra       
    
    exit:
        ret
xu_ly endp   
        
so_thanh_chu proc         
    xor cx, cx
    mov bx, 10
    chia10:
        xor dx, dx
        div bx            ;ax:thuong, dx:du
        push dx
        inc cx
        cmp ax, 0 
        jnz chia10  
    print:    
        mov ah, 02h 
        pop dx
        add dl, 30h 
        int 21h
        loop print
    ret
so_thanh_chu endp  

cseg ends
end begin

