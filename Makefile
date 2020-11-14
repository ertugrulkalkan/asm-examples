ASM = nasm
ASMFLAGS = -f elf64

BIN = ./bin
BUILD = $(BIN)/obj
DIRECTORIES = $(BIN) $(BUILD)

VPATH = ./examples

%: %.bin
	$(BIN)/$@.bin

%.bin: %.o
	ld $(BUILD)/$^ -o $(BIN)/$@

%.o: %.asm directories
	$(ASM) $(ASMFLAGS) $< -o $(BUILD)/$@

directories:
	mkdir -p $(DIRECTORIES)

.PHONY: clean
clean:
	rm -rf $(DIRECTORIES)