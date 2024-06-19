inchuoi MACRO chuoi
    MOV AH, 9h
    LEA DX, chuoi
    INT 21h
ENDM 

DSEG SEGMENT
    msg1 DB "Hay nhap 1 ky tu: $"
    msg2 DB "Ma ASCII o dang Dec: $"
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
    XOR AX, AX
    MOV AL, kytu 
    CALL dec_out
    
    MOV AH, 4Ch 
    INT 21h 

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
    inra: 
        MOV AH, 2 
        POP DX 
        ADD DL, 30h 
        INT 21h
        LOOP inra
    RET
dec_out ENDP 

CSEG ENDS
END begin

