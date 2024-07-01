dseg segment  
    max_old db 250            
    len_old db ?               
    oldfile 250 dup(?) 
    max db 250            
    len db ? 
    newfile 250 dup(?)
dseg ends  

cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: 
    mov ax, dseg
    mov ds, ax
    mov es, ax 
    
    mov ah, 0ah
    lea dx, max_old
    int 21h
    
    xor cx, cx     ;dua 0 ve cuoi chuoi
    mov cl, len_old
    lea bx, oldfile         ;con tro o dau chuoi
    add bx, cx              ;+cx de con tro ve cuoi chuoi
    mov byte ptr [bx], 0    ;them 0 vao cuoi chuoi  
    
    mov ah, 0ah
    lea dx, max
    int 21h
    
    xor cx, cx     ;dua 0 ve cuoi chuoi 
    mov cl, len
    lea bx, newfile         ;con tro o dau chuoi
    add bx, cx              ;+cx de con tro ve cuoi chuoi
    mov byte ptr [bx], 0    ;them 0 vao cuoi chuoi        
    
    mov ah, 56h ; rename/remove ten file cu thanh moi
    lea dx, oldfile
    lea di, newfile
    int 21h  
    
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin  

