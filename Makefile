NAME = libfts.a

AS = nasm
ASFLAGS += -fmacho64
ARFLAGS += -s

OBJ = ft_bzero.o \
	  ft_strcat.o \

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re
