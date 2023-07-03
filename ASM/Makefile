NAMES = Grace Colleen Sully
OBJS = Grace.o Colleen.o Sully.o

NASMFLAGS = -f elf64
GCCFLAGS = -Wextra -Wall -Werror -no-pie

all: $(NAMES)

Grace: Grace.o
	gcc $(GCCFLAGS) Grace.o -o Grace

Colleen: Colleen.o
	gcc $(GCCFLAGS) Colleen.o -o Colleen

Sully: Sully.o
	gcc $(GCCFLAGS) Sully.o -o Sully

%.o: %.s
	nasm $(NASMFLAGS) $< -o $@

clean:
	rm -rf $(OBJS)
	rm -rf Grace_kid.s

fclean: clean
	rm -rf $(NAMES)

re: clean all

light: all
	rm -rf $(OBJS)

.PHONY: all clean fclean re light
