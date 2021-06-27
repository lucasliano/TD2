// Incluimos librerias
#include <stdio.h>
#include <math.h>
#include "mylib.h"

#include <unistd.h>

#define INITIAL_STATE 42374813  // Es mi DNI
#define TIME_SLEEP 250000

// **************************** MAIN *****************************
void main(void){
    board_t actualBoard;
    board_t futureBoard;

    setupBoard(&actualBoard);
    printf("First State:\n");
    printBoard(&actualBoard);

    char exit = 1;
    uint32_t iteration = 1;
    while(exit){
        updateBoard(&actualBoard, &futureBoard);
        printf("i:%d\n",++iteration);
        actualBoard = futureBoard;
        printBoard(&actualBoard);

        exit = 0;
        for (uint8_t i = 0 ; i < 8; i++){
          if(actualBoard.num[i] != 0){
              exit = 1;
              i = 8;
          }
        }
        usleep(TIME_SLEEP);
    }
}


// ======================= Important functions =======================
void setupBoard(board_t* board){
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


    for (char i = -1 ; i <= 1; i++){
        neiY = checkBorder(y + i);
        for (char j = -1 ; j <= 1; j++){
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

uint8_t checkBorder(char index){
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

void generateLine(uint8_t input, _Bool* output){
    for(char i = 8-1; i >= 0; i--){
      if((input & (1 << i))){
        output[i] = 1;
      }else{
        output[i] = 0;
      }
    }
}

uint8_t bin2dec(_Bool* input){
    uint8_t output = 0;
    for(char i = 8-1; i >= 0; i--){
      if(input[i]){
        output += pow(2, i);
      }
    }
    return output;
}

void printBoard(board_t* board){
  for(char i = 0; i < 8; i++){
    for(char j = 8-1; j >= 0; j--){
        if (board->value[i][j]){
            printf("█");
        }else{
            printf("░");
        }
    }
    printf("\n");
  }
}
