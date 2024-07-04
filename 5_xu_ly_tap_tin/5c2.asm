dseg segment
    max db 250           
    len db ?             
    tenfile db 250 dup(?)
    thefile dw ?               
    tenfile2 db "new_file.txt", 0
    thefile2 dw ?
    buffer db 251 dup ('$')
    len2 dw ?
dseg ends   

cseg segment
assume cs:cseg, ds:dseg
begin: 
    mov ax, dseg
    mov ds, ax  
    
    mov ah, 0ah         ;nhap ten file can doc
    lea dx, max
    int 21h
    
    xor cx, cx          ;dua 0 ve cuoi chuoi
    mov cl, len
    lea bx, tenfile         
    add bx, cx              
    mov byte ptr [bx], 0    
    
    mov ah, 3dh         ;mo tap tin da co
    lea dx, tenfile
    mov al, 2 
    int 21h  
    
    mov thefile, ax     ;cat the file
    mov ah, 3fh         ;doc noi dung
    mov bx, thefile
    lea dx, buffer
    mov cx, 250 
    int 21h 
    
    lea si, buffer
    xor cx, cx
calc_length:
    mov al, [si]
    cmp al, '$' 
    je done_calc
    inc si
    inc cx
    jmp calc_length
done_calc:
    mov len2, cx
    
    mov ah, 3ch         ;tao tap tin moi de luu
    lea dx, tenfile2
    mov cx, 0       
    int 21h  
    
    mov thefile2, ax    ;cat the file
    mov ah, 40h         ;ghi nd vao file moi
    mov bx, thefile2
    xor cx, cx 
    mov cx, len2
    lea dx, buffer
    int 21h 
    
    mov ah, 3eh         ;dong tap tin
    mov bx, thefile2
    int 21h 
    
    mov ah, 3eh         ;dong tap tin
    mov bx, thefile
    int 21h         
    
    mov ah, 4ch 
    int 21h
cseg ends
end begin
