.model small
.stack 100h
.data
.code
main proc  
    mov ax, 10
    add ax, 8086
    sub ax, 100h
    add ax, 350
    add ax, 0FAh
    
main endp
end main