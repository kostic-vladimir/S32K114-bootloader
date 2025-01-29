################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/FlexCAN/FlexCAN.c 

OBJS += \
./src/FlexCAN/FlexCAN.o 

C_DEPS += \
./src/FlexCAN/FlexCAN.d 


# Each subdirectory must supply rules for building sources it contributes
src/FlexCAN/%.o: ../src/FlexCAN/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@src/FlexCAN/FlexCAN.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


