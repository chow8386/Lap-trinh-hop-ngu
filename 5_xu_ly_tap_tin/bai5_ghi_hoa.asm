dseg segment
    thefile dw ?
    buffer db 251 dup ('$')  
    max db 250            
    len db ?               
    tenfile db 250 dup(?)
dseg ends   

cseg segment
assume cs:cseg, ds:dseg
begin: 
    mov ax, dseg
    mov ds, ax    
    
    mov ah, 0ah         ;nhap ten file
    lea dx, max
    int 21h
    
    xor cx, cx          ;them 0 vao cuoi file
    mov cl, len
    lea bx, tenfile         
    add bx, cx             
    mov byte ptr [bx], 0   
    
    mov ah, 3dh         ;mo file de doc
    lea dx, tenfile
    mov al, 2 
    int 21h  
    
    mov thefile, ax     ;doc va luu vao buffer
    mov ah, 3fh 
    mov bx, thefile
    lea dx, buffer
    mov cx, 250 
    int 21h  
    
    mov ah, 3eh         ;doc xong thi dong file
    mov bx, thefile
    int 21h 
    
    ;chuyen thuong sang hoa
    lea si, buffer 
    xor cx, cx
    thuong_thanh_hoa:
        mov dl, [si]
        cmp dl, 'a' 
        jb in_hoa
        cmp dl, 'z'
        ja in_hoa 
        sub dl, 32  

    in_hoa:
        mov [si], dl
        inc si   
        inc cx
        cmp [si], '$'
        jne thuong_thanh_hoa  
    
    mov ah, 3dh          ;mo file de ghi
    lea dx, tenfile
    mov al, 2 
    int 21h      
    
    mov ah, 40h          ;ghi du lieu sau khi doi
    mov bx, thefile
    lea dx, buffer
    mov cx, cx           
    int 21h  
    
    mov ah, 3eh          ;ghi xong thi dong file
    mov bx, thefile
    int 21h    

    mov ah, 4ch 
    int 21h
cseg ends
end begin
