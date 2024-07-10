inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h 
endm 

dseg segment   
    tbao1 db "Nhap chuoi so (1,2,-3): $"
    tbao2 db 10, 13, "So luong so chia het cho 5: $"
    string db 100 dup ("$") 
    dem dw 0
    num dw 0 
dseg ends 

cseg segment
    assume cs:cseg, ds:dseg  
begin: 
    mov ax, dseg
    mov ds, ax
    
    inchuoi tbao1
    mov ah, 0Ah
    lea dx, string
    int 21h
    
    inchuoi tbao2
    
    lea si, [string + 2]
    mov bx, 10
    mov ax, 0  
    
    xu_ly:
        mov dx, [si]
        cmp dl, '$'
        je print 
        cmp dl, 0Dh
        je ktra_chia_het
        cmp dl, ','
        je ktra_chia_het 
        cmp dl, '-'
        je next
        mul bx
        mov dx, [si] 
        mov dh, 0
        sub dx, 30h  
        add ax, dx 
        inc si
        jmp xu_ly 
        
    ktra_chia_het:
        xor dx, dx
        mov bx, 5       ;chia het cho 5
        div bx
        cmp dx, 0       ;kiem tra so du
        je tang_dem
        
        next:
            inc si
            mov ax, 0
            jmp xu_ly
        
        tang_dem:
            inc dem
            jmp next
            
    print:   
        xor cx, cx 
        mov ax, dem
        mov bx, 10
        pushdx: 
            mov dx, 0
            div bx
            add dx, 30h
            push dx
            inc cx
            cmp ax, 0
            jne pushdx
        popdx:
            pop dx
            mov ah, 02h
            int 21h
            loop popdx  
            
    mov ah, 4ch
    int 21h
    
cseg ends
end begin
