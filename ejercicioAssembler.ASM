;Escribir un programa que solicite el ingreso de un número (de un dígito) por teclado y muestre en pantalla dicho
;número expresado en letras. Luego que solicite el ingreso de otro y asI sucesivamente. Se debe finalizar la ejecución al
;ingresarse en dos vueltas consecutivas el número cero.

ORG 1000H
MSJ DB "INGRESE UN NUMERO:"
FIN_MSJ DB ?
NUM DB ?
NUM0 DB "CERO  "
NUM1 DB "UNO   "
NUM2 DB "DOS   "
NUM3 DB "TRES  "
NUM4 DB "CUATRO"
NUM5 DB "CINCO "
NUM6 DB "SEIS  "
NUM7 DB "SIETE "
NUM8 DB "OCHO  "
NUM9 DB "NUEVE "
CANTIDAD DB 0H


ORG 2000H
OTRO_NUM:
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN_MSJ-OFFSET MSJ
INT 7
MOV BX, OFFSET NUM
INT 6
mov DX,30H
CMP NUM,30H
JZ CONTADOR
continuar:
MOV CX, OFFSET NUM0
SALTO: CMP DL,NUM
          JZ NUM_ENCONTRADO
          INC DX
          ADD CX,6H
          CMP DX,3AH
          JZ FIN
          JMP SALTO
NUM_ENCONTRADO: MOV BX,CX
                MOV AL,6
                INT 7 
                JMP OTRO_NUM
CONTADOR: INC CANTIDAD
          CMP CANTIDAD,2H
          JZ FIN
          JMP continuar
            
FIN: INT 0
END
