################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Security/Secure_Comm.c 

OBJS += \
./src/Security/Secure_Comm.o 

C_DEPS += \
./src/Security/Secure_Comm.d 


# Each subdirectory must supply rules for building sources it contributes
src/Security/%.o: ../src/Security/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@src/Security/Secure_Comm.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


