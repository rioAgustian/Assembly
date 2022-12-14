; Nama: Rio Agustian Gilang Fernando
; NIM: 4211420004
; No. Presensi: 4

; LED akan menyala dari kanan ke kiri secara berurutan

mulai:
	mov a, #11111000b	; data pada akumulator

lagi:
	rl a				; geser kiri
	mov p1, a			; tampilkan
	acall tunda			
	sjmp lagi			; geser lagi

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
