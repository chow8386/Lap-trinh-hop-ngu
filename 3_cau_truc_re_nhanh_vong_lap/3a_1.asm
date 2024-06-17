DSEG SEGMENT
    msgHOA db 10,'Ky tu HOA$'
    msgThuong db 10,'Ky tu thuong$'
DSEG ENDS
CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG   
START:
    mov ax, DSEG
    mov ds, ax
    mov ah, 01h
    int 21h 

    ;kiem tra chu thuong
    cmp al, 'A'     ;so sanh vs A
    jb thuong       ;nho hon A -> thuong
    cmp al, 'Z'     
    ja thuong       ; lon hon Z -> thuong

    lea dx, msgHOA
    jmp exit

    thuong:
        lea dx, msgThuong

    exit:
        mov ah, 09h
        int 21h
    
        mov AH, 4Ch
        int 21h
CSEG ENDS
END START
 
 
;neu ko co "jmp exit" thi chi in ra thuong