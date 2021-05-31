BOARD ?= d
FILE ?= 
UNZIP_PATH = unzipped
ARCHIVE = $(OLDARCHIVE)
OLDARCHIVE = archive_lib
NEWARCHIVE = archive_lib_new
REPLACE = replacement


.PHONY: unzip
unzip:
	@if [ -d $(UNZIP_PATH) ]; \
		then echo "--Unzipped folder found, deleting folder and its content--"; \
			rm -rf $(UNZIP_PATH); \
		else echo "--Creating temporary folder--"; fi
	mkdir $(UNZIP_PATH)
	mv $(ARCHIVE)/*.a $(UNZIP_PATH)
	@if [ $(BOARD) = 1 ]; \
		then ./toolchain/ameba_1_arm-none-eabi-gcc/4_8-2014q3/bin/arm-none-eabi-ar -x $(UNZIP_PATH)/*.a; \
		else ./toolchain/ameba_d_asdk_toolchain/1.0.1/arm-none-eabi/bin/ar -x $(UNZIP_PATH)/*.a ; fi
	mv *.o $(UNZIP_PATH)
	mv $(UNZIP_PATH)/*.a $(ARCHIVE)


.PHONY: analyze
analyze: $(UNZIP_PATH)
	@echo analyzing $(FILE).o ...
	@if [ $(BOARD) = 1 ]; \
		then ./toolchain/ameba_1_arm-none-eabi-gcc/4_8-2014q3/bin/arm-none-eabi-objdump -D $(UNZIP_PATH)/$(FILE).o > $(FILE).txt; \
		else ./toolchain/ameba_d_asdk_toolchain/1.0.1/arm-none-eabi/bin/objdump -D $(UNZIP_PATH)/$(FILE).o > $(FILE).txt ; fi


.PHONY: newlib
newlib:
	make unzip ARCHIVE=$(NEWARCHIVE)
	rm -f $(UNZIP_PATH)/rtl8721dhp_intfcfg.o
	cp $(REPLACE)/rtl8721dhp_intfcfg.o $(UNZIP_PATH)
	./toolchain/ameba_d_asdk_toolchain/1.0.1/arm-none-eabi/bin/ar rvs lib_arduino.a $(UNZIP_PATH)/*.o
	@echo "--New lib generated successfully, find it in current directory--"


.PHONY: clean
clean:
	rm -rf $(UNZIP_PATH)
	rm -f *.a *.o
