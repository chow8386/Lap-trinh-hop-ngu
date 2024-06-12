DSEG SEGMENT
    max DB 30
    len DB 0  ;luu do dai ky tu da nhap
    chuoi DB 30 dup(?)
    tbao DB 'Hay go vao 1 chuoi: $'
DSEG ENDS
CSEG SEGMENT
    ASSUME CS: CSEG, DS: DSEG
start: mov ax, DSEG
    mov ds, ax
    mov ah, 09h 
    lea dx, tbao
    int 21h      
    
    mov ah, 0Ah 
    lea dx, MAX 
    int 21h     
    
    mov ah, 4Ch 
    int 21h
CSEG ENDS
    END start
    
;chuoi nhap vao se luu o bien 'chuoi'