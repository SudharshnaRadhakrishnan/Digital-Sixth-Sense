#include <stdio.h>
#include <inttypes.h>
#include "drivers/mss_ace/mss_ace.h"
#include "drivers/mss_gpio/mss_gpio.h"
#include "tfmini.h"
#include "motor_control.h"
#include "drivers/mss_i2c/mss_i2c.h"
#include "motor_control.h"
#include <stdlib.h>
#include <assert.h>
#include <math.h>

uint32_t mode = 0; //MODE 0 = all on, MODE 1 = gradual


double logcalculator(int pow){
	return exp(pow) + 30;
}
int main()
{
	//Audio GPIO
	MSS_GPIO_init();
	MSS_GPIO_config(MSS_GPIO_1, MSS_GPIO_INPUT_MODE | MSS_GPIO_IRQ_EDGE_POSITIVE);

	//HE3600 GPIO
	MSS_GPIO_config(MSS_GPIO_2, MSS_GPIO_OUTPUT_MODE);
	MSS_GPIO_set_output(MSS_GPIO_2, 1);

	//Enables GPIO interrupt
	MSS_GPIO_enable_irq( MSS_GPIO_1);

	ACE_init();
    /* DAC initialization */
    ACE_configure_sdd(
    	SDD1_OUT,
    	SDD_16_BITS,
    	SDD_VOLTAGE_MODE | SDD_RETURN_TO_ZERO,
    	INDIVIDUAL_UPDATE
    );
    ACE_enable_sdd(SDD1_OUT);

    uint32_t normVal = 2000;
    uint32_t outSig = 65536;
    uint32_t sigSw = 0;
    uint32_t counter = 0;

    int distance = 1000;

    uint32_t measure_counter = 0;

	MSS_I2C_init( &g_mss_i2c1, TCAADDR, MSS_I2C_PCLK_DIV_256 );
	uint8_t i = 0b11111111;
	tcaselect((uint8_t)0b00011111);
	init();
	selectLibrary(1);
	setMode(DRV2605_MODE_INTTRIG);
	setWaveform(1, 0);

    while(1) {
    	if(measure_counter == 20000){
    		//Lidar
			distance = measure();

			while(distance == -1){
				int count = 0;
				while(count < 20000){
					MSS_GPIO_set_output(MSS_GPIO_2, 0);
					++count;
				}
				MSS_GPIO_set_output(MSS_GPIO_2, 1);
				count = 0;
				while(count < 2500000){++count;}
				distance = measure();
			}


			int vibration_strength = 5;
			int power = 2;
			int level = -1;
			while(vibration_strength >= 0 && level == -1){
				if(distance < logcalculator(power)){
					level = vibration_strength;
				}
				vibration_strength--;
				power++;
			}
			//Select mode for vibration intensity
			if (mode == 0) {
				tcaselect((uint8_t)0b00011111);
				setWaveform(0, 69 - level);
				go();
			}

			if (mode == 1) {
				if (level == 0) {

				}
				else if (level == 1) {
					tcaselect((uint8_t)0b00000001);
					setWaveform(0, 64);
					go();
				}
				else if (level == 2) {
					tcaselect((uint8_t)0b00000011);
					setWaveform(0, 64);
					go();
				}
				else if (level == 3) {
					tcaselect((uint8_t)0b00000111);
					setWaveform(0, 64);
					go();
				}
				else if (level == 4) {
					tcaselect((uint8_t)0b00001111);
					setWaveform(0, 64);
					go();
				}
				else {
					tcaselect((uint8_t)0b00011111);
					setWaveform(0, 64);
					go();
				}

			}

			measure_counter = 0;
    	}

    	//Audio based on distance
    	if (counter >= distance * 40) {
    		if (sigSw == 0) {
    			outSig = 65536;
    			sigSw = 1;
    		}
    		else if (sigSw == 1) {
    			outSig = 0;
    			sigSw = 0;
    		}
    		ACE_set_sdd_value(SDD1_OUT, (uint32_t)(outSig>>4));
    		counter = 0;
        	if (normVal >= 6000) {
        		normVal = 2000;
        	}
        	else {
        		normVal++;
        	}
    	}

    	counter += 1;
    	measure_counter++;
    }
}

//Handler for changing modes with the button
//Creates audio when changing modes
void GPIO1_IRQHandler( void ) {
	uint32_t gpioOut = 65536;
	uint32_t sw = 0;
	uint32_t count = 0;
	uint32_t max = 500;
	uint32_t count2 = 0;

	while (count2 < 3000000) {
		if (count == max) {
			if (sw == 0) {
				gpioOut = 65536;
				sw = 1;
			}
			else if (sw == 1) {
				gpioOut = 0;
				sw = 0;
			}
			ACE_set_sdd_value(SDD1_OUT, (uint32_t)(gpioOut>>4));
			count = 0;
		}
		count += 1;
		count2 += 1;
	}
	mode = mode ^ 1;
	MSS_GPIO_clear_irq( MSS_GPIO_1 );
}
