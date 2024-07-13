inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment
    max db 250
    len db ? 
    tenfile 250 dup (?)
    thefile dw ?
    tbao1 db "Nhap ten file: $"  
dseg ends

cseg segment
assume: cs:cseg, ds:dseg
begin:   
    mov ax, dseg
    mov ds, ax    
    
    inchuoi tbao1
    mov ah, 0Ah
    lea dx, max
    int 21h
           
    xor cx, cx
    mov cl, len
    lea bx, tenfile         ;con tro o dau chuoi
    add bx, cx              ;+cx de dua con tro ve cuoi
    mov [bx], 0    ;them 0 vao cuoi
    
    mov ah, 41h
    lea dx, tenfile
    int 21h
    
    mov ah, 3eh             ;xoa file
    mov bx, thefile
    int 21h  
    
    mov ah, 4ch
    int 21h
cseg ends
end begin