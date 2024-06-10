.model small
.stack 100h
.data         
    high_a dw 3Ah
    low_a dw 0B45Eh
    b dw 0A1h 
.code
main proc
    mov ax, @data
    mov ds, ax 
     
    mov dx, high_a
    mov ax, low_a
    mov bx, b
    div bx  ;DX:AX thuong o AX, du o DX 
    
    mov ah, 4Ch
    int 21h     
                  
main endp
end main