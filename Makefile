BOARD ?= 1
FILE ?= 

.PHONY: amb1
amb1:
	mkdir decomposed
	rm -f decomposed/*.o decomposed/*.a
	mv *.a decomposed
	./ameba_1_arm-none-eabi-gcc/4_8-2014q3/bin/arm-none-eabi-ar -x decomposed/*.a
	mv *.o decomposed

.PHONY: ambd
ambd:
	mkdir decomposed
	rm -f decomposed/*.o decomposed/*.a
	mv *.a decomposed
	./ameba_d_asdk_toolchain/1.0.1/arm-none-eabi/bin/ar -x decomposed/*.a
	mv *.o decomposed

.PHONY: copy
copy:
	mv decomposed/rtl8721dhp_intfcfg.o temp


.PHONY: replace
replace:
	rm -f decomposed/rtl8721dhp_intfcfg.o
	mv temp/rtl8721dhp_intfcfg.o decomposed

.PHONY: analyze
analyze:
	@echo analyzing $(FILE).o ...
	@if [ $(BOARD) = 1 ]; \
		then ./ameba_1_arm-none-eabi-gcc/4_8-2014q3/bin/arm-none-eabi-objdump -D decomposed/$(FILE).o > $(FILE).txt; \
		else ./ameba_d_asdk_toolchain/1.0.1/arm-none-eabi/bin/objdump -D decomposed/$(FILE).o > $(FILE).txt ; fi


.PHONY: clean
clean:
	rm -rf decomposed


.PHONY: zip
zip: decomposed
	@if [ $(BOARD) = 1 ]; \
		then ./ameba_1_arm-none-eabi-gcc/4_8-2014q3/bin/arm-none-eabi-ar rvs $(FILE).a decomposed/*.o ; \
		else ./ameba_d_asdk_toolchain/1.0.1/arm-none-eabi/bin/ar rvs $(FILE).a decomposed/*.o ; fi


.PHONY: newA
newA: decomposed
	./ameba_d_asdk_toolchain/1.0.1/arm-none-eabi/bin/ar rvs lib_arduino.a decomposed/*.o
	mv decomposed/lib_arduino.a /
