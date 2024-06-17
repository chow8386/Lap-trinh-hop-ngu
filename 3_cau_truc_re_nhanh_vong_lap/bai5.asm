dseg segment
    str db 256 dup('$')
    tb1 db 10, 13, 'Chuyen hoa thanh thuong: $'
    tb2 db 10, 13, 'Chuyen thuong thanh hoa: $'
ends dseg    

cseg segment
    assume cs:cseg, ds:dseg  
start: 
    mov ax, dseg
    mov ds, ax   
    
    mov ah, 0Ah
    lea dx, str
    int 21h 
    
    mov ah, 9
    lea dx, tb1
    int 21h
    lea si, str + 2
     
    hoa_thanh_thuong:
        mov dl, [si]
        cmp dl, 'A' 
        jb in_thuong
        cmp dl, 'Z'
        ja in_thuong 
        add dl, 32  

    in_thuong:
        mov ah, 2
        int 21h
        
        inc si
        cmp [si], '$'
        jne hoa_thanh_thuong       ;jump not equal
    
    mov ah, 9
    lea dx, tb2
    int 21h 
    lea si, str + 2
    
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