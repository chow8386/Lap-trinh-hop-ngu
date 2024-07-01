DSEG SEGMENT   
    max db 250           ;so ky tu toi da   
    len db ?             ;chieu dai chuoi da nhap   
    tenfile db 250 dup(?)
DSEG ENDS

CSEG SEGMENT
ASSUME cs:cseg, ds:dseg
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
    
    mov ah, 3ch     ;tao tap tin moi
    lea dx, tenfile
    mov cx, 0       ;thuoc tinh tap tin: normal
    int 21h  
    
    mov bx, ax
    mov ah, 3eh     
    int 21h    
    
    mov ah, 4ch 
    int 21h
CSEG ENDS
END begin
