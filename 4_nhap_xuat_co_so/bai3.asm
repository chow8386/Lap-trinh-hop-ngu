        inchuoi MACRO chuoi      ;tuong tu ham
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM  

DSEG SEGMENT
    msg1 DB "Nhap so A (hex 16 bit): $"
    msg2 DB "Nhap so B (hex 16 bit): $"
    msg3 DB "A + B = $" 
    msg4 DB "A - B = $"
    msg5 DB "A and B = $"
    msg6 DB "A or B =  $"
    xdong DB 10, 13, '$'
    so1 dw ? 
    so2 dw ? 
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
    ;call bin_out
    ;inchuoi xdong 
    
    inchuoi msg2
    CALL hex_in
    MOV so2, BX
    inchuoi xdong
    ;call bin_out 
    ;inchuoi xdong 
    
    inchuoi msg3
    mov ax, so1
    add ax, so2
    mov bx, ax
    call bin_out 
    inchuoi xdong
     
    inchuoi msg4
    mov ax, so1
    sub ax, so2
    mov bx, ax
    call bin_out
    inchuoi xdong
    
    inchuoi msg5
    mov ax, so1
    and ax, so2
    mov bx, ax
    call bin_out
    inchuoi xdong
    
    inchuoi msg6
    mov ax, so1
    or ax, so2 
    mov bx, ax
    call bin_out
    inchuoi xdong

    MOV AH, 4Ch      ;ket thuc chtr
    INT 21h 

hex_in PROC
    MOV BX, 0       ;xoa BL
    MOV CX, 4       ;lap 2 lan de du 16 bit
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
            cmp al, 'Z'
            jbe chu_hoa
            ja chu_thuong
            chu_hoa:
                sub al, 37h
            chu_thuong:
                sub al, 57h    
        
        done:
        SHL BX, 4
        xor ah, ah       
        add BX, AX      ;chuyen bit tu AX sang BX luu tru  

        LOOP nhap
    exit:
        RET
hex_in ENDP 
    
bin_out PROC
    MOV CX, 16       ;xuat 16 bit trong BL ra man hinh
    xuat:
        MOV DL, 0
        SHL BX, 1       ;CF chua MSB, xuat ra man hinh   ;dich trai BL 
        RCL DL, 1       ;dua CF vao LSB cua DL  ;rotate with carry left
                        ;bit trong CF se dua vao bit thap nhat (LSB) cua DL
        ADD DL, 30h     ;so + 30h = ky tu 
        
        MOV AH, 02h     ;in ra man hinh
        INT 21h
        LOOP xuat
    RET
bin_out ENDP  

CSEG ENDS
END begin
