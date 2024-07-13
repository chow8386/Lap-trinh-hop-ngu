inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h 
endm 

dseg segment   
    tbao1 db "Nhap chuoi so (1,2,3): $" 
    tbao2 db 10, 13, "Tong: $"
    str db 30 dup ("$")
    sum dw 0
dseg ends 

cseg segment
    assume cs:cseg, ds:dseg  
begin: 
    mov ax, dseg
    mov ds, ax
    
    inchuoi tbao1
    mov ah, 0Ah
    lea dx, str
    int 21h
    
    inchuoi tbao2
    
    mov cx, 0
    mov cl, str + 1
    lea si, str + 2
    mov bx, 10
    mov ax, 0
    kiem_tra:
        mov dx, [si]
        cmp dl, ","
        je tinh_tong 
        
        mul bx
        mov dx, [si]
        mov dh, 0
        sub dl, 30h
        add ax, dx
        jmp tiep   
        
        tinh_tong:
            add sum, ax
            mov ax, 0
        tiep:
            inc si
    loop kiem_tra
    
    add sum, ax
    mov ax, sum
    call so_thanh_chu
    
    mov ah, 4ch
    int 21h
        
so_thanh_chu proc         
    xor cx, cx
    mov bx, 10
    chia10:
        xor dx, dx
        div bx            ;ax:thuong, dx:du
        push dx
        inc cx
        cmp ax, 0 
        jnz chia10  
    print:    
        mov ah, 02h 
        pop dx
        add dl, 30h 
        int 21h
        loop print
    ret
so_thanh_chu endp  

cseg ends
end begin

