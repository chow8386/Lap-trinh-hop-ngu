DSEG SEGMENT
chuoi DB 'Chao sinh vien nganh Cong Nghe Thong Tin.$'
DSEG ENDS
CSEG SEGMENT
ASSUME CS: CSEG, DS: DSEG
start: mov ax, DSEG
mov ds, ax
mov ah, 09h ; H�m 9, in chu?i k� t? ra m�n h�nh
lea dx, chuoi ; dl ch?a k� t? c?n in
int 21h ; g?i ng?t th?c hi?n
mov ah, 08h
int 21h
mov ah, 4Ch ; tho�t kh?i chuong tr�nh
int 21h
CSEG ENDS
END start