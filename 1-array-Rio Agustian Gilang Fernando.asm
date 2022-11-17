; Nama: Rio Agustian Gilang Fernando
; NIM: 4211420004
; No. Presensi: 4

; Kode ini memberikan keluaran pada SSD berupa
; figur angka 0-9 secara berurutan dengan menggunakan
; metode array.


org 0h
mulai:
	mov r2, #0ah
	mov dptr, #numerik

nextdata:
	clr a
	movc a, @a+dptr
	mov p1, a
	inc dptr
	acall delay1 
	djnz r2, nextdata
	sjmp mulai

delay1:
	mov r1, #02h 
delay2:
	djnz r1, delay2
	ret

numerik:
	db 0c0h, 0f9h, 0a4h, 0b0h, 099h, 082h, 0f8h, 080h, 090h
end
