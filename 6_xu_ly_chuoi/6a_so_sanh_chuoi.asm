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
