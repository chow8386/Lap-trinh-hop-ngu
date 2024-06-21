dseg segment
    coso dw 10
    xdong db 10,13,'$' 
    tb1 db 'Nhap n thoa man 0<n<=8: $' 
dseg ends

cseg segment
    assume: ds:dseg, cs:cseg
start:
    mov ax, dseg
    mov ds, ax   
    
    lea dx, tb1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h  
    
    sub al, 30h
    mov cl, al
    
    mov ah, 09   
    lea dx, xdong
    int 21h
           
    mov ax, 1
    mov bx, 1
    
    giaithua:
        mul bx     ;kq luu o ax
        inc bx
        cmp bx, cx 
        jbe giaithua   ;bx <= cx
    
    xor cx, cx      
    lap:
        xor dx, dx
        div coso
        add dx, 30h
        push dx
        inc cx
        cmp ax, 0
        jne lap
    
    print:
        pop dx
        mov ah, 2
        int 21h
        loop print
            
    mov ah, 4Ch
    int 21h 
cseg ends
end start








































































;9! vuot qua 16 bit nen 8! la max               
;16 bit: 0 -> 65535 (2^16 - 1)