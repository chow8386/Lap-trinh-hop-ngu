inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h 
endm 

dseg segment 
    tbao1 db "Nhap chuoi so (-12,23,44): $"
    tbao2 db 10,13, "Tong: $"
    str db 100 dup ("$")
    tmp dw ?
    sum dw ?
dseg ends

cseg segment
assume: ds:dseg, cs:cseg
begin:
    mov ax, dseg
    mov ds, ax       
    
    inchuoi tbao1 
    mov ah, 0Ah
    lea dx, str
    int 21h  
    
    inchuoi tbao2

    mov cx, 0
    mov cl, str + 1  ; chuyen do dai cua chuoi vao cl
    lea si, str + 2  ; lay dia chi ky tu dau tien luu vao si
    mov bx, 10
    mov ax, 0
    mov sum, ax 
    
    calc:
        mov dx, [si]
        cmp dl, '-'
        je next1
        mov dx, [si]
        cmp dl, ','
        je next2
        mul bx
        mov dx, [si]
        mov dh, 0
        sub dl, 30h
        add ax, dx
        jmp nextLoop
    
    next1:
        inc tmp
        jmp nextLoop
        
    next2:
        cmp tmp, 0
        jne tru
        jmp cong
        
        tru:
            mov tmp, 0 
            sub sum, ax
            mov ax, 0
            jmp nextLoop  
       
        cong:
            add sum, ax
            mov ax, 0
            jmp nextLoop    
            

    nextLoop:     
        inc si
        loop calc
        
        cmp tmp, 0
        jne tru2
        jmp cong2
        
        tru2:
            sub sum, ax
            jmp done  
       
        cong2:
            add sum, ax
            jmp done  
    
        done: 
    
    mov ax, sum
    call print     
    
    mov ah, 4ch
    int 21h
    
print proc
    mov bx, 10
    mov cx, 0
    chia10:
        mov dx, 0
        div bx    ; ax = ax / bx, dx = dx % bx
        push dx   ; day dx vao stack
        inc cx
        cmp ax, 0
        je hienthi
        jmp chia10
    hienthi:
        pop dx     ; lay dx tu stack
        add dl, 30h
        mov ah, 2
        int 21h
        dec cx
        cmp cx,0
        jne hienthi
    ret
print endp  

cseg ends
end begin   

;tong cac so am thi kq sai
