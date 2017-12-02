
CFLAGS = -static -O2 -DNTIMES=1001

all: hypbench nohypbench
nohypbench: stream.c vmcall.o
	$(CC) $(CFLAGS) -DBAREMETAL=1 stream.c vmcall.o -o bench-nohyp

hypbench: stream.c vmcall.o
	$(CC) $(CFLAGS) stream.c vmcall.o -o bench-hyp

vmcall.o: vmcall.asm
	nasm -f elf64 -o vmcall.o vmcall.asm

clean:
	rm -f *.o *.dat bench*
