inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h 
endm 

dseg segment   
    so dw ?
    tbao1 db 'DEC: $'  
    tbao2 db 10, 13, 'HEX: $'  
    tbao3 db 10, 13, 'BIN: $'    
dseg ends 

cseg segment
    assume cs:cseg, ds:dseg  
begin: 
    mov ax, dseg
    mov ds, ax
    
    inchuoi tbao1
    call dec_in 
    mov so, dx 
    
    inchuoi tbao2
    mov bx, so
    call hex_out
    
    xor bx, bx 
    
    inchuoi tbao3
    mov bx, so
    call bin_out 
    
    mov ah, 4ch
    int 21h
     
dec_in proc 
    xor dx, dx
    mov bx, 10
    
    nhap:
        mov ah, 01h
        int 21h 
        
        cmp al, 0Dh
        je exit
        
        sub al, 30h
        xor ah, ah
   
        mov cl, al
        mov ax, dx
        mul bx
        add ax, cx
        mov dx, ax          
        
        jmp nhap
    exit:  
        ret
dec_in endp 

hex_out proc
    mov cx, 4  
    xuat:   
        push cx     ;luu gia tri CX vao stack
        
        mov cl, 4   ;1 ky tu co 4 bit hex
        mov dl, bh
        shr dl, cl  ;dich phai DL 4 bit de lay bit cua BH
        
        cmp dl, 09h
        ja kytu         ; >9 thi doi thanh chu
        
        add dl, 30h     ;Doi thanh ky tu '0'-'9'
        jmp inra 
        
        kytu:
            add dl, 37h    ;Doi thanh ky tu 'A'-'F'
        
        inra:
            mov ah, 02h 
            int 21h
            shl bx, cl  ;dich trai BX 4 bit
            pop cx
            loop xuat
    ret
hex_out endp 

bin_out proc
    mov cx, 16          ;xuat 16 bit trong BL ra man hinh
    xuat2:
        mov dl, 0
        shl bx, 1       ;dich trai 1 bit, bit cao nhat (MSB) dua vao CF
        rcl dl, 1       ;dua CF vao LSB cua DL  ;rotate with carry left
                        ;bit trong CF se dua vao bit thap nhat (LSB) cua DL
        add dl, 30h     
        
        mov ah, 02h
        int 21h
        loop xuat2
bin_out endp 

cseg ends
end begin

