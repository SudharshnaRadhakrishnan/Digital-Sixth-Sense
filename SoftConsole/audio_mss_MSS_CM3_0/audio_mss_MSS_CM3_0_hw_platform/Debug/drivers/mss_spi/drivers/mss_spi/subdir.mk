################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/mss_spi/drivers/mss_spi/mss_spi.c 

OBJS += \
./drivers/mss_spi/drivers/mss_spi/mss_spi.o 

C_DEPS += \
./drivers/mss_spi/drivers/mss_spi/mss_spi.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/mss_spi/drivers/mss_spi/%.o: ../drivers/mss_spi/drivers/mss_spi/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\CMSIS -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\CMSIS\startup_gcc -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers\mss_ace -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers\mss_gpio -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers\mss_nvm -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers\mss_nvm\drivers -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers\mss_nvm\drivers\F2DSS_NVM -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers\mss_pdma -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers\mss_rtc -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers\mss_rtc\drivers -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers\mss_rtc\drivers\mss_rtc -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers\mss_timer -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers_config -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\drivers_config\mss_ace -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\hal -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\hal\CortexM3 -IC:\Users\aybasha\Downloads\DigitalSixthSenseUpdate\SoftConsole\audio_mss_MSS_CM3_0\audio_mss_MSS_CM3_0_hw_platform\hal\CortexM3\GNU -O0 -ffunction-sections -fdata-sections -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


