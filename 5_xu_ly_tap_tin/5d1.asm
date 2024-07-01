dseg segment
    max db 250           ;so ky tu toi da   
    len db ?             ;chieu dai chuoi da nhap   
    tenfile db 250 dup(?)
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
    
    mov ah, 41h ; xoa tap tin da co
    lea dx, tenfile
    int 21h
    
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin
