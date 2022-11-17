; Nama: Rio Agustian Gilang Fernando
; NIM: 4211420004
; No. Presensi: 4

; Program ini mengemudikan nyala LED pada p1 sesuai saklar SW yang ditutup.
; Figur yang tertampil pada SSD adalah figur 0-9.

org 000h
mulai:
	mov a, p2
	cjne a, #11111110b, banding1 	; saklar p2.0 tutup
	mov p1, #11000000b 				; LED p1.0 nyala
	sjmp mulai

banding1:
	cjne a, #11111101b,banding2 	; saklar p2.1 ditutup
	mov p1, #11111001b 				; LED p1.1 nyala
	sjmp mulai

banding2: 
	cjne a, #11111011b, banding3 	; saklar p2.2 ditutp
	mov p1, #10100100b 				; LED p1.2 nyala
	sjmp mulai

banding3: 
	cjne a, #11110111b, banding4 	; saklar p2.3 ditutp
	mov p1, #10110000b 				; LED p1.3 nyala
	sjmp mulai

banding4: 
	cjne a, #11101111b, banding5 	; saklar p2.4 ditutp
	mov p1, #10011001b 				; LED p1.4 nyala
	sjmp mulai

banding5: 
	cjne a, #11011111b, banding6 	; saklar p2.5 ditutp
	mov p1, #10010010b 				; LED p1.5 nyala
	sjmp mulai

banding6: 
	cjne a, #10111111b, banding7	; saklar p2.6 ditutp
	mov p1, #10000010b				; LED p1.6 nyala
	sjmp mulai

banding7: 
	cjne a, #01111111b, blank 		; saklar p2.7 ditutp
	mov p1, #11111000b 				; LED p1.7 nyala
	sjmp mulai

blank:
	cjne a, #11111111b, mulai;
	mov p1, #11111111b
	sjmp mulai

end
