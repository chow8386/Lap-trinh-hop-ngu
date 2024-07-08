inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
    
    mov ah, 02h
    mov dl, 0Ah
    int 21h 
    
    mov ah, 02h
    mov dl, 0Dh
    int 21h
endm

dseg segment
    max db 250
    len db ? 
    tenfile 250 dup (?)
    thefile dw ?
    tbao1 db "Nhap ten file: $"   
    tbao2 db 10, 13, "Nhap noi dung file: $" 
    string dw 251, ?, 250 dup ('$')
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
    mov byte ptr [bx], 0    ;them 0 vao cuoi
    
    mov ah, 3ch             ;tao file moi
    lea dx, tenfile
    mov cx, 0
    int 21h
    mov thefile, ax
    
    inchuoi tbao2
    mov ah, 0Ah
    lea dx, string
    int 21h   
    
    lea si, string + 1       ;lay do dai cua chuoi
    mov al, [si]
    mov len, al
    
    mov ah, 40h              ;ghi vao file
    mov bx, thefile
    mov cl, len
    lea dx, string + 2
    int 21h
    
    mov bx, thefile
    mov ah, 3eh
    int 21h
    
    mov ah, 4ch
    int 21h
cseg ends
end begin