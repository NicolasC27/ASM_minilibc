##
## Makefile for Makefile in /home/lacomm_m/asm_minilibc
## 
## Made by Manon Lacommare
## Login   <lacomm_m@epitech.net>
## 
## Started on  Mon Mar  6 20:30:45 2017 Manon Lacommare
## Last update Tue Mar 14 16:02:22 2017 Manon Lacommare
##

NASM	=	nasm -f elf64

CC	=	ld -shared

RM	=	rm -f

NAME	=	libasm.so

SRCS	=	strlen.S	\
		strchr.S	\
		memset.S	\
		memcpy.S	\

OBJS	=	$(addprefix srcs/, $(SRCS:.S=.o))

%.o:	 %.S
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
