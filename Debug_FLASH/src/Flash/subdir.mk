################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/Flash/fsl_flash_driver_c90tfs.c 

OBJS += \
./src/Flash/fsl_flash_driver_c90tfs.o 

C_DEPS += \
./src/Flash/fsl_flash_driver_c90tfs.d 


# Each subdirectory must supply rules for building sources it contributes
src/Flash/%.o: ../src/Flash/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Standard S32DS C Compiler'
	arm-none-eabi-gcc "@src/Flash/fsl_flash_driver_c90tfs.args" -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


