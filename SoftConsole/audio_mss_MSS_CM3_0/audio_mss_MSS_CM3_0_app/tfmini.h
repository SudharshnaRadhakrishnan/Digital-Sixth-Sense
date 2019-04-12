#ifndef _TF_MINI_H_
#define _TF_MINI_H_

#include "drivers/mss_uart/mss_uart.h"

#define TFMINI_ADDR 0x10
#define MAX_MEASURMENT_ATTEMPTS 100
#define NUM_MOTORS 10

int measure();

#endif
