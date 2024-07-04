dseg segment
    max db 250           ;so ky tu toi da   
    len db ?             ;chieu dai chuoi da nhap   
    tenfile db 250 dup(?)
    thefile dw ?
    buffer db 251 dup ('$')
dseg ends   

cseg segment
assume cs:cseg, ds:dseg
begin: 
    mov ax, dseg
    mov ds, ax  
    
    mov ah, 0ah
    lea dx, max
    int 21h
    
    xor cx, cx     ;dua 0 ve cuoi chuoi
    mov cl, len
    lea bx, tenfile         ;con tro o dau chuoi
    add bx, cx              ;+cx de con tro ve cuoi chuoi
    mov byte ptr [bx], 0    ;them 0 vao cuoi chuoi  
    
    mov ah, 3dh ; mo tap tin da co
    lea dx, tenfile
    mov al, 2 ; thuoc tinh tap tin
    int 21h  
    
    mov thefile, ax ; cat the file
    mov ah, 3fh ; doc noi dung file vao vung dem
    mov bx, thefile
    lea dx, buffer
    mov cx, 250 ; so byte can doc tu file da mo
    int 21h     
    
    mov ah, 3eh ; dong tap tin
    mov bx, thefile
    int 21h    
    
    mov ah, 09h ; in noi dung cua file ra man hinh
    lea dx, buffer
    int 21h      
    
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin
