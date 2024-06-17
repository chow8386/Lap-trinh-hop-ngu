inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM

DSEG SEGMENT
    msg1 DB 'Nhap so thu nhat (hex): $'
    msg2 DB 'Nhap so thu hai (hex): $'
    msg3 DB 'Tong 2 so la (hex): $' 
    xdong DB 10, 13, '$'
    so1 DW ?
    so2 DW ?
DSEG ENDS

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG  
begin: 
    MOV AX, DSEG
    MOV DS, AX 
    
    inchuoi msg1
    CALL hex_in
    MOV so1, BX     
    inchuoi xdong 
        
    inchuoi msg2
    CALL hex_in
    MOV so2, BX 
    inchuoi xdong  
    
    mov ax, so1
    add ax, so2
    MOV BX, AX    ;luu tru ket qua
    
    inchuoi msg3
    CALL hex_out 
    
    MOV AH, 02      ;in ra ky tu h sau so Hex
    MOV DL, 'h'
    INT 21h
    MOV AH, 4Ch 
    INT 21h 
    
hex_in PROC
    MOV BX, 0       ;xoa BL
    MOV CX, 2       ;lap 2 lan de du 8 bit
    nhap:
        MOV AH, 01h     
        INT 21h    
        
        cmp al, '9'
        jbe convert_so
        ja convert_chu
        
        convert_so:
            sub al, 30h
            jmp done
        
        convert_chu:
            sub al, 37h    
        
        done:
        SHL BL, 4       
        add BL, aL      ;chuyen bit tu AL sang BL luu tru  

        LOOP nhap
    exit:
        RET
hex_in ENDP   
    
hex_out PROC
    MOV CX, 2  
    
    mov dl,bh       ; th cong du
    cmp dl, 0  
    jne indu
    je xuat
        
    indu:  
        ADD DL, 30h
        mov ah, 2
        int 21h 
        
    xuat:
        PUSH CX     ;luu gia tri CX vao stack
        
        MOV CL, 4   ;1 ky tu co 4 bit hex
        MOV DL, BL
        SHR DL, CL  ;dich phai DL 4 bit de lay bit cao nhat cua BH
        
        CMP DL, 09h
        JA kytu         ; >9 thi doi thanh chu
        
        ADD DL, 30h     ;Doi thanh ky tu '0'-'9'
        JMP inra 
        
        kytu:
            ADD DL, 37h    ;Doi thanh ky tu 'A'-'F'
        
        inra:
            MOV AH, 02h 
            INT 21h
            SHL BL, CL  ;quay trai BX 4 bit
            POP CX
            LOOP xuat
            
       
    RET
hex_out ENDP  

CSEG ENDS
END begin

