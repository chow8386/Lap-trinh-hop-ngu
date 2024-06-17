DSEG SEGMENT
    newline db 10,13,'$'
DSEG ENDS   

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG   
START:
    mov ax, DSEG
    mov ds, ax 
    
    mov ah, 01h
    int 21h 

    mov bl, al
    
    mov ah, 09h  
    lea dx, newline
    int 21h

print:
    mov dl, bl
    mov ah, 02h
    int 21h

    mov dl, ' '
    mov ah, 02h
    int 21h

    inc bl

    cmp bl, 'z'
    ja exit
    
    jmp print

exit:    
    mov ah, 4Ch
    int 21h 
    
CSEG ENDS
END START
