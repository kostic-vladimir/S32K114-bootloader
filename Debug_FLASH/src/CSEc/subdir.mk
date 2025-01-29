################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/CSEc/CSEc_functions.c 

OBJS += \
./src/CSEc/CSEc_functions.o 

C_DEPS += \
./src/CSEc/CSEc_functions.d 


# Each subdirectory must supply rules for building sources it contributes
src/CSEc/%.o: ../src/CSEc/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@src/CSEc/CSEc_functions.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


