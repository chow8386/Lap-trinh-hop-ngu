inchuoi MACRO chuoi      ;tuong tu ham
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM  

DSEG SEGMENT
    msg1 DB "Nhap 1 ky tu: $"
    msg2 DB "Ma ascii cua ky tu o dang bin la: $"
    xdong DB 10, 13, '$'
    sobin dw ?  ;luu tru so nhi phan nhan duoc
DSEG ENDS 

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG
begin: 
    MOV AX, DSEG
    MOV DS, AX 
    
    inchuoi msg1
    CALL bin_in
    MOV sobin, BX
    inchuoi xdong 
    
    inchuoi msg2
    MOV BX, sobin
    CALL bin_out   

    MOV AH, 4Ch      ;ket thuc chtr
    INT 21h 
    
bin_in PROC
    mov ah, 1
    int 21h
    mov bl, al
    RET
bin_in ENDP 
    
bin_out PROC
    MOV CX, 8       ;xuat 16 bit trong BL ra man hinh
    xuat:
        MOV DL, 0
        SHL BL, 1       ;CF chua MSB, xuat ra man hinh   ;dich trai BL 
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
