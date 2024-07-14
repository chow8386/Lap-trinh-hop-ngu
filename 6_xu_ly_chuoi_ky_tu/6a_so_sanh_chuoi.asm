writeln macro bien1
    ;LOCAL bien1
    mov ah, 09
    lea dx, bien1
    int 21h  
    
    mov ah, 02h
    mov dl, 0ah    ;xuong dong
    int 21h
    
    mov dl, 0dh    ;dua con tro ve dau dong
    int 21h
endm 

dseg segment
    tbao db "Chuong tring so sanh oldpass va newpass $"
    oldpass db "0123456789"
    newpass db "0123456789"
    tbao1 db "Hai chuoi giong nhau $"
    tbao2 db "Hai chuoi khong giong nhau $"
dseg ends    

cseg segment
assume cs:cseg, ds:dseg, es: dseg
begin: 
    mov ax, dseg    
    mov ds, ax
    mov es, ax   
    
    writeln tbao
    cld             ;chon chieu xu ly chuoi  trai -> phai, thap ->cao
    mov cx, 10       ;so ky tu/so byte can so sanh 
    ;mov cx, 5
    lea si, oldpass ;(DS:SI) -> dia chi cua chuoi nguon
    lea di, newpass ;(ES:DI)--> dia chi cua chuoi dich   

    repe cmpsb      ;so sanh tung ky tu/byte
    ;repe cmpsw 
    ;repe scasb
    je intb1 
    writeln tbao2
    jmp thoat
    
    intb1: 
        writeln tbao1 
    
    thoat:
    mov ah, 08h
    int 21h  
    
    mov ah, 4ch
    int 21h
cseg ends
end begin
 
;LOCAL bien1 de
    ;dinh nghia 1 bien cuc bo chi ton tai trong pham vi macro writeln
    
;dia chi DS va ES giong nhau
    ;dong 27, 28 deu gan bang ax 
    ;khong khai bao DS ES tren segment khac
        ;vi du lieu khi so sanh o 1 cung segment    
        
;REPE: repeat while equal
    ;giam cx, lap lai cmpsb neu cx khac 0 va ZF=1
    
;co the thay the REPE CMPSB bang SCASB
    ;
    
;CLD : clear direction flag
    ;dam bao cac hd cua cmpsb dien ra tu trai -> phai 
    
;thay doi CMPSB thanh CMPSW thi phai doi
    ;MOV CX, 5 o dong 32 
    ;vi CMPSW so sanh tung tu
    ;moi tu co 2 byte 
    
;jmp thoat de nhay den nhan thoat
    ;thoat khoi chtr
    ;neu bo lenh nay thi se in ra ca 2 thong bao