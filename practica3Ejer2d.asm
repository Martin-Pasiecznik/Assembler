;* Escribir un programa que solicite ingresar caracteres por teclado y que recién al presionar la tecla F10
;los envíe a la impresora a través de la PIO. No es necesario mostrar los caracteres en la pantalla.

PA EQU 30H
PB EQU 31H
CA EQU 32H
CB EQU 33H

EOI EQU 20H
IMR EQU 21H
INT0 EQU 24H

F10 EQU 10

ORG 40
ID_F10 DW RUT_F10


ORG 1000H
MSJ DB "Ingrese un caracter (hasta 5)"
FIN DB ?
CAR DB ?
FIN2 DB ?

ORG 3000H
RUT_F10: ; INICIALIZACION PIO PARA IMPRESORA
; CA
MOV AL, 11111101B
OUT CA, AL
; CB
MOV AL, 0
OUT CB, AL

; RECORRER STRING
MOV BX, OFFSET CAR
POLL: IN AL,PA
      AND AL,1
      JNZ POLL

mov al,[bx]
OUT PB,AL

IN AL,PA
OR AL,2
OUT PA,AL

IN AL,PA
AND AL,11111101B
OUT PA,AL
; escribir otra latra
MOV BX,OFFSET CAR
       INT 6
       INC CX

MOV AL,EOI
OUT EOI,AL
IRET

ORG 2000H
CLI
MOV AL,11111110B
OUT IMR,AL
MOV AL,F10
OUT INT0,AL
STI

MOV CX,0 ;CONTADOR DE CARACTERES
MOV BX,OFFSET MSJ
MOV AL,OFFSET FIN- OFFSET MSJ
INT 7

MOV BX,OFFSET CAR
       INT 6
       INC CX

SALTO: 
      JMP SALTO

INT 0
END
