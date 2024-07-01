dseg segment
    oldfile db "tt_asm\solieu.txt", 0
    newfile db "tt_asm\baitap\data.txt", 0
dseg ends  

cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: 
    mov ax, dseg
    mov ds, ax
    mov es, ax       
    
    mov ah,56h ; rename/remove ten file cu thanh moi
    lea dx, oldfile
    lea di, newfile
    int 21h  
    
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin  

;doi /baitap/data.txt thi
    ;solieu.txt bien mat
    ;file data.txt duoc tao trong /baitap
