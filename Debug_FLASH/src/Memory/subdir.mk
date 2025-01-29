################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Memory/Memory.c 

OBJS += \
./src/Memory/Memory.o 

C_DEPS += \
./src/Memory/Memory.d 


# Each subdirectory must supply rules for building sources it contributes
src/Memory/%.o: ../src/Memory/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@src/Memory/Memory.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


