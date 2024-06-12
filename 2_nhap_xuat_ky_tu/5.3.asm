DSEG SEGMENT
    input db ?
    tbao1 dw 'Hay go 1 phim: $'
    tbao2 dw 10,13,'Ky tu ke truoc: $'
    tbao3 dw 10,13,'Ky tu ke sau: $' 
DSEG ENDS

CSEG SEGMENT  
    ASSUME CS:CSEG, DS:DSEG
start: 
    mov ax,DSEG
    mov ds, ax
    mov ah,9
    lea dx, tbao1
    int 21h 
    
    mov ah,1
    int 21h 
    
    ;doc 1 ky tu va luu vao
    mov input,al
    
    ;ky tu ke truoc
    lea dx, tbao2
    mov ah,9
    int 21h      
    
    mov al, input    ;chay den 21h al bi thay doi
    sub al, 1h       ;nen phai gan lai tu input
    mov dl, al
    mov ah,2 
    int 21h  
    
    ;ky tu ke sau
    lea dx, tbao3
    mov ah,9
    int 21h      
             
    add input, 1h
    mov dl, input
    mov ah, 2 
    int 21h 
    
    
    mov ah, 4Ch
    int 21h
    
CSEG ENDS 
END start