dseg segment
    string1 db "Chao em co gai Lam Hong"
    len db $ - string1     
    tenfile db "tt_asm\data.txt", 0
    thefile dw ?
dseg ends 

cseg segment
assume cs:cseg, ds:dseg
begin: 
    mov ax, dseg
    mov ds, ax   
    
    mov ah, 3ch ; tao tap tin moi
    lea dx, tenfile
    mov cx, 0 ; tap tin co thuoc tinh normal  
    int 21h  
    
    mov thefile, ax ; cat the file
    mov ah, 40h ; ghi file
    mov bx, thefile
    xor cx, cx
    mov ch, len
    lea dx, string1
    int 21h  
    
    mov ah, 3eh ; dong tap tin
    mov bx, thefile
    int 21h   
    
    mov ah, 4ch ; thoat ve Dos
    int 21h
cseg ends
end begin

;len db $ - string1 dung de
    ;tinh do dai thuc cua chuoi
    ;lay DIACHI hien tai - DIACHI ban dau cua string1
    
;xor cx, cx de
    ;dat gia tri gia tri thanh ghi cx ve 0
    ;vi xor 1 1 = 0
    ;thay bang mov cx, 0 ; sub cx, cx ; and cx, 0
    
;dung mov cl, len 
    ;khong dung dc mov cx, len vi khai bao len la 8bit
    ;khong dung dc mov ch, len 
        ;vi du len = 13
        ;cx se tro thanh 1300 chu kp 0013
    ;khai bao len dw thi dung dc mov cx, len
    ;khong doi thi chtr bao loi