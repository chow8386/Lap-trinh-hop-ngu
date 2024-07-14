inchuoi MACRO chuoi      ;tuong tu ham
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM  

DSEG SEGMENT
    msg1 DB "Hay nhap so nhi phan 8 bit: $"
    msg2 DB "So nhi phan da nhap la: $"
    xdong DB 10, 13, '$'
    sobin DB ?  ;luu tru so nhi phan nhan duoc
DSEG ENDS 

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG
begin: 
    MOV AX, DSEG
    MOV DS, AX 
    
    inchuoi msg1
    CALL bin_in
    MOV sobin, BL
    inchuoi xdong 
    
    inchuoi msg2
    MOV BL, sobin
    CALL bin_out   

    MOV AH, 4Ch      ;ket thuc chtr
    INT 21h 
    
bin_in PROC
    MOV BL, 0       ;xoa BL
    MOV CX, 8       ;nhap du 8 bit thi dung
    nhap:
        MOV AH, 01h     
        INT 21h 
        
        CMP AL, 0Dh     ;neu la phim enter thi thoi nhap
        JZ exit         ;neu khong phai enter thi doi sang bit  
        
        SHL BL, 1       ;dich trai BL 1 bit  ;bit moi them vao ben phai
        SUB AL, 30h     ;ky tu - 30h = so
        ADD BL, AL      ;chuyen bit tu AL sang BL luu tru
        LOOP nhap
    exit:
        RET
bin_in ENDP 
    
bin_out PROC
    MOV CX, 8       ;xuat 8 bit trong BL ra man hinh
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
