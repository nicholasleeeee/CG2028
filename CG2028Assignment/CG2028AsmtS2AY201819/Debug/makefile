################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: CG2028AsmtS2AY201819.axf

# Tool invocations
CG2028AsmtS2AY201819.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MCU Linker'
	arm-none-eabi-gcc -nostdlib -L"/Users/nicholas/Desktop/CG2028/CG2028Assignment/Lib_CMSISv1p30_LPC17xx/Debug" -Xlinker --gc-sections -Xlinker -Map=CG2028AsmtS2AY201819.map -mcpu=cortex-m3 -mthumb -T "CG2028AsmtS2AY201819_Debug.ld" -o"CG2028AsmtS2AY201819.axf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(OBJS)$(C_DEPS)$(EXECUTABLES) CG2028AsmtS2AY201819.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-arm-none-eabi-size CG2028AsmtS2AY201819.axf; # arm-none-eabi-objcopy -O ihex CG2028AsmtS2AY201819.axf CG2028AsmtS2AY201819.hex ;
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY: post-build

-include ../makefile.targets
