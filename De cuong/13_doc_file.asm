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
    tbao2 db 10, 13, "Noi dung file: $"   
    string dw 251 dup ('$')
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
    
    mov ah, 3dh             ;mo file da co
    lea dx, tenfile
    mov al, 2               ;read/write
    int 21h
    mov thefile, ax
    
    mov ah, 3fh             ;doc noi dung file
    mov bx, thefile
    lea dx, string
    mov cx, 250 
    int 21h
    
    mov ah, 3eh
    mov bx, thefile
    int 21h
    
    inchuoi tbao2
    mov ah, 09h
    lea dx, string
    int 21h   
    
    mov ah, 4ch
    int 21h
cseg ends
end begin