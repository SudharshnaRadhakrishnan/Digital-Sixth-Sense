#include "drivers/mss_i2c/mss_i2c.h"
#include "motor_control.h"
#include<stdlib.h>
#include<stdio.h>
#include<assert.h>

uint8_t readRegister8(uint8_t reg){
	uint8_t status;
	uint8_t buffer[1] = {reg};
	MSS_I2C_write( &g_mss_i2c1, DRV2605_ADDR, buffer, 1, MSS_I2C_RELEASE_BUS );
	status = MSS_I2C_wait_complete( &g_mss_i2c1, MSS_I2C_NO_TIMEOUT );
	uint8_t ret[1];
	MSS_I2C_read( &g_mss_i2c1, DRV2605_ADDR, ret, 1, MSS_I2C_RELEASE_BUS );
	status = MSS_I2C_wait_complete( &g_mss_i2c1, MSS_I2C_NO_TIMEOUT );
	return *ret;
}


void writeRegister8(uint8_t reg, uint8_t val){
	uint8_t status;
	uint8_t buffer[2] = {reg, val};
	MSS_I2C_write( &g_mss_i2c1, DRV2605_ADDR, buffer, 2, MSS_I2C_RELEASE_BUS );
	status = MSS_I2C_wait_complete( &g_mss_i2c1, MSS_I2C_NO_TIMEOUT );
}

void tcaselect(uint8_t i) {
	uint8_t buffer[1] = {i};
	MSS_I2C_write( &g_mss_i2c1, TCAADDR, buffer, 1, MSS_I2C_RELEASE_BUS );
	MSS_I2C_wait_complete(&g_mss_i2c1, MSS_I2C_NO_TIMEOUT);
}

int init() {
  writeRegister8(DRV2605_REG_MODE, 0x00); // out of standby
  writeRegister8(DRV2605_REG_RTPIN, 0x00); // no real-time-playback
  writeRegister8(DRV2605_REG_WAVESEQ1, 1); // strong click
  writeRegister8(DRV2605_REG_WAVESEQ2, 0); // end sequence
  writeRegister8(DRV2605_REG_OVERDRIVE, 0); // no overdrive
  writeRegister8(DRV2605_REG_SUSTAINPOS, 0);
  writeRegister8(DRV2605_REG_SUSTAINNEG, 0);
  writeRegister8(DRV2605_REG_BREAK, 0);
  writeRegister8(DRV2605_REG_AUDIOMAX, 0x64);

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
  @param mode Mode value
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

