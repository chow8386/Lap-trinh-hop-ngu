inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm 

dseg segment 
    max db 255
    len db ?
    string db 255 dup (?)
    tbao1 db 'Nhap 1 chuoi: $'
    tbao2 db 10, 13, 'Chuoi chua ky tu can tim $'
    tbao3 db 10, 13, 'Chuoi khong chua ky tu can tim $' 
dseg ends  

cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: 
    mov ax, dseg
    mov ds, ax
    mov es, ax 
    
    inchuoi tbao1
    mov ah, 0Ah
    lea dx, max
    int 21h
    cld                 ;chon chieu xu ly chuoi
    mov cl, len         ;so ky tu can tim
    mov al, 'a'         
    lea di, string      ;(ES:DI)--> dia chi cua chuoi dich  
    
    repne scasb         ;lap lai viec tim kiem ky tu cho den
    jne khong_chua      ;khi gap duoc hoac den het chuoi
    inchuoi tbao2 
    jmp thoat   
    
    khong_chua: 
    inchuoi tbao3
    
    thoat: 
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin
