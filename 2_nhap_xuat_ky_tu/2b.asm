DSEG SEGMENT
tbao DB 'kma',10,13,'cntt$'
DSEG ENDS
CSEG SEGMENT
ASSUME CS: CSEG, DS: DSEG
start:mov ax, DSEG
mov ds, ax
mov ah, 09h ; In cau thong bao ra man hinh
lea dx, tbao
int 21h
mov ah, 01h ; Ham 1, nhan ky tu tu ban phim
int 21h ; goi ngat thuc hien ham
mov ah, 4Ch ; thoat khoi chuong trinh
int 21h
CSEG ENDS
END start
