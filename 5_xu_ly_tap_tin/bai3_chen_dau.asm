dseg segment
    max db 250           
    len db ?             
    tenfile db 250 dup(?)
    thefile dw ?
    buffer db 251 dup ('$')
    max2 db 250           
    len2 db ? 
    new_string db 251 dup('$') 
dseg ends   

cseg segment
assume cs:cseg, ds:dseg
begin: 
    mov ax, dseg
    mov ds, ax  
    
    mov ah, 0ah
    lea dx, max
    int 21h
    
    xor cx, cx          ;dua 0 ve cuoi chuoi
    mov cl, len
    lea bx, tenfile         
    add bx, cx              
    mov byte ptr [bx], 0     
    
    mov ah, 3dh         ;mo tap tin da co
    lea dx, tenfile
    mov al, 2           ; mode read/write
    int 21h  
    
    mov thefile, ax 
    mov ah, 3fh         ;doc noi dung file vao vung dem
    mov bx, thefile
    lea dx, buffer
    mov cx, 250 
    int 21h   
    
    mov ah, 0ah         ;nhap chuoi moi
    lea dx, max2
    int 21h

    mov ah, 42h         ;di chuyen con tro ve dau file
    mov bx, thefile
    mov al, 0 
    xor cx, cx
    xor dx, dx
    int 21h

    mov ah, 40h         ;ghi chuoi moi vao file
    mov bx, thefile
    lea dx, new_string
    mov cl, len2 
    int 21h

    mov ah, 3eh          ;dong file
    mov bx, thefile
    int 21h  

    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin
