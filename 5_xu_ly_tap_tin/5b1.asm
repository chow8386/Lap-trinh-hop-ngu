dseg segment
    string1 dw 255, ?, 255 dup ('$') 
    len db 0                         
    tenfile db "tt_asm\solieu.txt", 0
    thefile dw ?
dseg ends

cseg segment
assume cs:cseg, ds:dseg
begin:
    mov ax, dseg
    mov ds, ax

    mov ah, 0Ah
    lea dx, string1
    int 21h

    mov si, offset string1 + 1
    mov al, [si]
    mov len, al

    mov ah, 3ch
    lea dx, tenfile
    mov cx, 0  
    int 21h
    mov thefile, ax  

    mov ah, 40h
    mov bx, thefile
    mov cl, len  
    lea dx, string1 + 2 
    int 21h

    mov ah, 3eh
    mov bx, thefile
    int 21h

    mov ah, 4ch
    int 21h
cseg ends

end begin
