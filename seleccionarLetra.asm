;Escribir un programa que permita seleccionar una letra del abecedario al azar. El código de la letra debe generarse en un
;registro que incremente su valor desde el código de A hasta el de Z continuamente. La letra debe quedar seleccionada al
;presionarse la tecla F10 y debe mostrarse de inmediato en la pantalla de comandos.


PIC EQU 20H
EOI EQU 20H
F10 EQU 10

ORG 1000H
LETRA DB ?

ORG 3000H
SELECCIONAR: INC DL
MOV AL,20H
OUT 20H,AL

MOV BX,OFFSET LETRA
MOV AL,1
INT 7
IRET


ORG 2000H
;ID
MOV AX,SELECCIONAR
MOV BX,40
MOV [BX],AX
;PIC
CLI
MOV AL, 11111110B
OUT 21h, AL ; PIC: registro IMR
MOV AL, F10
OUT 24H, AL ; PIC: registro INT0
MOV DX, 0
STI

REINICIO:  MOV CX,40H
CONTINUAR: INC CX
MOV LETRA,CL
CMP CX,5AH
JZ REINICIO
JMP CONTINUAR
INT 0
END
