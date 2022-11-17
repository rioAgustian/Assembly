; Nama: Rio Agustian Gilang Fernando
; NIM: 4211420004
; No. Presensi: 4

; Kode ini memberikan keluaran LED berkedip. Figur angka 7
; yang tertampil pada SSD akan nyala-mati sesuai delay
; yang telah diatur.

org 0000h

; program utama
utama: 
	mov p1, #11111000b
	acall tunda
	mov p1, #11111111b	
	acall tunda
	sjmp utama

; subrutin tunda
tunda: 
	mov r0, #2
tunda1: 
	mov r1, #2
tunda2: 
	mov r2, #2
	djnz r2, $
	djnz r1, tunda2
	djnz r0, tunda1
	ret
end
