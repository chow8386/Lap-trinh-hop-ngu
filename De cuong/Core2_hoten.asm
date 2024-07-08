dseg segment
    tbao1 db "Nhap ho ten: $"
    msv db 10, 13, "AT180207$" 
    chuoi db 250, ?, 250 dup (?)
dseg ends

cseg segment
assume: cs:cseg, ds:dseg
begin:   
    mov ax, dseg
    mov ds, ax    
    
    mov ah, 09h
    lea dx, tbao1
    int 21h 
    
    mov ah, 0Ah
    lea dx, chuoi
    int 21h
    
    mov ah, 09h
    lea dx, msv
    int 21h   
    
    mov ah, 4ch
    int 21h
cseg ends
end begin