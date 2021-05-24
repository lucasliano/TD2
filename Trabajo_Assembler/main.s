		.syntax		unified
		.cpu		cortex-m3
		.thumb

//======= DIRECCIONES DE MEMORIA ========
//--- RCC 		-> 0x4002 1000
.equ RCC_APB2ENR, 	0x40021018	// Registros para habilitar el clock de perifericos

//--- GPIOs ---
// Port A 		-> 0x4001 0800
.equ GPIOA_CRL, 	0x40010800	// Puerto GPIOA		-- Offset = 0x00
.equ PORTA_ODR,		0x4001080C	// GPIOA ODR 		-- Offset = 0x0C
.equ PORTA_BSRR,	0x40010810	// GPIOA BSSR 		-- Offset = 0x10

//-- SPI_CR1 	-> 0x4001 3000
.equ SPI_CR1,		0x40013000	// SPI_CR1			-- Offset = 0x00
.equ SPI_CR2,		0x40013004	// SPI_CR2			-- Offset = 0x04
.equ SPI_SR,		0x40013008	// SPI_SR			-- Offset = 0x08
.equ SPI_DR,		0x4001300C	// SPI_DR			-- Offset = 0x0C



//======= Constantes Genericas ==========
.equ LOOP_COMPARE, 	0x8FFFF		// Demora por software.
.equ STATE_1,		0x0			// Estado FSM correspondiente al frame 1 (es decir index = 0)
.equ STATE_MAX,		0x30		// Estado FSM correspondiente al último frame (es index = 6 * 8bytes)




		.section	.text
		.align		2
 		.global		main

/****************************************/
/*	Función main. Acá salta boot.s 		*/
/*	cuando termina.						*/
/*	main NO TIENE QUE TERMINAR NUNCA	*/
/****************************************/
		.type		main, %function
main:
		BL		RCC_init		//Inicializo el RCC
		BL		GPIOs_init		//Inicializo el pin como salida
		BL		SPI_init		//Inicializo el SPI1
		BL		MAX7219_init	//Inicializo el MAX7219
		LDR		R1,	=#STATE_1	//Almaceno en R1 el estado de la FSM

main_loop:


		// Matriz LEDS
		BL		FSM_Matrix

		//Demora
		LDR		R0,	=#LOOP_COMPARE
		BL		delay

		// Update state
		ADDS	R1, #8				// Incremento el estado en 8, porque ya leí el frame anterior
		CMP		R1, #STATE_MAX 		// Comparamos para ver si llegamos al limite superior
		BNE		main_loop			// Si no llegamos, volvemos a loopear

		// Si llegamos reiniciamos el estado
		LDR		R1,	=#STATE_1	//Almaceno en R1 el estado de la FSM

		//Volver a empezar...
		B		main_loop



/****************************************/
/*	Función FSM_Matrix. 			 	*/
/*	Se encarga de loopear los frames	*/
/****************************************/
		.type	FSM_Matrix, %function
FSM_Matrix:
		PUSH 	{R0, R1, LR}

		// Recordar que R1 tiene el estado

		LDR		R0,	=tabla_frames			//Pongo R2 a la dirección de la tabla

		ADDS	R0,	R1						//Me traigo la dirección del frame a R0 desde [tabla_frames + R1]

		// Ahora R0 tiene la dirección del primer valor que queremos escribir en SPI
		// Asi que vamos a tener que ir loopeando pero agarrando de a 1 valor.

		BL		TX_WORD

		// Return
		POP		{R0, R1, PC}


/****************************************/
/*	Función TX_WORD. 			 		*/
/*	Se encarga escribir 8 palabras.		*/
/*  Toma como puntero R0				*/
/****************************************/
		.type	TX_WORD, %function
TX_WORD:
		PUSH 	{R0, R1, R2, R3, LR}

		// R0 tiene la primer posición
		// Se que tengo que transmitir 8 palabras

		MOVS	R2, R0				//Me guardo la tabla en R2
		MOVS	R3, 0x0				// Cargo el limite inferior del loop

otro_loop:

		MOVS	R0, R3				// Cargamos el addr en R0 (Direccion del digito del MAX7219)
		ADDS	R0, #1				// D0 (0x1) a D7(0x8)

		//Ahora cargamos el dato
		LDRB	R1, [R2, R3]		// Me traigo el valor byte a R1 desde [R2+R3]

		// En este momento R0 tiene el Addr y R1 el dato
		BL		Generate_TxData		// Generamos el dato a transmitir
		BL		SPI_tx				// Lo envío


		ADDS	R3, #1				// incremento tics_led en casa
		CMP		R3, #7				// Comparamos para ver si llegamos al limite superior
		BNE		otro_loop			// Si no llegamos, volvemos a loopear

		// Return
		POP		{R0, R1, R2, R3, PC}

/****************************************/
/*	Función RCC_init. 			 	    */
/*	Inicializa las señales de CLK 		*/
/****************************************/
		.type	RCC_init, %function
RCC_init:
		PUSH 	{R0, R1, LR}


		// Habilito la señal de reloj para GPIO A y C
		LDR		R0, =(0b1 << 2)   // Cargo en R0 los bits que me habilita el GPIO A

		// Habilito señal de reloj para SPI1
		ORRS 	R0, R0, (0b1 << 12)   	// Cargo en R1 el bit que me habilita el SPI1 (Tengo que hacer mascara)


		LDR 	R1, =#RCC_APB2ENR   // Cargo la dirección de memoria
		STR		R0, [R1]			// Guardo R1 en la direccion a la que apunta R2

		// Return
		POP		{R1, R2, PC}

/****************************************/
/*	Función GPIOs_init. 			 	*/
/*	Inicializa los GPIOA  	 			*/
/****************************************/
		.type	GPIOs_init, %function
GPIOs_init:
		PUSH	{R1, R2, LR}		// Mando a la pila los registros que modifico y LR
		// En este caso guardo LR para no tener que llamar a BX LR al final, y lo hago con el POP {.., PC}

		// Configuro los pines del GPIOA
		LDR		R1,	=#GPIOA_CRL			//Seteo los pines del PORTB
		LDR		R2,	=#0xFFFF0000		//Enmascaro A4, A5, A6, A7
		LDR		R0,	[R1]				//Leo GPIOA_CRL
		BICS	R0,	R2					//Enmascaro A7 - A4
		LDR		R2,	=#0xBBB30000		//Seteo A4 como GPIO PP, A5 y A7 como Alternate Output PP
		ORRS	R0,	R2					//y A6 como Alternate Input
		STR		R0,	[R1]				//Configuro los pines del SPI.


		// Return
		POP		{R1, R2, PC}

/****************************************/
/*	Función SPI_init. 				 	*/
/*	Inicializa el SPI1					*/
/****************************************/
		.type	SPI_init, %function
SPI_init:
		PUSH	{R0, R1, LR}		// Mando a la pila los registros que modifico y LR
		// LR lo guardo para poder llamar a otras funciones y no perder la direccion de retorno

		// Tenemos que escribir lo siguiente en el regisrto SPI_CR1
		/**
			CPHA = 0 (First edge is data)
			CPOL = 0 (Rising edge)
			MSTR = 1 (Master mode)
			BR = 2 (clk/8 = 9MHz)
			SPE = 1 (Enable SPI)
			LSBFIRST = 0 (MSB bit first)
			DFF = 1 (16 bit)
		**/

		// En parte esta tomado del ejemplo en C
		LDR		R0, =(0xb54)   		// Cargo en R0 los bits correspondientes a CPHA, CPOL, MSTR, BR, SPE, LSBFIRST y DFF
		LDR 	R1, =#SPI_CR1   	// Cargo la dirección de memoria
		STR		R0, [R1]			// Guardo R0 en la direccion a la que apunta R2


		// Ahora quiero poner cs a 1 para indicar que no estoy escribiendo
		BL		GPIOA_set

		// Return
		POP		{R0, R1, PC}



/********************************************/
/*	Función MAX7219_init		 	   	    */
/*	Inicializa el MAX2719 con los comandos  */
/********************************************/
		.type	MAX7219_init, %function
MAX7219_init:

		PUSH	{R0, R1, LR}

		//Demora*8
		LDR		R0,	=#LOOP_COMPARE*20
		BL		delay

		//Enciendo
		MOVS	R0,	#0x0C
		MOVS	R1,	#0x01
		BL		Generate_TxData
		BL		SPI_tx

		//Salgo de modoTest
		MOVS	R0,	#0x0F
		MOVS	R1,	#0x00
		BL		Generate_TxData
		BL		SPI_tx

		//Sin decodificar
		MOVS	R0,	#0x09
		MOVS	R1,	#0x00
		BL		Generate_TxData
		BL		SPI_tx

		//Muestro todas las lineas.
		MOVS	R0,	#0x0B
		MOVS	R1,	#0x07
		BL		Generate_TxData
		BL		SPI_tx

		//Intensidad
		MOVS	R0,	#0x0A
		MOVS	R1,	#0x01
		BL		Generate_TxData
		BL		SPI_tx

		// Return
		POP		{R0, R1, PC}




/*******************************************/
/*	Función SPI_tx. 				 	   */
/*	Escribe en el buffer de transmisión	   */
/*  El dato a escribir esta en R0		   */
/*******************************************/
		.type	SPI_tx, %function
SPI_tx:
		PUSH	{R0, R1, R2, LR}	// Mando a la pila todos los registros que modifico

		//Apago el A04
		BL		GPIOA_reset

		// Cargo buffer TX
		LDR 	R1, =#SPI_DR   		// Escribo la dirección del buffer TX
		STR 	R0, [R1]          	// Escribo el buffer

		# Leo el Flag BSY
		LDR		R1,=#SPI_SR
		LDR		R2,=#(1<<7)
spi_wait:
		LDR		R0,[R1]				// Espero que se termine
		ANDS	R0,R2				// Enmascaro con el bit de BSY
		CMP		R0,#0				// Si está en uno espero.
		BNE		spi_wait			// Vuelvo a spi_wait

		LDR		R1,=#SPI_DR			//
		LDR		R0,[R1]				// Leo el SPI para evitar errores de lectura

		//Enciendo el A04
		BL		GPIOA_set

		POP		{R0, R1, R2, PC}	// return

/*******************************************/
/*	Función Generate_TxData. 		 	   */
/*	Genera el dato a transmitir al MAX7219 */
/*  En R0 metemos el addr y en R1 el dato  */
/* ((R0 & 0x0F) << 8) | (R1 & 0xFF);       */
/*******************************************/
		.type	Generate_TxData, %function
Generate_TxData:
		// No mando a la pila porque no me interesa recordar los valores de R0 y R1 despues de la func.

		ANDS	R0, R0, (0x0F) 		// R0 = (R0 & 0x0F)
		LSLS	R0,	R0,	#8			// R0 << 8

		ANDS	R1, R1, (0xFF)		// R1 = (R1 & 0xFF)

		ORRS 	R0, R0, R1   		// R0 = ((R0 & 0x0F) << 8) | (R1 & 0xFF);

		MOVS	R1,#0				// R1   = 0x00

		// Al final de esta función R0 va a tener el dato a transmitir y R1 = 0
		BX		LR					// return


/****************************************/
/*	Función GPIOA_set. 				 	*/
/*	Setea el A04 						*/
/****************************************/
		.type	GPIOA_set, %function
GPIOA_set:
		PUSH	{R0, R1}		// Mando a la pila todos los registros que modifico
		LDR		R1,=#PORTA_BSRR			//Pongo en 1 CS
		LDR		R0,=#(1<<4)				//A4
		STR		R0,[R1]
		POP		{R0, R1}
		BX		LR					// return


/****************************************/
/*	Función GPIOA_reset. 				*/
/*	Resetea el A04 						*/
/****************************************/
		.type	GPIOA_reset, %function
GPIOA_reset:
		PUSH	{R0, R1}		// Mando a la pila todos los registros que modifico
		LDR		R1,=#PORTA_BSRR		//
		LDR		R0,=#(1<<20)		//
		STR		R0,[R1]				// Bajo A4
		POP		{R0, R1}
		BX		LR					// return


/****************************************/
/*	Función delay. 				 		*/
/*	Recibe por R0 la demora				*/
/****************************************/
		.type	delay, %function
delay:
		PUSH	{R0, LR}			// Guardo el parámetro y LR en la pila.
		// Guardo LR para poder llamar a funciones en el medio
delay_dec:
        SUBS	R0, 1				//
        BNE		delay_dec			// while(--R0);
		POP		{R0, PC}			// repongo R0 y vuelvo.




//========== Definimos los caracteres que vamos a utilizar en memoria del programa ===========
tabla_frames:
	# Frame 1 - Escribe una L - offset 0x0
	.byte	0x00	// D0 =>  '0000 0000'
	.byte	0x00	// D1 =>  '0000 0000'
	.byte	0x01	// D2 =>  '0000 0001'
	.byte	0x01	// D3 =>  '0000 0001'
	.byte	0x01	// D4 =>  '0000 0001'
	.byte	0xFF	// D5 =>  '1111 1111'
	.byte	0x00	// D6 =>  '0000 0000'
	.byte	0x00	// D7 =>  '0000 0000'
	# Frame 2 - Escribe una U - offset 0x08
	.byte	0x00	// D0 =>  '0000 0000'
	.byte	0x00	// D1 =>  '0000 0000'
	.byte	0xFF	// D2 =>  '1111 1111'
	.byte	0x01	// D3 =>  '0000 0001'
	.byte	0x01	// D4 =>  '0000 0001'
	.byte	0xFF	// D5 =>  '1111 1111'
	.byte	0x00	// D6 =>  '0000 0000'
	.byte	0x00	// D7 =>  '0000 0000'
	# Frame 3 - Escribe una C - offset 0x10
	.byte	0x00	// D0 =>  '0000 0000'
	.byte	0x00	// D1 =>  '0000 0000'
	.byte	0x81	// D2 =>  '1000 0001'
	.byte	0x81	// D3 =>  '1000 0001'
	.byte	0x81	// D4 =>  '1000 0001'
	.byte	0xFF	// D5 =>  '1111 1111'
	.byte	0x00	// D6 =>  '0000 0000'
	.byte	0x00	// D7 =>  '0000 0000'
	# Frame 4 - Escribe una A - offset 0x18
	.byte	0x00	// D0 =>  '0000 0000'
	.byte	0x00	// D1 =>  '0000 0000'
	.byte	0x7F	// D2 =>  '0111 1111'
	.byte	0x88	// D3 =>  '1000 1000'
	.byte	0x88	// D4 =>  '1000 1000'
	.byte	0x7F	// D5 =>  '0111 1111'
	.byte	0x00	// D6 =>  '0000 0000'
	.byte	0x00	// D7 =>  '0000 0000'
	# Frame 5 - Escribe una S - offset 0x20
	.byte	0x00	// D0 =>  '0000 0000'
	.byte	0x86	// D1 =>  '1000 0110'
	.byte	0x89	// D2 =>  '1000 1001'
	.byte	0x91	// D3 =>  '1001 0001'
	.byte	0x91	// D4 =>  '1001 0001'
	.byte	0x61	// D5 =>  '0110 0001'
	.byte	0x00	// D6 =>  '0000 0000'
	.byte	0x00	// D7 =>  '0000 0000'
	# Frame 6 - Limpia la pantalla - offset 0x28
	.byte	0x00	// D0 =>  '0000 0000'
	.byte	0x00	// D1 =>  '0000 0000'
	.byte	0x00	// D2 =>  '0000 0001'
	.byte	0x00	// D3 =>  '0000 0001'
	.byte	0x00	// D4 =>  '0000 0001'
	.byte	0x00	// D5 =>  '1111 1111'
	.byte	0x00	// D6 =>  '0000 0000'
	.byte	0x00	// D7 =>  '0000 0000'

.end
