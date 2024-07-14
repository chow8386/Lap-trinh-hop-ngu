inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h 
endm 

dseg segment   
    tbao1 db "Nhap chuoi so (1,2,3): $"
    tbao2 db 10, 13, "So luong snt: $"
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
    
    lea si, string + 2
    mov bx, 10
    mov ax, 0  
    mov cx, 2
    
    xu_ly:
        mov dx, [si]
        cmp dl, '$'
        je print 
        cmp dl, 0Dh
        je ktra_snt
        cmp dl, ','
        je ktra_snt
        mul bx
        mov dx, [si] 
        mov dh, 0
        sub dx, 30h  
        add ax, dx 
        inc si
        jmp xu_ly 
        
    ktra_snt:
        mov num, ax
        calc:  
            mov ax, num     ;< 2
            cmp ax, 2
            jb next     
                   
            cmp cx, ax      ;=2
            je endnum             
            
            mov dx, 0       ;2-> n: nghiem != n thi kp snt        
            div cx
            cmp dx, 0       ;du luu o dx, du 0 la chia het
            je next   
            
            inc cx
            jmp calc        
            
        endnum:
            inc dem   
            
        next:
            inc si
            mov cx, 2
            mov ax, 0
            jmp xu_ly              
            
    print:   
        xor cx, cx 
        mov ax, dem
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
cseg ends
end begin

