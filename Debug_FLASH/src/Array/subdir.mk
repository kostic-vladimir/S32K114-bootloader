################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Array/Array.c 

OBJS += \
./src/Array/Array.o 

C_DEPS += \
./src/Array/Array.d 


# Each subdirectory must supply rules for building sources it contributes
src/Array/%.o: ../src/Array/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@src/Array/Array.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


