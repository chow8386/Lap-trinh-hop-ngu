.model small
.stack 100h 
.data   
    tb1 db 'Nhap vao so thu nhat: $'
    tb2 db 10, 13, 'Nhap vao so thu hai: $'
    tb3 db 10, 13, 'Tong hai so la: $'
    str db 10,0, 10 dup('$')
    coso dw 10 
    b1 dw 0 
    b2 dw 0 
.code
main proc
    mov ax, @data
    mov ds,ax 
    
    mov ah, 9      ;nhap so 1
    lea dx, tb1
    int 21h 

    lea dx, str
    mov ah, 0Ah
    int 21h 
    
    call xulichuoi
    mov b1, dx  
    
    mov ah,9        ;nhap so 2
    lea dx, tb2
    int 21h 
    
    mov ah, 0Ah
    lea dx, str
    int 21h
      
    mov ah, 9
    lea dx, tb3
    int 21h
    
    call xulichuoi
    mov b2,dx  
            
    ;tinh tong
    mov dx, b2
    add dx, b1
    
    mov ax, dx
    xor cx, cx
    chia:
        xor dx, dx
        div coso
        add dx, 30h
        push dx
        inc cx     
        
        cmp ax, 0
        jne chia 
        
    hienthi:
        pop dx
        mov ah, 2 
        int 21h
        loop hienthi
        
    mov ah,4Ch
    int 21h                                
    
main endp 

xulichuoi proc
    xor dx,dx
    xor cx,cx
    lea si, str + 2
    mov cl, [str + 1]
    lap:
        mov ax, dx
        xor bx, bx
        mov bl, [si]
        sub bl, 30h
        mul coso
        add ax, bx
        mov dx, ax
        inc si
        loop lap
    ret
xulichuoi endp
 
end main