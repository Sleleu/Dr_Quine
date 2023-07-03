NAMES = Grace Colleen
OBJS = Grace.o Colleen.o

NASMFLAGS = -f elf64
GCCFLAGS = -Wextra -Wall -Werror -no-pie

all: $(NAMES)

Grace: Grace.o
	gcc $(GCCFLAGS) Grace.o -o Grace

Colleen: Colleen.o
	gcc $(GCCFLAGS) Colleen.o -o Colleen

%.o: %.s
	nasm $(NASMFLAGS) $< -o $@

clean:
	rm -rf $(OBJS)

fclean: clean
	rm -rf $(NAMES)

re: clean all

light: all
	rm -rf $(OBJS)

.PHONY: all clean fclean re light
