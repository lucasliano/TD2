# Assignment on Assembler

<!-- ABOUT THE PROJECT -->
## About The Project

This is a project done all by myself in assembler using the MAX7219. The purpose of this project is to learn how to code in assembler. I will be using a STM32F103C8 $\mu$C to do this.



### Built With

* [STM32 Cube IDE](https://www.st.com/en/development-tools/stm32cubeide.html)
* [8x8 Led Matrix based on MAX7219](https://articulo.mercadolibre.com.ar/MLA-743000876-modulo-matriz-de-puntos-8x8-max7219-todomicro-garantia-_JM)



<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

You will need to install the [STM32 Cube IDE](https://www.st.com/en/development-tools/stm32cubeide.html).


### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/lucasliano/TD2.git
   ```
2. Open the STM32 Cube IDE and open the project. Finally you just need to hit _run_.
3. Enjoy!

---

# To Do List:

* [ ] Ver cómo funciona SPI
* [ ] Determinar si vamos a utilizar interrupciones o no
* [ ] Ver cómo funciona el MAX7219

* [ ] Código
  * [ ] Inicialización
    * [ ] SPI
    * [ ] GPIO
    * [ ] SYSTICK?
  * [ ] FSM

* [ ] Debug
* [ ] Test?
* [ ] Agregar video

# Documentación Utilizada momentaneamente

## Links utiles

* [User Manual - STM32F103C8](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwj5i46h2M_wAhX1ILkGHfiEDq4QFjAAegQIBhAD&url=https%3A%2F%2Fwww.st.com%2Fresource%2Fen%2Freference_manual%2Fcd00171190-stm32f101xx-stm32f102xx-stm32f103xx-stm32f105xx-and-stm32f107xx-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf&usg=AOvVaw2kF0T1D3TzsgvgnX7fvMku)

* [Datasheet - MAX7219](https://datasheets.maximintegrated.com/en/ds/MAX7219-MAX7221.pdf)

* [The Cortex-M3 instruction set](https://ic.unicamp.br/~celio/mc404-s2-2015/docs/manual-detalhado-instrucoes-cortex-m3.pdf)

* [Blue Pill Pinout](https://i.pinimg.com/originals/d4/c9/c1/d4c9c1d4e8f6274648f2c635bc814c1f.jpg)




## SPI

#### Configuring the SPI in master mode
In the master configuration, the serial clock is generated on the SCK pin.
Procedure
1. Select the BR[2:0] bits to define the serial clock baud rate (see SPI_CR1 register).
2. Select the CPOL and CPHA bits to define one of the four relationships between the data transfer and the serial clock (see Figure 240).
3. Set the DFF bit to define 8- or 16-bit data frame format
4. Configure the LSBFIRST bit in the SPI_CR1 register to define the frame format.
5. If the NSS pin is required in input mode, in hardware mode, connect the NSS pin to a high-level signal during the complete byte transmit sequence. In NSS software mode, set the SSM and SSI bits in the SPI_CR1 register. If the NSS pin is required in output mode, the SSOE bit only should be set.
6. The MSTR and SPE bits must be set (they remain set only if the NSS pin is connected to a high-level signal).
In this configuration the MOSI pin is a data output and the MISO pin is a data input.

#### Transmit sequence
The transmit sequence begins when a byte is written in the Tx Buffer.

The data byte is parallel-loaded into the shift register (from the internal bus) during the first bit transmission and then shifted out serially to the MOSI pin MSB first or LSB first depending on the LSBFIRST bit in the SPI_CR1 register. The TXE flag is set on the transfer of data from the Tx Buffer to the shift register and an interrupt is generated if the TXEIE bit in the SPI_CR2 register is set.

#### Receive sequence
For the receiver, when data transfer is complete:

- The data in the shift register is transferred to the RX Buffer and the RXNE flag is set
- An interrupt is generated if the RXNEIE bit is set in the SPI_CR2 register

At the last sampling clock edge the RXNE bit is set, a copy of the data byte received in the shift register is moved to the Rx buffer. When the SPI_DR register is read, the SPI peripheral returns this buffered value.

Clearing the RXNE bit is performed by reading the SPI_DR register.

A continuous transmit stream can be maintained if the next data to be transmitted is put in the Tx buffer once the transmission is started. Note that TXE flag should be ‘1 before any attempt to write the Tx buffer is made.

_Note: When a master is communicating with SPI slaves which need to be de-selected between transmissions, the NSS pin must be configured as GPIO or another GPIO must be used and toggled by software._

## Extra Notes

- NSS output enabled (SSM = 0, SSOE = 1)
- CPHA = 1 & CPOL = 1 (first clk MSB & rising edge) 10Mhz max
- LSBFIRST = 1 (LSB primero)
- 0x4001 3000 - 0x4001 33FF SPI1 (SPI_CR1)
