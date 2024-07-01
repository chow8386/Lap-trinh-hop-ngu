DSEG SEGMENT
    TB1 DB "NHAP CHUOI: $" 
    CHUOI DB 100 DUP('$')
    TB2 DB 10, 13, "NHAP TEN FILE: $" 
    THEFILE DW ? 
    MAX DB 250
    LEN DB ?
    TENFILE DB 250 DUP(?)
DSEG ENDS

CSEG SEGMENT
    ASSUME CS:CSEG, DS:DSEG
    START:
        MOV AX, DSEG
        MOV DS, AX
        
        MOV AH, 09H
        LEA DX, TB1
        INT 21H
        
        MOV AH, 0AH
        LEA DX, CHUOI
        INT 21H      
        
        MOV AH, 09H
        LEA DX, TB2
        INT 21H
        
        MOV AH, 0AH
        LEA DX, MAX 
        INT 21H 
        
        XOR CX, CX
        MOV CL, LEN
        LEA SI, TENFILE
        ADD SI, CX
        MOV [SI], CH

        MOV AH, 3DH
        LEA DX, TENFILE
        MOV AL, 2 
        INT 21H
        MOV THEFILE, AX
        
        MOV AH, 42H 
        MOV BX, THEFILE
        XOR CX, CX
        XOR DX, DX
        MOV AL, 0
        INT 21H
        
        
        MOV AH, 40H ; GHI FILE
        MOV BX, THEFILE
        XOR CX, CX
        MOV CL, LEN
        LEA DX, CHUOI+2
        INT 21H

        
        
        MOV AH, 3EH       
        MOV BX, THEFILE   
        INT 21H

        MOV AH, 4CH
        INT 21H
CSEG ENDS
END START