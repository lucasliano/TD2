# Assignment on Assembler

<!-- ABOUT THE PROJECT -->
## About The Project

This is a project done all by myself in assembly language using the MAX7219. The purpose of this project is to learn how to code in assembler. I will be using a STM32F103C8 $\mu$C to do this.

You will need to download and import the _project.zip_ file to run this code. The _main.s_ file is essentially the whole project.

<p align="center">
  <a href="https://github.com/lucasliano/TD2">
    <img src="https://user-images.githubusercontent.com/49002137/119297536-8a9e9480-bc31-11eb-8a0c-99f61838c29d.gif">
  </a>
</p>


### Built With

* [STM32 Blue Pill](https://stm32-base.org/boards/STM32F103C8T6-Blue-Pill.html)
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

# Planification:

* [x] Ver cómo funciona SPI
* [x] Ver cómo funciona el MAX7219

* [x] Código
  * [x] Inicialización
    * [x] SPI
    * [x] GPIO
    * [x] MAX7219
  * [x] FSM

* [x] Debug
* [x] Agregar video

## Useful Links

* [User Manual - STM32F103C8](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwj5i46h2M_wAhX1ILkGHfiEDq4QFjAAegQIBhAD&url=https%3A%2F%2Fwww.st.com%2Fresource%2Fen%2Freference_manual%2Fcd00171190-stm32f101xx-stm32f102xx-stm32f103xx-stm32f105xx-and-stm32f107xx-advanced-arm-based-32-bit-mcus-stmicroelectronics.pdf&usg=AOvVaw2kF0T1D3TzsgvgnX7fvMku)

* [Datasheet - MAX7219](https://datasheets.maximintegrated.com/en/ds/MAX7219-MAX7221.pdf)

* [The Cortex-M3 instruction set](https://ic.unicamp.br/~celio/mc404-s2-2015/docs/manual-detalhado-instrucoes-cortex-m3.pdf)

* [Blue Pill Pinout](https://i.pinimg.com/originals/d4/c9/c1/d4c9c1d4e8f6274648f2c635bc814c1f.jpg)
