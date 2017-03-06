##
## Makefile for Makefile in /home/lacomm_m/asm_minilibc
## 
## Made by Manon Lacommare
## Login   <lacomm_m@epitech.net>
## 
## Started on  Mon Mar  6 20:30:45 2017 Manon Lacommare
## Last update Mon Mar  6 20:42:38 2017 Manon Lacommare
##

NASM	=	nasm -f elf64

CC	=	ld -shared

RM	=	rm -f

NAME	=	libasm.so

SRCS	=	strlen.asm	\
		memset.asm

OBJS	=	$(addprefix srcs/, $(SRCS:.asm=.o))

%.o:	 %.asm
	 @$(NASM) -o $@ $<

$(NAME): $(OBJS)
	 $(CC) -o $(NAME) $(OBJS)

all:	 $(NAME)

clean:
	 $(RM) $(OBJS)

fclean:	 clean
	 $(RM) $(NAME)

re:	 fclean all

.PHONY:	 all re clean fclean
