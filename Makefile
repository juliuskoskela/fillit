LIBFT = libft/libft.a
LIBDL = libdl/libdl.a
BITLIB = bitlib/bitlib.a
NAME = fillit
SRCS = srcs/fillit.c \
		srcs/read_input.c \
		srcs/val_blocks.c \
		srcs/val_input.c \

OBJS = $(SRCS:.c=.o)
DEBUG = $(NAME).dSYM

.PHONY: all clean fclean re

all: $(NAME)

clean:
	@make -C libft clean
	@make -C libdl clean
	@make -C bitlib clean
	@rm -f $(OBJS)
	@echo "Deleted all .o files!"

fclean:
	@make -C libft fclean
	@make -C libdl fclean
	@make -C bitlib fclean
	@rm -f $(OBJS)
	@rm -f $(NAME)
	@echo "Deleted all .o files!"
ifneq (,$(wildcard .DS_Store))
	@rm -r .DS_Store
	@echo "Deleted .DS_Store in $(NAME)"
endif
ifneq (,$(wildcard $(NAME).dSYM))
	@rm -r $(DEBUG)
	@echo "Deleted $(NAME).dSYM in $(NAME)"
endif

re: fclean all

d:
	@make -C libft
	@make -C libdl
	@make -C bitlib
	@gcc -g -Wall -Wextra -Werror $(SRCS) $(LIBFT) $(BITLIB) $(LIBDL) -o $(NAME)
	@echo "Lldb debug folder"
	@echo "Compilation of $(NAME) successful!"

$(NAME): $(OBJS)
	@make -C libft
	@make -C libdl
	@make -C bitlib
	@gcc -Wall -Wextra -Werror $^ $(LIBFT) $(BITLIB) $(LIBDL) -o $(NAME)
	@echo "Compilation of $(NAME) successful!"

%.o: %.c
	@gcc -c -Wall -Wextra -Werror -o $@ $<