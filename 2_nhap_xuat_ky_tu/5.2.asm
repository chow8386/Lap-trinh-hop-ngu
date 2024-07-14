DSEG SEGMENT
    tbao DB 'Hay go vao 30 ky tu: $' 
    buffer db 30 dup(?)
DSEG ENDS

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG
start:
    mov ax, DSEG
    mov ds, ax

    mov ah, 09h        
    lea dx, tbao
    int 21h

    mov cx, 30        
    lea si, buffer    

input_loop:
    mov ah, 01h        
    int 21h            
    mov [si], al   ;lưu giá trị của al vào địa chỉ bộ nhớ thanh ghi si    
    inc si            
    loop input_loop    

    mov ah, 4Ch       
    int 21h

CSEG ENDS
END start
