CSEG SEGMENT
    ASSUME CS: CSEG
start:
    mov dl, 'Z'
    nhan:
        mov ah, 02h
        int 21h  
        
        dec dl
        cmp dl, 'A' 
    jnb nhan 
    
    mov ah, 08h 
    int 21h  
    
    mov ah, 4Ch
    int 21h
CSEG ENDS
END start
