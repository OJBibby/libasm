NAME	=	libasm.a
CC		=	nasm
OBJ_DIR	=	obj/
SRCS	=	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS	=	$(SRCS:%.s=$(OBJ_DIR)%.o)
GREY	=	\33[1;30m
BLUE	=	\33[0;34m

$(NAME): $(OBJS)
	@printf "$(GREY)Compiling $(BLUE)$(NAME)\n"
	@ar rcs $@ $^

$(OBJ_DIR)%.o: %.s
	@mkdir -p $(@D)
	@printf "$(GREY)Compiling $(BLUE)$< $(GREY)> $(BLUE)$@\n"
	@$(CC) -f elf64 $< -o $@

all: $(NAME)

test: $(NAME) main.s
	@nasm -f elf64 main.s
	@ld -m elf_x86_64 -s main.o $(NAME) -lc --dynamic-linker=/lib64/ld-linux-x86-64.so.2

clean:
	@printf "$(GREY)Deleting $(BLUE)$(OBJ_DIR)\n"
	@rm -fr $(OBJ_DIR)
	@rm -f main.o a.out

fclean: clean
	@printf "$(GREY)Deleting $(BLUE)$(NAME)\n"
	@rm -f $(NAME)

re: fclean all