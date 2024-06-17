inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM

DSEG SEGMENT
    msg1 DB 'Hay nhap 1 ky tu: $'
    msg2 DB 'Ma ASCII o dang Hex: $'
    xdong DB 10, 13, '$'
    kt DB ?
DSEG ENDS

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG  
begin: 
    MOV AX, DSEG
    MOV DS, AX
    
    inchuoi msg1
    MOV AH, 01h
    INT 21h
    MOV kt, AL    ;luu tru ky tu
    inchuoi xdong 
    
    inchuoi msg2
    MOV BL, kt    ;ky tu can in
    CALL hex_out 
    
    MOV AH, 02      ;in ra ky tu h sau so Hex
    MOV DL, 'h'
    INT 21h
    MOV AH, 4Ch 
    INT 21h   
    
hex_out PROC
    MOV CX, 4
    xuat:
        PUSH CX     ;luu gia tri CX vao stack
        
        MOV CL, 4   ;1 ky tu co 4 bit hex
        MOV DL, BH
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
            SHL BX, CL  ;quay trai BX 4 bit
            POP CX
            LOOP xuat
    RET
hex_out ENDP  

CSEG ENDS
END begin

