inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h    
endm   

dseg segment
    tbao1 db "Nhap ho ten: $"   
    tbao2 db 10, 13, "Sai ho ten!$"  
    hoten db "Le Minh Chau" 
    msv db 10, 13, "AT180207" 
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
    lea di, hoten
    repe cmpsb       ;chuoi bang nhau ZF se dc thiet lap
    je print
    inchuoi tbao2
    jmp exit
    
    print:
        inchuoi msv  
    
    exit:
        mov ah, 4ch
        int 21h
cseg ends
end begin