inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h    
endm

dseg segment
    tbao1 db "Nhap ma sinh vien: $" 
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
    
    inchuoi tbao1 
    mov ah, 0Ah
    lea dx, chuoi
    int 21h 
    
    mov cx, 8
    lea si, chuoi + 2
    lea di, msv
    repe cmpsb       ;chuoi bang nhau ZF se dc thiet lap
    je print
    inchuoi tbao2
    jmp exit
    
    print:
        inchuoi hoten  
    
    exit:
        mov ah, 4ch
        int 21h
cseg ends
end begin