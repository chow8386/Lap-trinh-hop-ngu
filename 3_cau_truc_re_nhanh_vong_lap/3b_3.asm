DSEG SEGMENT
    temp db ?
DSEG ENDS
CSEG SEGMENT
    ASSUME CS: CSEG,DS:DSEG
start:
    ;mov dl, 'A' 
    mov dl, 'Z'
    mov cx, 26 
    mov temp, dl

    nhan:
        mov ah, 02h 
        mov temp, dl       
        int 21h 
        
        mov ah, 02h 
        mov dl, ' '       
        int 21h            
        
        mov dl, temp
        ;inc dl
        dec dl            
    
    loop nhan           
        
    mov ah, 08h         
    int 21h         
    
    mov ah, 4Ch        
    int 21h                

CSEG ENDS
END start
