################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/Security/subdir.mk
-include src/Memory/subdir.mk
-include src/LPIT/subdir.mk
-include src/FlexCAN/subdir.mk
-include src/Flash/subdir.mk
-include src/Communication/subdir.mk
-include src/Clocks/subdir.mk
-include src/CSEc/subdir.mk
-include src/Boot/subdir.mk
-include src/Array/subdir.mk
-include src/subdir.mk
-include Project_Settings/Startup_Code/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_SIZE += \
Test_S32K114.siz \


# All Target
all: Test_S32K114.elf secondary-outputs

# Tool invocations
Test_S32K114.elf: $(OBJS) C:/Users/vladi/workspaceS32DS.3.6.0/Test_S32K114/Project_Settings/Linker_Files/S32K144_64_flash.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Standard S32DS C Linker'
	arm-none-eabi-gcc -o "Test_S32K114.elf" "@Test_S32K114.args"  $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

Test_S32K114.siz: Test_S32K114.elf
	@echo 'Invoking: Standard S32DS Print Size'
	arm-none-eabi-size --format=berkeley Test_S32K114.elf
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) ./*
	-@echo ' '

secondary-outputs: $(SECONDARY_SIZE)

.PHONY: all clean dependents

-include ../makefile.targets
