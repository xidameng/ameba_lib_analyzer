# Simple Ameba Archive Library Analyzer

This tool extract archive library and put the extracted object code into the ```decomposed``` folder, user can then disassemble the object code into assembly code for further analysis

# How to use

1. Put the ```.a``` file in the same directory as this readme file

2. Extract files using CLI below
For ameba 1 library,
```bash
$ make amb1
```

For ameba D library,
```bash
$ make ambd
```

3. Analyze using CLI below,
For ameba 1,
```bash
$ make analyze FILE=The name of your interested file without extension
```
Fore example, I am interested in analyzing the cJSON.o file, then I will type
```bash
$ make analyze FILE=cJSON
```

For ameba D,
```bash
$ make analyze BOARD=D FILE=The name of your interested file without extension
```
