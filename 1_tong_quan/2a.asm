DSEG SEGMENT ;Tao doan DSEG
    chuoi DB "Hello World!$" ;khai bao bien chuoi
DSEG ENDS
CSEG SEGMENT    ;Tao dao CSEG
    ASSUME CS: CSEG, DS: DSEG   ; CSEG là doan lenh, DSEG là du lieu
begin: MOV AX, DSEG ;khoi dong dia chi doan du lieu
    MOV DS, AX
    MOV AH, 09h ; AH = 09h
    LEA DX, chuoi; DX = dia chi offset bien chuoi
    INT 21h ;ngat    
    
    MOV AH, 01h    
    INT 21h 
    
    MOV AH, 4Ch ; Thoat chuong trinh
    INT 21h
CSEG ENDS
    END begin