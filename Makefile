ASM = nasm
ASMFLAGS = -f elf64

BIN = ./bin
OBJ = $(BIN)/obj
DIRECTORIES = $(BIN) $(OBJ)

VPATH = ./examples

%: %.bin
	$(BIN)/$@.bin

%.bin: %.o
	ld $(OBJ)/$^ -o $(BIN)/$@

%.o: %.asm directories
	$(ASM) $(ASMFLAGS) $< -o $(OBJ)/$@

directories:
	mkdir -p $(DIRECTORIES)

.PHONY: clean
clean:
	rm -rf $(DIRECTORIES)
