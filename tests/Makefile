SRC	=	src/load_lib.c		\
		src/strlen_utests.c	\
		src/memcpy_utests.c	\
		src/memset_utests.c

OBJ	=	$(SRC:.c=.o)

NAME	=	tests

CFLAGS	+=	-Iinclude/ -ldl -lcriterion --coverage

all: $(NAME)

$(NAME): $(OBJ)
	gcc -o $(NAME) $(OBJ) $(CFLAGS)

clean:
	rm -f $(OBJ)

fclean: clean
	find -name "*~" -delete
	rm -f $(NAME)
	rm -f src/*.gcda
	rm -f src/*.gcno
	rm -f src/*.gcov
	rm -f libasm.so

re: fclean all

.PHONY: all clean fclean re
