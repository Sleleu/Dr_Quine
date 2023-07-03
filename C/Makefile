NAMES = Colleen Grace Sully
OBJS = Grace.o Colleen.o Sully.o
SRCS = Grace.c Colleen.c Sully.c
GCC = gcc -Wall -Wextra -Werror

all: $(NAMES)

Colleen: Colleen.o
	$(GCC) $< -o $@

Grace: Grace.o
	$(GCC) $< -o $@

Sully: Sully.o
	$(GCC) $< -o $@

%.o: %.c
	$(GCC) -c $< -o $@

clean:
	rm -rf $(OBJS)
	rm -rf Grace_kid.c

fclean: clean
	rm -rf $(NAMES)

re: fclean all

light: all
	rm -rf $(OBJS)

.PHONY: all clean fclean re light
