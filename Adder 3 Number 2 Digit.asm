.MODEL SMALL

.DATA
    tulisan db 13,10,13,10,'Masukkan Angka pertama:',13,10,'$'      ; untuk meminta input bilangan pertama dari user 
    tulisan1 db 13,10,'Masukkan Angka kedua:',13,10,'$'             ; untuk meminta input bilangan kedua dari user                   
    tulisan2 db 13,10,'Masukkan Angka ketiga:',13,10,'$'            ; untuk meminta input bilangan ketiga dari user
    tulisan3 db 13,10,'Hasilnya adalah:',13,10,'$'                  ; untuk menampilkan hasil penjumlahan  
    tulisan4 db 13,10,'Tekan angka 0 untuk mulai lagi :)',13,10,'$' ; untuk mengulangi program dari awal
    angka1 db 2 dup (?)                                             ; mengalokasikan array 2 elemen untuk input bilangan pertama
    angka2 db 2 dup (?)                                             ; mengalokasikan array 2 elemen untuk input bilangan kedua
    angka3 db 2 dup (?)                                             ; mengalokasikan array 2 elemen untuk input bilangan ketiga
    angka4 db 3 dup (?)                                             ; mengalokasikan array 3 elemen untuk hasil penjumlahan
    
.CODE     
.STARTUP

    MAIN:
    ;input 1 
        MOV DX,OFFSET tulisan   ; mengcopy tulisan ke DX 
        MOV AH,09H              ; mengcopy 09H ke AH agar interupt 21H nantinya menampilkan tulisan (string) 
        INT 21H                 ; cetak tulisan diakhiri $
        
        MOV AH,01H              ; mengcopy 01H ke AH agar interupt 21H nantinya meminta input pertama (puluhan) dari user  
        INT 21H                 ; cetak input dari user tersebut serta input dari user disimpan di AL 
        MOV angka1[0],AL        ; AL dimasukkan ke angka1 index 0
        
        MOV AH,01H              ; mengcopy 01H ke AH agar interupt 21H nantinya meminta input pertama (satuan) dari user  
        INT 21H                 ; cetak input dari user tersebut serta input dari user disimpan di AL 
        MOV angka1[1],AL        ; AL dimasukkan ke angka1 index 1
         
    ;input 2    
        MOV DX,offset tulisan1  ; mengcopy tulisan1 ke DX  
        MOV AH,09H              ; mengcopy 09H ke AH agar interupt 21H nantinya menampilkan tulisan1 (string)   
        INT 21H                 ; cetak tulisan diakhiri $
        
        MOV AH,01H              ; mengcopy 01H ke AH agar interupt 21H nantinya meminta input kedua (puluhan) dari user  
        INT 21H                 ; cetak input dari user tersebut serta input dari user disimpan di AL  
        MOV angka2[0],AL        ; AL dimasukkan ke angka2 index 0
        
        MOV AH,01H              ; mengcopy 01H ke AH agar interupt 21H nantinya meminta input kedua (satuan) dari user  
        INT 21H                 ; cetak input dari user tersebut serta input dari user disimpan di AL  
        MOV angka2[1],AL        ; AL dimasukkan ke angka2 index 1
    
    ;input 3    
        MOV DX,offset tulisan2  ; mengcopy tulisan2 ke DX  
        MOV AH,09H              ; mengcopy 09H ke AH agar interupt 21H nantinya menampilkan tulisan1 (string)   
        INT 21H                 ; cetak tulisan diakhiri $
        
        MOV AH,01H              ; mengcopy 01H ke AH agar interupt 21H nantinya meminta input kedua (puluhan) dari user  
        INT 21H                 ; cetak input dari user tersebut serta input dari user disimpan di AL  
        MOV angka3[0],AL        ; AL dimasukkan ke angka3 index 0
        
        MOV AH,01H              ; mengcopy 01H ke AH agar interupt 21H nantinya meminta input kedua (satuan) dari user  
        INT 21H                 ; cetak input dari user tersebut serta input dari user disimpan di AL  
        MOV angka3[1],AL        ; AL dimasukkan ke angka3 index 1
          
    ;penjumlahan                        
        MOV CL,angka1[1]        ; mengcopy angka1 index 1 ke CL 
        MOV DH,angka2[1]        ; mengcopy angka2 index 1 ke DH
        MOV AX,0000H            ; mengcopy 0000H ke AX (clear AX)
        ADD CL,DH               ; menjumlah DH dengan CL, diletakkan ke CL
        MOV AL,CL               ; mengcopy CL ke AL
        
        AAA                     ; mengubah AL yang tadinya heksadesimal ke BCD ke desimal
               
        MOV DL,AH               ; carry penjumlahan (AH) dicopy ke DL
        MOV CL,AL               ; hasil penjumlahan satuan 2 bilangan pertama (AL) dicopy ke CL
        MOV DH,angka3[1]        ; mengcopy angka3 index 1 ke DH
        MOV AX, 0000H           ; mengcopy 0000H ke AX (clear AX)
        ADD CL,DH               ; menjumlah DH dengan CL, diletakkan ke CL
        MOV AL,CL               ; mengcopy CL ke AL
        
        AAA                     ; mengubah AL yang tadinya heksadesimal ke BCD ke desimal
        
        ADD AH,DL               ; menjumlah DL (carry satuan) dengan AH (hasil penjumlahan satuan 3 bilangan pertama), diletakkan ke AH
        
        OR  AX,3030H            ; mengubah AX yang tadinya desimal ke ASCII
        MOV angka4[2],AL        ; mengcopy AL ke angka4 index 2
        
        MOV CL,angka1[0]        ; mengcopy angka1 index 0 ke CL 
        MOV DH,angka2[0]        ; mengcopy angka2 index 0 ke CL
        ADD CL,AH               ; menjumlah AH dengan CL, diletakkan ke CL
        MOV AX,0000H            ; mengcopy 0000H ke AX (clear AX)
        ADD CL,DH               ; menjumlah DH dengan CL, diletakkan ke CL
        MOV AL,CL               ; mengcopy CL ke AL    
        
        AAA                     ; mengubah AL yang tadinya heksadesimal ke BCD ke desimal
        
        MOV DL,AH               ; carry penjumlahan (AH) dicopy ke DL
        MOV CL,AL               ; hasil penjumlahan puluhan 2 bilangan pertama (AL) dicopy ke CL
        MOV DH,angka3[0]        ; mengcopy angka3 index 0 ke DH
        MOV AX,0000H            ; mengcopy 0000H ke AX (clear AX)
        ADD CL,DH               ; menjumlah DH dengan CL, diletakkan ke CL
        MOV AL,CL               ; mengcopy CL ke AL
        
        AAA                     ; mengubah AL yang tadinya heksadesimal ke BCD ke desimal
        
        ADD AH,DL               ; menjumlah DL (carry puluhan) dengan AH (hasil penjumlahan puluhan 3 bilangan pertama), diletakkan ke AH
        
        OR  AX,3030H            ; mengubah AX yang tadinya desimal ke ASCII
        MOV angka4[1],AL        ; mengcopy AL ke angka4 index 1
        MOV angka4[0],AH        ; mengcopy AL ke angka4 index 0
        
    ;print hasil    
        MOV DX, OFFSET tulisan3 ; mengcopy tulisan3 ke DX 
        mov AH, 09H             ; mengcopy 09H ke AH agar interupt 21H nantinya menampilkan tulisan3 (string) 
        INT 21H                 ; cetak tulisan hingga sebelum tanda $ 
        
        MOV AX,0000H            ; mengcopy 0000H ke AX (clear AX)
        MOV DL,angka4[0]        ; mengcopy angka4 index 0 ke DL karena DL yang akan ditampilkan setelah interupt 21H
        MOV AH,02H              ; mengcopy 02H ke AH agar interupt 21H nantinya menampilkan DL (char)
        INT 21H                 ; cetak DL ke layar    
        
        MOV AX,0000H            ; mengcopy 0000H ke AX (clear AX)
        MOV DL,angka4[1]        ; mengcopy angka4 index 1 ke DL karena DL yang akan ditampilkan setelah interupt 21H
        MOV AH,02H              ; mengcopy 02H ke AH agar interupt 21H nantinya menampilkan DL (char)
        INT 21H                 ; cetak DL ke layar 
        
        MOV AX,0000H            ; mengcopy 0000H ke AX (clear AX)
        MOV DL,angka4[2]        ; mengcopy angka4 index 2 ke DL karena DL yang akan ditampilkan setelah interupt 21H
        MOV AH,02H              ; mengcopy 02H ke AH agar interupt 21H nantinya menampilkan DL (char)
        INT 21H                 ; cetak DL ke layar 
    
    ;ulang program / tidak    
        MOV DX, OFFSET tulisan4 ; mengcopy tulisan4 ke DX 
        MOV ah, 09H             ; mengcopy 09H ke AH agar interupt 21H nantinya mena 
        INT 21H                 ; cetak tulisan hingga sebelum tanda $ 
    
        MOV AH,01H              ; mengcopy 01H ke AH agar ingerupt 21H nantinya meminta input user apakah ingin mengulang program atau tidak
        INT 21H                 ; cetak input dari user  dan disimpan di AL 
        CMP AL,30h              ; membandingkan input user dengan 30H (ASCII 0)
        JE MAIN:                ; jika input user = 0, maka mengulang program kembali
    
    ENDING:
         
.EXIT 
END
