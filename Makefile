BOARD ?= 1
FILE ?= 

.PHONY: amb1
amb1:
	rm -f decomposed/*.o decomposed/*.a
	cp *.a decomposed
	./ameba_1_arm-none-eabi-gcc/4_8-2014q3/bin/arm-none-eabi-ar -x decomposed/*.a
	mv *.o decomposed

.PHONY: ambd
ambd:
	rm -f decomposed/*.o decomposed/*.a
	cp *.a decomposed
	./ameba_1_arm-none-eabi-gcc/4_8-2014q3/bin/arm-none-eabi-ar -x decomposed/*.a
	mv *.o decomposed


.PHONY: analyze
analyze:
	@echo analyzing $(FILE).o ...
	@if [ $(BOARD) = 1 ]; \
		then ./ameba_1_arm-none-eabi-gcc/4_8-2014q3/bin/arm-none-eabi-objdump -D decomposed/$(FILE).o > $(FILE).txt; \
		else ./ameba_d_asdk_toolchain/1.0.1/arm-none-eabi/bin/objdump -D decomposed/$(FILE) > $(FILE).txt ; fi
