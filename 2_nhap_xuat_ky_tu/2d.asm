DSEG SEGMENT
    max DB 200
    len DB 0      
    chuoi DB 30 dup('$') ;giong khai bao mang
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
    lea dx, max 
    int 21h 
      
    ;mov ah,9 
    ;lea dx,chuoi+2
    ;int 21h     
    
    mov ah, 4Ch
    int 21h   

CSEG ENDS
    END start

;sua chtr de nhap nhieu hon 30 ky tu
;sua max len 200 thi ko can "chuoi DB 30,dup('$)"
; sua chuoi len 200 thi "chuoi DB 30,dup('$)" 
;va thay lea dx,chuoi o hang 16