NAME = libfts.a

AS = nasm
ASFLAGS += -fmacho64
ARFLAGS += -s

OBJ = ft_bzero.o \
	  ft_strcat.o \
	  ft_isalpha.o \
	  ft_isdigit.o \
	  ft_isalnum.o \
	  ft_isascii.o \
	  ft_isprint.o \
	  ft_toupper.o \
	  ft_tolower.o \
	  ft_puts.o \
	  ft_strlen.o \

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $(NAME) $(OBJ)

debug: ASFLAGS += -g -Fdwarf
debug: all

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
