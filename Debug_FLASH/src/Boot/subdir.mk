################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Boot/Boot.c 

OBJS += \
./src/Boot/Boot.o 

C_DEPS += \
./src/Boot/Boot.d 


# Each subdirectory must supply rules for building sources it contributes
src/Boot/%.o: ../src/Boot/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@src/Boot/Boot.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


