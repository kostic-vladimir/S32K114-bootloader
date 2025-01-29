################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/LPIT/LPIT.c 

OBJS += \
./src/LPIT/LPIT.o 

C_DEPS += \
./src/LPIT/LPIT.d 


# Each subdirectory must supply rules for building sources it contributes
src/LPIT/%.o: ../src/LPIT/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@src/LPIT/LPIT.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


