inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h  
endm 

dseg segment
    coso dw 10
    tbao1 db 'Nhap n thoa man 0<=n<=8: $'
    newline db 10, 13, '$' 
dseg ends

cseg segment
    assume: ds:dseg, cs:cseg
start:
    mov ax, dseg
    mov ds, ax   
    
    inchuoi tbao1
    mov ah, 01h
    int 21h 
 
    sub al, 30h
    mov cl, al  
    
    inchuoi newline
           
    mov ax, 1
    mov bx, 1
    
    giaithua:
        mul bx          ;kq luu o ax
        inc bx
        loop giaithua    ;bx <= cx
        
    convert:
        xor dx, dx
        div coso
        add dx, 30h
        push dx
        inc cx
        cmp ax, 0
        jne convert
    
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