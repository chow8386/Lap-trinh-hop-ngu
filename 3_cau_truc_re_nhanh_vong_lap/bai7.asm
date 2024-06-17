.model small
.stack 100h           
.data
    tb1 db 'Nhap A: $'
    tb2 db 10,13,'Nhap B: $'
    tb3 db 10,13,'A/B: $'
    tb4 db 10,13,'A*B: $' 
    str db 10,0,10 dup('$')
    coso db 10
    b1 dw 0
    b2 dw 0
.code
main proc
    mov ax, @data
    mov ds,ax
            
    mov ah, 9
    lea dx, tb1
    int 21h
    
    mov ah, 0Ah
    lea dx, str
    int 21h
    
    mov ah, 9
    lea dx, tb2 
    int 21h
    
    call xulichuoi
    mov b1, dx
    
    mov ah, 0Ah
    lea dx, str
    int 21h
    
    call xulichuoi
    mov b2, dx
    
    mov ah, 9
    lea dx, tb3
    int 21h
    
    mov dx, b1
    mov ax, b2
    
    xor cx,cx
    chia:
        sub dx, ax
        inc cx
        cmp dx, ax
        jae chia 
    
    mov ax, cx 
    call print   
    
    lea dx, tb4
    mov ah, 9
    int 21h
    
    xor cx, cx
    xor dx, dx 
    mov cx,b2
    nhan:   
        add dx, b1
        loop nhan 
            
    mov ax,dx  
    call print 
    
    mov ah, 4Ch
    int 21h
main endp 

print proc 
    xor cx, cx
    lapchia:
        xor dx, dx
        div coso
        add ah, 30h
        mov dl, ah
        push dx
        inc cx 
        
        xor ah, ah
        cmp ax, 0
        jne lapchia  
        
    hienthi:
        pop dx
        mov ah, 2 
        int 21h
        loop hienthi
    ret
print endp

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