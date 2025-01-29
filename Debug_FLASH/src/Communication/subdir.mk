################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Communication/Comm.c 

OBJS += \
./src/Communication/Comm.o 

C_DEPS += \
./src/Communication/Comm.d 


# Each subdirectory must supply rules for building sources it contributes
src/Communication/%.o: ../src/Communication/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@src/Communication/Comm.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


