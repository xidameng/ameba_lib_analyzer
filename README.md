# Simple Ameba Archive Library Analyzer/Generator

This tool extract archive library and put the extracted object code into the `unzipped` folder, user can then disassemble the object code into assembly code for further analysis

# How to use

This tool has 3 functions, 
1. `unzip` -- unzip an archive library
2. `analyze FILE=(the file name of your choice)` -- disassemble the object code into assemblers and dumped to txt file for further analysis
3. `newlib` -- create a new "lib_arduino.a" that is specially designed for MicroPython SDK 

## Preparation
Put the `.a` file in the "archive_lib" folder if you want to `unzip` or `analyze`
If you wanna create new library, then put the new `.a` file in the "archive_lib_new" folder

## Using `unzip`
For ameba D library,
```bash
$ make unzip
```

For ameba 1 library,
```bash
$ make unzip BOARD=1
```

## Using `analyze`

For ameba D,

```bash
$ make analyze FILE=The name of your interested file without extension
```
Fore example, I am interested in analyzing the cJSON.o file, then I will type
```bash
$ make analyze FILE=cJSON
```

For ameba 1,
```bash
$ make analyze FILE=The name of your interested file without extension
```

## Using `newlib` 

For ameba d,
```bash
$ make newlib
```
