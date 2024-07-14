inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h    
endm

dseg segment
    tbao1 db 10, 13, "Nhap ma sinh vien: $" 
    tbao2 db 10, 13, "Sai ma sinh vien!$"  
    hoten db 10, 13, "Le Minh Chau$" 
    msv db "AT180207" 
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
        cmp cx, 8
        jne saikq

    lea si, chuoi + 2
    lea di, msv
    repe cmpsb       ;chuoi bang nhau ZF se dc thiet lap
    je print
    
    saikq:
        inchuoi tbao2
        jmp nhap
    
    print:
        inchuoi hoten  

    mov ah, 4ch
    int 21h
cseg ends
end begin