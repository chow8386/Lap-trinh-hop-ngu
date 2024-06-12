DSEG SEGMENT 
   input db ?
   tbao1 dw 'Hay go 1 phim: $'
   tbao2 dw 10,13,'Ky tu nhan duoc la: $'
DSEG ENDS
CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG
start: 
    mov ax, DSEG
    mov ds, ax  
    mov ah, 9 
    lea dx, tbao1
    int 21h
    
    mov ah, 7
    int 21h       ;sau khi nhap thi dua vao thanh ghi al
    mov input,al
    
    mov ah, 9 
    lea dx, tbao2
    int 21h 
    
    mov ah, 2
    mov dl, input   ;no chi in ra tu thanh ghi dl
    int 21h
    
    mov ah, 4Ch
    int 21h
CSEG ENDS
END start