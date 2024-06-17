DSEG SEGMENT
    msg_hoa db 10,'Ky tu HOA$'
    msg_thuong db 10,'Ky tu thuong$'
    msg_khac db 10,'Ky tu khac$'
DSEG ENDS   

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG   
START:
    mov ax, DSEG
    mov ds, ax 
    
    mov ah, 01h
    int 21h 

    cmp al, 'A'
    jb khac 
    
    cmp al, 'Z'
    jbe hoa 
    
    cmp al, 'a'
    jb khac
    
    cmp al, 'z'
    jbe thuong
    
    jmp khac

hoa:
    lea dx, msg_hoa 
    jmp print
thuong:
    lea dx, msg_thuong 
    jmp print
khac:
    lea dx, msg_khac 
    jmp print

print:
    mov ah, 09h
    int 21h

    mov AH, 4Ch
    int 21h 
    
CSEG ENDS
END START
 
