/*
 * app.c
 *
 *  Created on: Jun 28, 2021
 *      Author: lucas
 */

#include "main.h"

#define INITIAL_STATE 42374813  // Es mi DNI


// ======================= Important functions =======================
void checkStatus(board_t* board){
	uint8_t isAlive = 0;
	for (uint8_t i = 0; i < 8; i++){
		if (board->num[i] != 0){
			isAlive = 1;
		}
	}

	if(!isAlive){
		generateBoard(board);
	}
}


void generateBoard(board_t* board){
    uint8_t boardLine = 0;
    for (uint8_t i = 0 ; i < 8; i++){
      boardLine = (uint8_t) xor32();
      board->num[i] = boardLine;
      generateLine(boardLine, board->value[i]);
    }

}

void updateBoard(board_t* actualBoard, board_t* futureBoard){
    for (uint8_t i = 0 ; i < 8; i++){
      for (uint8_t j = 0 ; j < 8; j++){
         // Acá estamos loopeando por cada pixel.
         futureBoard->value[i][j] = isAlive(actualBoard, i, j);
      }
      futureBoard->num[i] = bin2dec(futureBoard->value[i]); //After updating the bit fields, we also update the uint8_t value.
    }
}

_Bool isAlive(board_t* board, uint8_t y, uint8_t x){
    _Bool outputState = 0;
    uint8_t neighbors_count = 0;
    uint8_t neiY;
    uint8_t neiX;
    int8_t i;
    int8_t j;

    for (i = -1 ; i <= 1; i++){
        neiY = checkBorder(y + i);
        for (j = -1 ; j <= 1; j++){
            neiX = checkBorder(x + j);
            if (i != 0 || j != 0){    // I check all the neighbors excepting the actual pixel
                neighbors_count += board->value[neiY][neiX];
            }
        }
    }

    if (neighbors_count == 3){
        // Se reproduce o se mantiene
        outputState = 1;
    }else if (neighbors_count == 2 && board->value[y][x] == 1){
        // Si está viva, sigue viva
        outputState = 1;
    }

    return outputState;
}

uint8_t checkBorder(int8_t index){
    uint8_t output = index;

    if (index < 0){
        output = 8-1;
    }else if (index > 8-1){
        output = 0;
    } // else : output = index
    return output;
}

// ======================= Small - functions =======================
uint32_t xor32(void){
	static uint32_t y = INITIAL_STATE;
	y^= y<<13;
	y^= y>>17;
	y^= y<<5;
	return y;
}

void clearBoard(board_t* board){
	for (uint8_t i = 0 ; i < 8; i++){
	      board->num[i] = 0;
	      generateLine(0, board->value[i]);
	    }
}

void generateLine(uint8_t input, uint8_t* output){
	int8_t i;
    for(i = 8-1; i >= 0; i--){
      if((input & (1 << i))){
        output[i] = 1;
      }else{
        output[i] = 0;
      }
    }
}

uint8_t bin2dec(uint8_t* input){
    uint8_t output = 0;
    for(int8_t i = 8-1; i >= 0; i--){
      if(input[i]){
        output += pow(2, i);
      }
    }
    return output;
}

