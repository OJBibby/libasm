NAME	=	libasm.a
CC		=	nasm
OBJ_DIR	=	obj/
SRCS	=	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s ft_atoi_base.s
OBJS	=	$(SRCS:%.s=$(OBJ_DIR)%.o)
GREY	=	\33[1;30m
BLUE	=	\33[0;34m
DEFAULT	=	\33[0m

$(NAME): $(OBJS)
	@printf "$(GREY)Compiling $(BLUE)$(NAME)\n"
	@ar rcs $@ $^

$(OBJ_DIR)%.o: %.s
	@mkdir -p $(@D)
	@printf "$(GREY)Compiling $(BLUE)$< $(GREY)> $(BLUE)$@$(DEFAULT)\n"
	@$(CC) -f elf64 $< -o $@

all: $(NAME)

test: $(NAME) main.c
	@cc main.c libasm.a -Wall -Wextra -Werror

clean:
	@printf "$(GREY)Deleting $(BLUE)$(OBJ_DIR)$(DEFAULT)\n"
	@rm -fr $(OBJ_DIR)
	@rm -f main.o a.out

fclean: clean
	@printf "$(GREY)Deleting $(BLUE)$(NAME)$(DEFAULT)\n"
	@rm -f $(NAME)

re: fclean all