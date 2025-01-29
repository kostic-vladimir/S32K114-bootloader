################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Clocks/clocks_and_modes.c 

OBJS += \
./src/Clocks/clocks_and_modes.o 

C_DEPS += \
./src/Clocks/clocks_and_modes.d 


# Each subdirectory must supply rules for building sources it contributes
src/Clocks/%.o: ../src/Clocks/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@src/Clocks/clocks_and_modes.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


