// Incluimos librerias
#include <stdio.h>
#include <math.h>
#include "mylib.h"

#define INITIAL_STATE 42374813



// **************************** MAIN *****************************
void main(void){
    board_t actualBoard;
    board_t futureBoard;

    setupBoard(&actualBoard);
    printf("First State:\n");
    printBoard(&actualBoard);

    updateBoard(&actualBoard, &futureBoard);
    printf("Second State:\n");
    actualBoard = futureBoard;
    printBoard(&actualBoard);



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
      futureBoard->num[i] = bin2dec(actualBoard->value[i]); //After updating the bit fields, we also update the uint8_t value.
    }
}

_Bool isAlive(board_t* board, uint8_t x, uint8_t y){
    _Bool outputState = 0;

    uint8_t neighbors_count = 0;


    for (uint8_t i = 0 ; i < 3; i++){
        for (uint8_t j = 0 ; j < 3; j++){
            if (i != j){    // I check all the neighbors excepting the actual point

            }
        }
    }

    if (neighbors_count >= 2 && neighbors_count <= 3){
        // Comfortable state
        outputState = 1;
    }

    outputState = checkBorder(x+2);


    return outputState;
}

uint8_t checkBorder(uint8_t index){
    uint8_t output = index;

    if (index < 0){
        output = 1;
    }else if (index > 7){
        output = 1;
    }else{ // index = 0
        output = 0;
    }

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
    for(char i = 7; i >= 0; i--){
      if((input & (1 << i))){
        output[i] = 1;
      }else{
        output[i] = 0;
      }
    }
}

uint8_t bin2dec(_Bool* input){
    uint8_t output = 0;
    for(char i = 7; i >= 0; i--){
      if(input[i]){
        output += pow(2, i);
      }
    }
    return output;
}

void printBoard(board_t* board){
  for(char i = 0; i < 8; i++){
    //printf("board[%d]: %d -> ", i, board->num[i]);
    for(char j = 7; j >= 0; j--){
      printf("%d", board->value[i][j]);
    }
    printf("\n");
  }
}
