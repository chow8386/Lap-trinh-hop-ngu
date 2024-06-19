inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM 

DSEG SEGMENT
    msg1 DB "Hay nhap 1 ky tu: $"
    msg2 DB "Ma ASCII o dang Hex: $" 
    msg3 DB "Ma ASCII o dang Dec: $"
    msg4 DB "Ma ASCII o dang Bin: $"
    xdong DB 10, 13, '$'
    kytu DB ?
DSEG ENDS 

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG
begin: 
    MOV AX, DSEG
    MOV DS, AX  
    
    inchuoi msg1
    MOV AH, 01h
    INT 21h 
    MOV kytu, AL 
    inchuoi xdong 
    
    inchuoi msg2
    MOV BL, kytu 
    CALL hex_out 
    MOV AH, 02      ;in ra ky tu h sau so Hex
    MOV DL, 'h'
    INT 21h
    inchuoi xdong
    
    inchuoi msg3
    XOR AX, AX
    MOV AL, kytu 
    CALL dec_out 
    inchuoi xdong
    
    inchuoi msg4
    MOV BL, kytu 
    CALL bin_out 
    inchuoi xdong
    
    MOV AH, 4Ch 
    INT 21h   
    
hex_out PROC
    MOV CX, 2
    xuat:
        PUSH CX     ;luu gia tri CX vao stack
        
        MOV CL, 4   ;1 ky tu co 4 bit hex
        MOV DL, BL
        SHR DL, CL  ;dich phai DL 4 bit de lay bit cao nhat cua BH
        
        CMP DL, 09h
        JA kytu2         ; >9 thi doi thanh chu
        
        ADD DL, 30h     ;Doi thanh ky tu '0'-'9'
        JMP inra 
        
        kytu2:
            ADD DL, 37h    ;Doi thanh ky tu 'A'-'F'
        
        inra:
            MOV AH, 02h 
            INT 21h
            SHL BX, CL  ;quay trai BX 4 bit
            POP CX
            LOOP xuat
    RET
hex_out ENDP 


dec_out PROC
    XOR CX, CX 
    MOV BX, 10
    chia10: 
        XOR DX, DX    
        DIV BX          ;ax:thuong, dx:du
        PUSH DX         ;cat du vao stack
        
        INC CX
        CMP AX, 0
        JNZ chia10 
    inra2: 
        MOV AH, 2 
        POP DX 
        ADD DL, 30h 
        INT 21h
        LOOP inra2
    RET
dec_out ENDP

bin_out PROC
    MOV CX, 8       ;xuat 8 bit trong BL ra man hinh
    xuat2:
        MOV DL, 0
        SHL BL, 1       ;CF chua MSB, xuat ra man hinh   ;dich trai BL 
        RCL DL, 1       ;dua CF vao LSB cua DL  ;rotate with carry left
                        ;bit trong CF se dua vao bit thap nhat (LSB) cua DL
        ADD DL, 30h     ;so + 30h = ky tu 
        
        MOV AH, 02h     ;in ra man hinh
        INT 21h
        LOOP xuat2
    RET
bin_out ENDP  
 

CSEG ENDS
END begin

