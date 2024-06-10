.model small
.stack 100h
.data
    a dw 16
    b dw 0AF1h     
.code
main proc
    mov ax, @data
    mov ds, ax 
     
    mov ax, a
    mov bx, b
    mul bx
    
    mov ah, 4Ch
    int 21h     
                  
main endp
end main