dseg segment
    string1 db "Khong co gi quy hon doc lap tu do"
    string2 db 34 dup('$')
dseg ends  

cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: 
    mov ax, dseg
    mov ds, ax 
    mov es, ax    
    
    cld ; chon chieu xu ly chuoi 
    mov cx, 33 ; so ky tu/so byte can di chuyen
    lea si, string1 ; (DS:SI)--> dia chi cua chuoi nguon    
    lea di, string2 ; (ES:DI)--> dia chi cua chuoi dich
    rep movsb ; di chuyen tung byte   
     
    
    mov ah, 09h
    lea dx, string2
    int 21h 
    
    mov ah,08h ; dung man hinh de xem ket qua
    int 21h    
    
    mov ah, 4ch ; thoat ve Dos
    int 21h   
end begin 
cseg ends
          
;khai bao 34 dup vi
    ;cuoi chuoi phai ket thuc $ thi ham 09h moi chay   
    
;thay CLD thanh STD 
    ;CLD: tu thap den cao
    ;STD: tu cao den thap, SI DI giam
    ;sau lan lap REP MOVSB dau tien, con tro giam ve vitri 0
    ;nen chi in ra moi K 
    
;thay MOVSB thanh MOVSW thi 
    ;phai them MOVSB de di chuyen 1 byte le 
    ;va sua mov cx, 16     
    
;thay MOVSB bang lenh
    ;copy_loop:
    ;lodsb ; Load byte tu DS:SI vao AL, tang SI
    ;stosb ; Luu byte tu AL vào ES:DI, tang DI
    ;loop copy_loop