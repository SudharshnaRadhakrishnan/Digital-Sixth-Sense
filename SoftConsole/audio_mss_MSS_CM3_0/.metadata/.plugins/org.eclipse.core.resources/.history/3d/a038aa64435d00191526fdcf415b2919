// LINK TO GITHUB ARDUINO CODE: https://github.com/adafruit/Adafruit_DRV2605_Library
// NEED TO PORT ARDUINO CODE, motor_control.h has the functions arduino implements, may not need all of them

#include "drivers/mss_i2c/mss_i2c.h"
#include "motor_control.h"
#include<stdlib.h>
#include<stdio.h>
#include<assert.h>
//int main()
//{
//    MSS_I2C_init( &g_mss_i2c0, MOTOR_CONTROL_ADDR, MSS_I2C_PCLK_DIV_256 );
//
//    uint8_t setup_buffer[3] = {1, 2, 7};
//
//    MSS_I2C_write( &g_mss_i2c1, TFMINI_ADDR, setup_buffer,
//					sizeof(setup_buffer), MSS_I2C_RELEASE_BUS );
//
//    uint8_t status = MSS_I2C_wait_complete( &g_mss_i2c1, MSS_I2C_NO_TIMEOUT );
//
//
//    printf("d", status);
//}

uint8_t readRegister8(uint8_t reg){
	uint8_t status;
	MSS_I2C_write( &g_mss_i2c1, DRV2605_ADDR, &reg, 1,
	                      MSS_I2C_RELEASE_BUS );
	status = MSS_I2C_wait_complete( &g_mss_i2c1, MSS_I2C_NO_TIMEOUT );
	assert(status == 0);
	uint8_t ret[1];
	MSS_I2C_read( &g_mss_i2c1, DRV2605_ADDR, ret, 1, MSS_I2C_RELEASE_BUS );
	status = MSS_I2C_wait_complete( &g_mss_i2c1, MSS_I2C_NO_TIMEOUT );
	assert(status == 0);
	return *ret;
}


void writeRegister8(uint8_t reg, uint8_t val){
	uint8_t status;
	uint8_t buffer[2] = {reg, val};
	MSS_I2C_write( &g_mss_i2c1, DRV2605_ADDR, buffer, 2, MSS_I2C_RELEASE_BUS );
	status = MSS_I2C_wait_complete( &g_mss_i2c1, MSS_I2C_NO_TIMEOUT );
	assert(status == 0);
}

int init() {
  //uint8_t id = readRegister8(DRV2605_REG_STATUS);
  //Serial.print("Status 0x"); Serial.println(id, HEX);

  writeRegister8(DRV2605_REG_MODE, 0x00); // out of standby

  writeRegister8(DRV2605_REG_RTPIN, 0x00); // no real-time-playback

  writeRegister8(DRV2605_REG_WAVESEQ1, 1); // strong click
  writeRegister8(DRV2605_REG_WAVESEQ2, 0); // end sequence

  writeRegister8(DRV2605_REG_OVERDRIVE, 0); // no overdrive

  writeRegister8(DRV2605_REG_SUSTAINPOS, 0);
  writeRegister8(DRV2605_REG_SUSTAINNEG, 0);
  writeRegister8(DRV2605_REG_BREAK, 0);
  writeRegister8(DRV2605_REG_AUDIOMAX, 0x64);

  // ERM open loop

  // turn off N_ERM_LRA
  writeRegister8(DRV2605_REG_FEEDBACK, readRegister8(DRV2605_REG_FEEDBACK) & 0x7F);
  // turn on ERM_OPEN_LOOP
  uint8_t val = readRegister8(DRV2605_REG_CONTROL3) | 0x20;
  writeRegister8(DRV2605_REG_CONTROL3, val);

  return 1;
}

void setWaveform(uint8_t slot, uint8_t w) {
  writeRegister8(DRV2605_REG_WAVESEQ1+slot, w);
}

void selectLibrary(uint8_t lib) {
  writeRegister8(DRV2605_REG_LIBRARY, lib);
}

/**************************************************************************/
/*!
  @brief Start playback of the waveforms (start moving!).
*/
/**************************************************************************/
void go() {
  writeRegister8(DRV2605_REG_GO, 1);
}

/**************************************************************************/
/*!
  @brief Stop playback.
*/
/**************************************************************************/
void stop() {
  writeRegister8(DRV2605_REG_GO, 0);
}

/**************************************************************************/
/*!
  @brief Set the device mode.
  @param mode Mode value, see datasheet section 7.6.2: http://www.adafruit.com/datasheets/DRV2605.pdf
    0: Internal trigger, call go() to start playback\n
    1: External trigger, rising edge on IN pin starts playback\n
    2: External trigger, playback follows the state of IN pin\n
    3: PWM/analog input\n
    4: Audio\n
    5: Real-time playback\n
    6: Diagnostics\n
    7: Auto calibration
*/
/**************************************************************************/
void setMode(uint8_t mode) {
  writeRegister8(DRV2605_REG_MODE, mode);
}

/**************************************************************************/
/*!
  @brief Set the realtime value when in RTP mode, used to directly drive the haptic motor.
  @param rtp 8-bit drive value.
*/
/**************************************************************************/
void setRealtimeValue(uint8_t rtp) {
  writeRegister8(DRV2605_REG_RTPIN, rtp);
}

/**************************************************************************/
/*!
  @brief Use ERM (Eccentric Rotating Mass) mode.
*/
/**************************************************************************/
void useERM () {
  writeRegister8(DRV2605_REG_FEEDBACK, readRegister8(DRV2605_REG_FEEDBACK) & 0x7F);
}

/**************************************************************************/
/*!
  @brief Use LRA (Linear Resonance Actuator) mode.
*/
/**************************************************************************/
void useLRA () {
  writeRegister8(DRV2605_REG_FEEDBACK, readRegister8(DRV2605_REG_FEEDBACK) | 0x80);
}

//int main(){
//	// set the effect to play
//	  MSS_I2C_init( &g_mss_i2c1, DRV2605_ADDR, MSS_I2C_PCLK_DIV_256 );
//
//	  init();
//	 // useERM();
//	  selectLibrary(1);
//
//	  // I2C trigger by sending 'go' command
//	  // default, internal trigger when sending GO command
//	  setMode(DRV2605_MODE_INTTRIG);
//
//	  setWaveform(0, 69);
//	  setWaveform(1, 68);
//	  setWaveform(2, 67);
//	  setWaveform(3, 66);
//	  setWaveform(4, 65);
//	  setWaveform(5, 64); // play effect
//	  setWaveform(6, 0);       // end waveform
//
//	  // play the effect!
//	  while(1){
//		  //uint8_t standby = readRegister8(DRV2605_REG_MODE);
//		  go();
//		  //delay(1000);
//	  }
//	  return 0;
//}


