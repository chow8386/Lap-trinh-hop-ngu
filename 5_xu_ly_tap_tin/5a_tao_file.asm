DSEG SEGMENT
    tenfile db "D:\TT_ASM\data.txt", 0
    thefile dw ?
DSEG ENDS

CSEG SEGMENT
ASSUME cs:cseg, ds:dseg
begin: 
    mov ax, dseg
    mov ds, ax 
    
    mov ah, 3ch     ;tao tap tin moi
    lea dx, tenfile
    mov cx, 0       ;thuoc tinh tap tin: normal
    int 21h  
    
    mov bx, ax
    ;mov thefile, ax ;cat the file
    mov ah, 3eh     ;dong tap tin
    ;mov bx, thefile
    int 21h    
    
    mov ah, 4ch 
    int 21h
CSEG ENDS
END begin

;khai bao thefile dw 
    ;vi khi tao 1 tap tin os tra ve 1 the file trong ax
    ;file nay co gia tri 16bit
    ;nen can 1 bien 16 bit de luu tru   
    
;khong dung 08h truoc 4Ch  
    ;08h de doc 1 ky tu, dung khi nhan dc 1 ky tu  
    ;vi dong file nen khong can nhap 1 ky tu lam gi

;dong file 
    ;giai phong tai nguyen
    ;tranh gap loi khi cac chtr truy cap file do

;khong can thiet phai dong tep tin

;co the bo bien thefile