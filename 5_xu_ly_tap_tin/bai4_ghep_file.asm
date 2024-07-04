dseg segment
    max db 250           
    len db ?                
    tenfile db 250 dup(?)
    thefile dw ?    

    max2 db 250           
    len2 db ? 
    tenfile2 db 250 dup(?)
    thefile2 dw ? 
    
    max3 db 250           
    len3 db ? 
    tenfile3 db 250 dup(?)
    thefile3 dw ?    
    
    str1 db 251 dup ('$')    
    str2 db 251 dup ('$')
    
    str1_len dw ?  
    str2_len dw ?
    
dseg ends   

cseg segment
assume cs:cseg, ds:dseg
begin: 
    mov ax, dseg
    mov ds, ax  
    
    ;doc file 1 va ghi vao file moi
    mov ah, 0ah         ;nhap file 1
    lea dx, max
    int 21h
    
    xor cx, cx          ;dua 0 ve cuoi chuoi
    mov cl, len
    lea bx, tenfile         
    add bx, cx              
    mov byte ptr [bx], 0     
    
    mov ah, 3dh         ;mo file 1
    lea dx, tenfile
    mov al, 2           ;mode read/write
    int 21h  
    
    mov thefile, ax 
    mov ah, 3fh         ;doc noi dung file 1
    mov bx, thefile
    lea dx, str1
    mov cx, 250 
    int 21h 
    
    mov str1_len, ax
    
    mov ah, 3eh          ;dong file 1
    mov bx, thefile
    int 21h  
    
    ;doc file 2 va ghi vao file moi
    mov ah, 0ah         ;nhap file 2
    lea dx, max2
    int 21h
    
    xor cx, cx          ;dua 0 ve cuoi chuoi
    mov cl, len2
    lea bx, tenfile2         
    add bx, cx              
    mov byte ptr [bx], 0     
    
    mov ah, 3dh         ;mo file 2
    lea dx, tenfile2
    mov al, 2           ;mode read/write
    int 21h  
    
    mov thefile2, ax 
    mov ah, 3fh         ;doc noi dung file 2
    mov bx, thefile2
    lea dx, str2
    mov cx, 250 
    int 21h 
    
    mov str2_len, ax
    
    mov ah, 3eh          ;dong file 2
    mov bx, thefile2
    int 21h    
    
    ;nhap ten file moi va ghep 2 file 1 va file 2
    mov ah, 0ah         ;nhap file 3
    lea dx, max3
    int 21h
    
    xor cx, cx          ;dua 0 ve cuoi chuoi
    mov cl, len3
    lea bx, tenfile3         
    add bx, cx              
    mov byte ptr [bx], 0  
    
    mov ah, 3ch         ;tao tap tin moi de luu
    lea dx, tenfile3
    mov cx, 0       
    int 21h    
    mov thefile3, ax
    
    mov ah, 3dh         ;mo file 3
    lea dx, tenfile3
    mov al, 2           ;mode read/write
    int 21h  
    
    mov ah, 40h         ;ghi noi dung file 1
    mov bx, thefile3
    lea dx, str1
    mov cx, str1_len 
    int 21h

    mov ah, 42h         ;di chuyen con tro ve cuoi
    mov bx, thefile
    mov al, 2 
    xor cx, cx
    xor dx, dx
    int 21h

    mov ah, 40h         ;ghi noi dung file 2
    mov bx, thefile
    lea dx, str2
    mov cx, str2_len 
    int 21h

    mov ah, 3eh          ;dong file
    mov bx, thefile3
    int 21h  

    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin
