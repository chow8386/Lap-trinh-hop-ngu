.model small
.stack 100h
.data
    a db 15h
    b db 250     
.code
main proc   
    mov al, a
    mov bl, b
    mul bl
    
    mov ah, 4Ch
    int 21h     
                  
main endp
end main