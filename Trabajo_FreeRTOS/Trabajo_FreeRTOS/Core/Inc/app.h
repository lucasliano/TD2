/*
 * app.h
 *
 *  Created on: Jun 29, 2021
 *      Author: lucas
 */

#ifndef INC_APP_H_
#define INC_APP_H_


// --------------- Variable definitions ---------------
typedef struct board_t
{
    uint8_t num[8];
    uint8_t value[8][8];
} board_t;

typedef struct datos_t
{
	board_t* board;
	xSemaphoreHandle* mutex;
} datos_t;


// --------------- Tasks Definition ------------------
void checkStatusTask(void *params);
void updateBoardTask(void *params);

// --------------- Function definitions ---------------
void checkStatus(board_t*);
void generateBoard(board_t*);
void updateBoard(board_t* , board_t* );
uint8_t isAlive(board_t* , uint8_t , uint8_t );
uint8_t checkBorder(int8_t );


// --------------- Small Function ---------------
void  generateLine(uint8_t, uint8_t*);
uint32_t xor32(void);
void printLine(uint8_t);
void clearBoard(board_t* );
uint8_t bin2dec(uint8_t* );


#endif /* INC_APP_H_ */
