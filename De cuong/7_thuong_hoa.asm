inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi
    int 21h 
endm 

dseg segment
    string db 255 dup ('$')  
    tbao1 db 'Nhap 1 chuoi: $'
    tbao2 db 10, 13, 'Chuyen thuong thanh hoa: $'
ends dseg    

cseg segment
    assume cs:cseg, ds:dseg  
start: 
    mov ax, dseg
    mov ds, ax   
    
    inchuoi tbao1
    mov ah, 0Ah
    lea dx, string
    int 21h 
    
    inchuoi tbao2
    lea si, string + 2
     
    thuong_thanh_hoa:
        mov dl, [si]
        cmp dl, 'a' 
        jb in_hoa
        cmp dl, 'z'
        ja in_hoa 
        sub dl, 32  

    in_hoa:
        mov ah, 2
        int 21h
        
        inc si
        cmp [si], '$'
        jne thuong_thanh_hoa              
    
    mov ah, 4ch
    int 21h
cseg ends
end start