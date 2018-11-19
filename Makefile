NAME	=	libasm.so

SRC	=	src/strlen.asm	\
		src/strchr.asm	\
		src/memset.asm	\
		src/rindex.asm	\
		src/strcmp.asm	\
		src/strncmp.asm	\
		src/strcspn.asm	\
		src/memcpy.asm	\
		src/strpbrk.asm

OBJ	=	$(SRC:.asm=.o)

CFLAGS	+=	-fPIC -shared

%.o: %.asm
	nasm -f elf64 $< -o $@

all: $(NAME)

$(NAME): $(OBJ)
	ld -o $(NAME) $(OBJ) $(CFLAGS)

clean:
	rm -f $(OBJ)
	make clean -C tests/

fclean: clean
	find -name "*~" -delete
	rm -f $(NAME)
	make fclean -C tests/

re: fclean all

tests_run:
	make re
	cp $(NAME) ./tests/
	make -C tests/
	./tests/tests --verbose=1

.PHONY: all clean fclean re tests_run
