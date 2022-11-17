; Nama: Rio Agustian Gilang Fernando 
; NIM: 4211420004
; No. Presensi: 4

; Program berikut akan menampilkan 
; 4 huruf: r-i-o-A

org 00h

ssd3:
	setb p3.4 
	setb p3.3 
	mov a, p2
	cjne a, #11110111b, ssd2
	mov p1, #11001110b
	sjmp ssd3

ssd2:
	setb p3.4
	clr p3.3
	cjne a, #11111011b, ssd1
	mov p1, #11001111b
	sjmp ssd3

ssd1:
	clr p3.4
	setb p3.3
	cjne a, #11111101b, ssd0
	mov p1, #11000000b
	sjmp ssd3

ssd0:
	clr p3.4
	clr p3.3
	cjne a, #11111110b, blink
	mov p1, #10001000b
	sjmp ssd3

blink: ; fungsi subrutin = mati manakala switch tidak ditekan
	cjne a, #11111111b, ssd3
	mov p1, #11111111b
	sjmp ssd3

end
