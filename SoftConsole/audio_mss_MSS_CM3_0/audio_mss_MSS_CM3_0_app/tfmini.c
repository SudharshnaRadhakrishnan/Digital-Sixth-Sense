#include "tfmini.h"

double map(int input, int irange_start, int irange_end, double orange_start, double orange_end){
	 return orange_start + ((orange_end - orange_start) / (irange_end - irange_start)) * (input - irange_start);
}

int measure()
{
	int too_large = 0;
	int total_measurements = 0;

	MSS_UART_init
		     (
		         &g_mss_uart1,
		         MSS_UART_115200_BAUD,
		         MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT
		     );

	uint8_t setup_buffer[8] = {0x42, 0x57, 0x02, 0x00, 0x00, 0x00, 0x01, 0x06};

	int measurementAttempts = 0;

	while(measurementAttempts < MAX_MEASURMENT_ATTEMPTS){
		uint8_t rx_buff[9];

		// dummy reads
		while(MSS_UART_get_rx( &g_mss_uart1, rx_buff, sizeof(rx_buff) )){}

		MSS_UART_polled_tx( &g_mss_uart1, setup_buffer, sizeof(setup_buffer) );
		// actual read
		int rx_size = MSS_UART_get_rx( &g_mss_uart1, rx_buff, sizeof(rx_buff) );

		char ready0, ready1;
		ready0 = rx_buff[0];
		ready1 = rx_buff[1];

		// failed
		if(ready0 != 0x59 || ready1 != 0x59){
			++measurementAttempts;
		}
		else{
			uint16_t distance = (rx_buff[3] << 8) + rx_buff[2];
			//Extraneous values
			if(distance > 1000){
				++too_large;
			}
			else{
				return distance;
			}
			++total_measurements;
		}
	}
	//Fail state
	return -1;
}
