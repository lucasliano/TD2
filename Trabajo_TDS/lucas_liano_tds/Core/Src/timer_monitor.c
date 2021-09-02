#include "stm32f1xx_hal.h"
#include <stdint.h>
void inic_timer(uint32_t divisor_us)
{
	/*
	 * Uso el timer 2 para el monitor del sistema.
	 */
	RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;
	/*
	 * Esta línea configura el prescaler del timer
	 * que cuenta tiempo del procesador. Prestar atención.
	 */
	TIM2->PSC = (SystemCoreClock / (1000000*divisor_us)) - 1;	//LLamo cada 1us
	TIM2->CNT = -1;
	TIM2->CR1 |= TIM_CR1_CEN;
	TIM2->CR1 &= ~TIM_CR1_CEN;
}

void init_timer_sandwich(void){
	// ACÁ SE AGREGA EL TIMER 3 PARA SANDWICH
	RCC->APB1ENR |= RCC_APB1ENR_TIM3EN;
	//SANDWICH
	TIM3->PSC = (SystemCoreClock / (1000000)) - 1;	//LLamo cada 1us
	TIM3->CNT = -1;
	TIM3->CR1 |= TIM_CR1_CEN;
	TIM3->CR1 &= ~TIM_CR1_CEN;
}

void start_timer(void)
{
	TIM2->CNT = 0;
	TIM2->CR1 |= TIM_CR1_CEN;
}

uint32_t stop_timer(void)
{
	uint32_t ret = TIM2->CNT;
	TIM2->CR1 &= ~TIM_CR1_CEN; //Bajo el enable
	return ret;
}

void start_sandwich(){
	TIM3->CNT = 0;
	TIM3->CR1 |= TIM_CR1_CEN;
}

uint8_t stop_sandwich(uint32_t demora)  //demora en us
{
	uint8_t ret=0;
	uint32_t timer=TIM3->CNT;
	if(timer>=demora){
		TIM3->CR1 &= ~TIM_CR1_CEN; //Bajo el enable
		ret=1;
	}
	return ret;
}

