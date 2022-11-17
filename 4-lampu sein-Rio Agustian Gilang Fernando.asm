; Nama: Rio Agustian Gilang Fernando 
; NIM: 4211420004
; No. Presensi: 4

; Program ini memberikan simulasi lampu riting 
; (sign lamp) dengan tiga konfigurasi (kanan, 
; kiri, dan bahaya).
 
org 00h
right:
	mov a, p2
	cjne a, #11111110b, left ; switch 0 ditekan
	mov p1, #11111000b ; LED0 - LED2 menyala
	acall delay ; memanggil subrutin delay
	mov p1, #11111111b ; semua LED mati
	sjmp right 

left:
	cjne a, #01111111b, hazard ; switch 7 ditekan
	mov p1, #00011111b ; LED5-LED7 menyala
	acall delay ; memanggil subrutin delay
	mov p1, #11111111b ; semua LED mati
	sjmp right

hazard:
	cjne a, #11110111b, shut ; switch 3 ditekan
	mov p1, #11000011b ; LED2-LED5 menyala
	acall delay ; memanggil subrutin delay
	mov p1, #11111111b ; semua LED mati
	sjmp right

shut:
	cjne a, #11111111b, right ; switch tidak ditekan
	mov p1, #11111111b
	sjmp right

delay:  
	mov r1, #03h

delay1: 
	mov r2, #03h
 	djnz r2, $ ; $ maksudnya "lakukan baris ini lagi"
 	djnz r1, delay1 
 	ret ; keluar dari subrutin delay 
end

	
