all: src/main.bin

src/main.bin: src/main.asm
	nasm -f bin src/main.asm -o src/main.bin

run: src/main.bin
	qemu-system-x86_64 -drive file=src/main.bin,format=raw