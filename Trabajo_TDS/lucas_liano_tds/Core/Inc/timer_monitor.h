/*
 * timer_monitor.h
 *
 *  Created on: Jul 1, 2020
 *      Author: esala
 */

#ifndef INC_TIMER_MONITOR_H_
#define INC_TIMER_MONITOR_H_
	#include <stdint.h>
	void inic_timer(uint32_t divisor_us);
	void start_timer(void);
	uint32_t stop_timer(void);
	void init_timer_sandwich(void);
	void start_sandwich(void);
	uint8_t stop_sandwich(uint32_t);

#endif /* INC_TIMER_MONITOR_H_ */
