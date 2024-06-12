DSEG SEGMENT
    tbao dw 10,13, 'Xin chao $'
    ten db 30, ?, 31 dup('$') 
    ;byte dau tien 30 - kich thuoc toi da cua chuoi
    ;byte t2 ? - do dai thuc te sau khi nhap  
    ;byte t3 31 - mang co 31 '$'
DSEG ENDS 

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG   
start:
    mov ax, DSEG
    mov ds, ax 
    
    mov ah, 0Ah
    lea dx, ten
    int 21h
    
    mov ah, 9
    lea dx, tbao
    int 21h 
    
    mov ah, 9
    lea dx, ten+2
    int 21h 

    mov ah,4Ch
    int 21h
CSEG ENDS
END start