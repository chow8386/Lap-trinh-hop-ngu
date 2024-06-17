DSEG SEGMENT
    tb DB 10,13,'So ky tu trong chuoi la: $' 
    str db 255 dup(?)
    dem db 10 dup(?)
DSEG ENDS

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG
start:
    mov ax, DSEG
    mov ds, ax

    mov cx, 0        
    lea si, str    

input:
    mov ah, 01h        
    int 21h 
    
    cmp al, 0Dh   ; enter de ket thuc nhap     
    je dem_ki_tu
                
    mov [si], al     ; luu ky tu vao si
    inc si 
    inc cx      ;so ki tu luu o cx     
    jmp input    
    
dem_ki_tu: 
    mov ah, 9
    lea dx, tb
    int 21h
    
    mov ax, cx     
    mov cx, 0
    jmp convert

convert:          
    mov dx, 0
    mov bx, 10
    div bx          ; lay ax/bx, thuong luu o ax, du o dx
    add dx, '0'     ; chuyen du tu so thanh ascii
    push dx
    inc cx
    
    cmp ax, 00h
    jne convert
    
print:      
    pop dx
    mov ah, 2   ; in gt o dx
    int 21h
    loop print    ;dung khi cx=0
   
    mov ah, 4Ch       
    int 21h
    
CSEG ENDS
END start
