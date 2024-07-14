.model small
.stack 100h

.data   
    A dw 1000        
    B dw 10   
    C dw 1Fh       
    D dw 30h     
    E dw 300Ah

.code
start:
    mov ax, @data
    mov ds, ax

    mov ax, A       
    add ax, B     
    sub ax, C       
    add ax, D      
    add ax, E        

    mov ah, 4Ch    
    int 21h
end start
