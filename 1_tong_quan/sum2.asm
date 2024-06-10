.model small
.stack 100h

.data
    KQUA dw ?   
    A dw ?      
    B dw ?      
    C dw ?      
    D dw ?      
    E dw ?      

.code
start:
    mov ax, @data
    mov ds, ax

    mov ax, 1000   
    mov A, ax
    mov ax, 10   
    mov B, ax
    mov ax, 1Fh   
    mov C, ax
    mov ax, 30h
    mov D, ax
    mov ax, 300Ah
    mov E, ax

    mov ax, A       
    add ax, B     
    sub ax, C       
    add ax, D      
    add ax, E       
    mov KQUA, ax    

    mov ah, 4Ch    
    int 21h
end start
