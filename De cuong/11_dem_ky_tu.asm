inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm

dseg segment 
    tbao1 db 'Nhap 1 chuoi: $'
    tbao2 db 10, 13, 'So ky tu trong chuoi la: $' 
    string db 255 dup(?)
    dem db 10 dup(?)
dseg ends

cseg segment
assume: cs:cseg, ds:dseg
begin:   
    mov ax, dseg
    mov ds, ax
              
    inchuoi tbao1
    mov cx, 0        
    lea si, string    

input:
    mov ah, 01h        
    int 21h 
    
    cmp al, 0Dh     ;enter de ket thuc nhap     
    je dem_ki_tu
          
    mov [si], al    ;luu ky tu vao si
    inc si 
    inc cx          ;so ki tu luu o cx     
    jmp input    
    
dem_ki_tu: 
    inchuoi tbao2
    
    mov ax, cx     
    mov cx, 0
    jmp convert

convert:          
    mov dx, 0
    mov bx, 10
    div bx          ;lay ax/bx, thuong luu o ax, du o dx
    add dx, '0'     ;chuyen du tu so thanh ascii
    push dx
    inc cx
    
    cmp ax, 00h
    jne convert
    
print:      
    pop dx
    mov ah, 02h       ;in gt o dx
    int 21h
    loop print      ;dung khi cx=0
   
    mov ah, 4Ch       
    int 21h
    
cseg ends
end begin