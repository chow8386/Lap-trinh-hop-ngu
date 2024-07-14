inchuoi MACRO chuoi      ;tuong tu ham
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM  

DSEG SEGMENT
    msg1 DB "Hay nhap so nhi phan 16 bit: $"
    msg2 DB "So nhi phan da nhap la: $"
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
    MOV BX, 0       ;xoa BL
    MOV CX, 16       ;nhap du 16 bit thi dung
    nhap:
        MOV AH, 01h     
        INT 21h 
        
        CMP AL, 0Dh     ;neu la phim enter thi thoi nhap
        JZ exit         ;neu khong phai enter thi doi sang bit  
        
        SHL BX, 1       ;dich trai BL 1 bit  ;bit moi them vao ben phai
        SUB AL, 30h     ;cho nay khong doi thanh AX, vi 1 ky tu vua nhap chi luu o AL thoi
        ADD BL, AL      
        LOOP nhap
    exit:
        RET
bin_in ENDP 
    
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
