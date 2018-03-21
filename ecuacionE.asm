SYS_SALIDA equ 1
SYS_LEE equ 3
SYS_PRINT equ 4
STDIN equ 0
STDOUT equ 1

section .data

	mensaje db "EL RESULTADO DE LA INTEGRAL ES: "; Salto y retorno de carro
	len equ $- mensaje	; tamanyo de mensaje
	salto db "", 0x0A, 0x0D
	len2 equ $-salto

	; 4 + 3x - 3x^2

	segment .bss	; VARIABLES 
		numero1 resb 2
		numero2 resb 2
		numero3 resb 2
		resultado resb 1

section .text
	global _start
	_start: 

		;mov ecx, 0	; limite inferior
		;mov edx, 2	; limite superior
		; multiplicacion de 4*2

		mov eax, 4	; mover un 4 a registro eax
		mov [numero1], eax
		mov ebx, 2
		mov [numero2], ebx
		mov ecx, 3
		mov [numero3], ecx


		; MULTIPLICAR 4x (4 por 2)
		add eax, [numero1]	; eax se multiplica por 2
		add eax, '0'	; sumar 48 

		; MULTIPLICAR 3 POR 4 
		
		add ecx, [numero3]	; 3 + 3
		mov [numero3], ecx
		add ecx, ecx	; 6 + 6
		add ecx, '0'	; sumar 48 para el valor real

		; DIVIDIR ENTRE DE 2 o RESTAR LA MITAD
		sub ecx, [numero3]

		; MULTIPLICAR (2^3)
		add ebx, [numero2]	; 2 + 2
		mov [numero2], ebx	
		add ebx, [numero2]	; 4 + 4
		mov [numero2], ebx
		add ebx, '0'

		; SUMAR LOS 2 PRIMEROS VALORES
		add eax, ecx	
		sub eax, ebx

		; RESULTADO

		mov [resultado], eax	; guardar el resultado 


		; IMPRIMIR MENSAJE 1
		mov eax, SYS_PRINT
		mov ebx, STDOUT
		mov ecx, mensaje
		mov edx, len
		int 0x80

		; IMPRIMIR RESULTADO

		mov eax, SYS_PRINT
		mov ebx, STDOUT
		mov ecx, resultado
		mov edx, 1
		int 0x80

		; IMPRIMIR SALTO

		mov eax, SYS_PRINT
		mov ebx, STDOUT
		mov ecx, salto
		mov edx, len2
		int 0x80


	mov eax,1
	int 0x80; 
