NAME = testrunner

CC = gcc
CFLAGS += -Wall -Wextra -pedantic -I..
LDFLAGS += -L..
LDLIBS += -lfts

OBJ = $(NAME).o \
	  test_ft_bzero.o \
	  test_ft_strcat.o \
	  test_ft_isalpha.o \
	  test_ft_isdigit.o \
	  test_ft_isalnum.o \
	  test_ft_isascii.o \

all: $(NAME)

$(NAME): $(OBJ) ../libfts.a

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
