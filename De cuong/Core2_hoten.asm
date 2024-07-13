inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h    
endm   

dseg segment
    tbao1 db 10, 13, "Nhap ho ten: $"   
    tbao2 db 10, 13, "Sai ho ten!$"  
    hoten db "Le Minh Chau" 
    msv db 10, 13, "AT180207$" 
    chuoi db 100 dup ('$')
dseg ends

cseg segment
assume: cs:cseg, ds:dseg, es:dseg
begin:   
    mov ax, dseg
    mov ds, ax
    mov es, ax    
    
    nhap:
        inchuoi tbao1 
        mov ah, 0Ah
        lea dx, chuoi
        int 21h  
        
        mov cl, chuoi + 1
        cmp cx, 12
        jne saikq
    
    lea si, chuoi + 2
    lea di, hoten
    repe cmpsb       ;chuoi bang nhau ZF se dc thiet lap
    je print 
    
    saikq:
        inchuoi tbao2
        jmp nhap
    
    print:
        inchuoi msv  
    
    mov ah, 4ch
    int 21h
cseg ends
end begin