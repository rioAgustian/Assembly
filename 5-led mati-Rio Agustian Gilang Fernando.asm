; Nama: Rio Agustian Gilang Fernando
; NIM: 4211420004
; No. Presensi: 4

; Kode ini adalah template untuk membuat LED off 
; saat tidak ditekan.
       
start:
	mov a, p2
 	CJNE a, #11111110b, x1		; saklar 0
	mov p1, #10010010b 			; SSD menunjukan angka 5
	acall delay 				; tunggu beberapa saat
	mov p1, #11111111b 			; LED mati semua
	sjmp start 					; mulai dari strat

x1: 	; x1 dieksekusi apabila yang ditekan saklar 1
	mov a, p2
	CJNE a, #11111101b, start 	; saklar 1
	mov p1, #10110000b 		  	; SSD menunjukan angka 3
	acall delay 			  	; tunggu beberapa saat
	mov p1, #11111111b 		  	; LED mati semua
	sjmp start 				  	; mulai dari start

; untuk memahami bagian delay di bawah ini, 
; amati perubahan nilai pada r1 dan r2
delay:  
	mov r1, #03h

delay1: 
	mov r2, #03h
 	djnz r2, $ 					; $ maksudnya "lakukan baris ini lagi"
 	djnz r1, delay1 
 	ret							; keluar dari subrutin delay 

end
