.model small
.stack 100h
.data
    a dw 1000
    b dw 100    
.code
main proc
    mov ax, @data
    mov ds, ax 
     
    mov ax, a
    mov bx, b
    div bx
    
    mov ah, 4Ch
    int 21h     
                  
main endp
end main