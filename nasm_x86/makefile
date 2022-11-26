SRC=$(wildcard *.asm)

PROGS=$(patsubst %.asm,%,$(SRC))

all: $(PROGS)

%: %.o
	ld -m elf_i386 -o $@ $<

%.o: %.asm
	nasm -f elf $<
