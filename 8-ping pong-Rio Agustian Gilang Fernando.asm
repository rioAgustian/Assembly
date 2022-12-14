; Nama: Rio Agustian Gilang Fernando
; NIM: 4211420004
; No. Presensi: 4

; LED menyala dari kanan ke kiri, lalu ke kanan lagi.
; Seperti ping pong.

org 0h
mov a, #11111110b
mulai:
	mov p1, a
	acall tunda
	rl a
	cjne a, #01111111b, mulai

mulai1:
	mov p1, a
	acall tunda
	rr a
	sjmp mulai

tunda:
	mov r0, #0
ulangi1:
	mov r1, #0
ulangi2:
	mov r2, #0
ulangi3:
	inc r2
	cjne r2, #1, ulangi3
	inc r1
	cjne r1, #1, ulangi2
	inc r0
	cjne r0, #1, ulangi1
	ret

end
