# Compiladores
CC = gcc
ASM = nasm
AR = ar

# Flags
CFLAGS = -m32 -g -Wall
ASMFLAGS = -f elf32
LDFLAGS = -m32

# Arquivos
TARGET = teste_matematica
LIBRARY = libmatematica.a
HEADER = matematica.h
ASM_SOURCE = matematica.asm
ASM_OBJECT = matematica.o
C_SOURCE = teste_matematica.c

# Regra padrão
all: $(TARGET)

# Assembly → objeto
$(ASM_OBJECT): $(ASM_SOURCE)
	$(ASM) $(ASMFLAGS) $< -o $@

# Objeto → biblioteca estática
$(LIBRARY): $(ASM_OBJECT)
	$(AR) rcs $@ $^

# C + biblioteca → executável
$(TARGET): $(C_SOURCE) $(LIBRARY)
	$(CC) $(CFLAGS) $(C_SOURCE) -L. -lmatematica $(LDFLAGS) -o $@

# Executar
run: $(TARGET)
	./$(TARGET)

# Limpar
clean:
	rm -f $(TARGET) $(LIBRARY) $(ASM_OBJECT)

# Dependências 32-bit
install_deps_ubuntu:
	sudo apt-get update
	sudo apt-get install gcc-multilib libc6-dev-i386 nasm

.PHONY: all run clean install_deps_ubuntu
