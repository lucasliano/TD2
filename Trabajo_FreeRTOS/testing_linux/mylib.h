// --------------- Variable definitions ---------------
typedef unsigned char uint8_t;
typedef unsigned int uint32_t;

typedef struct board_t
{
    uint8_t num[8];
    _Bool value[8][8];
} board_t;

// --------------- Function definitions ---------------
void setupBoard(board_t*);
void updateBoard(board_t* , board_t* );
_Bool isAlive(board_t* , uint8_t , uint8_t );
uint8_t checkBorder(char );


// --------------- Small Function ---------------
void  generateLine(uint8_t, _Bool*);
uint32_t xor32(void);
void printLine(uint8_t);
void printBoard(board_t* );
uint8_t bin2dec(_Bool* );
