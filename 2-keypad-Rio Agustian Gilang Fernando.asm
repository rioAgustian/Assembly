; Nama: Rio Agustian Gilang Fernando
; NIM: 4211420004
; No. Presensi: 4

; Program akan memberikan keluaran figur huruf pada SSD
; sesuai dengan keypad yang ditekan.

; susunan baris dan kolom

;	 Col2 Col1 Col0
;	+----+----+----+
;	|  1 |  2 |  3 |	Row3
;	+----+----+----+
;	|  4 |  5 |  6 |	Row2
;	+----+----|----+
;	|  7 |  8 |  9 |	Row1
;	+----+----+----+
;	| 10 | 11 | 12 |	Row0
;	+----+----+----+

mulai1:	
	; scan baris 3
	clr p0.3				; set 0 baris 3
	mov r1, #00h
	acall baris3
	setb p0.3
	cjne R1, #01h, mulai2	; jika baris 3 tidak ditemukan, loncat ke baris 2
	sjmp mulai1		

mulai2:
	; scan baris 2
	clr p0.2				; set 0 baris 2
	acall baris2
	setb p0.2
	cjne r1, #02h, mulai3	; jika baris 2 tidak ditemukan, loncat ke baris 1
	sjmp mulai1		
	
mulai3:
	; scan baris 1
	clr p0.1				; set 0 baris 1
	acall baris1
	setb p0.1		
	cjne r1, #03h, mulai4	; jika baris 1 tidak ditemukan, loncat ke baris 0
	sjmp mulai1		
	
mulai4:
	; scan baris 0
	clr p0.0				; set 0 baris 0
	acall baris0
	setb p0.0			
	cjne r1, #04h, blink	; jika baris 0 tidak ditemukan, LED mati
	sjmp mulai1		

blink:
	mov p1, #0ffh
	sjmp mulai1

; subrutin scan kolom
baris3:		
	jnb p0.4, tombol_3	; jika p0.4 == 0, loncat ke tombol_3
	jnb p0.5, tombol_2	; keterangan selanjutnya menggunakan logika yang sama
	jnb p0.6, tombol_1  
	ret

baris2:
	jnb p0.4, tombol_6
	jnb p0.5, tombol_5	
	jnb p0.6, tombol_4
	ret	

baris1:
	jnb p0.4, tombol_9
	jnb p0.5, tombol_8
	jnb p0.6, tombol_7
	ret		

baris0:
	jnb p0.4, tombol_12
	jnb p0.5, tombol_11	
	jnb p0.6, tombol_10
	ret

; subrutin tombol-tombol
; tombol baris 3
tombol_1:	
	mov r1, #01h	; nilai r1 setiap baris berbeda
	mov p1, #088h	
	ret	

tombol_2:	
	mov r1, #01h	
	mov p1, #083h	
	ret

tombol_3:
	mov r1, #01h	
	mov p1, #0c6h 
	ret

; tombol baris 2
tombol_4:
	mov r1, #02h	
	mov p1, #0a1h
	ret

tombol_5:
	mov r1, #02h	
	mov p1, #086h
	ret											

tombol_6:
	mov r1, #02h	
	mov p1, #08eh
	ret				

; tombol baris 1
tombol_7:
	mov r1, #03h	
	mov p1, #0c2h
	ret

tombol_8:
	mov r1, #03h	
	mov p1, #089h	
	ret			

tombol_9:
	mov r1, #03h	
	mov p1, #0e6h
	ret				

; tombol baris 0
tombol_10:
	mov r1, #04h	
	mov p1, #0e1h		
	ret	

tombol_11:
	mov r1, #04h	
	mov p1, #085h	
	ret			

tombol_12:
	mov r1, #04h	
	mov p1, #0c7h	
	ret				
