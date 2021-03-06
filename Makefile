##
## Makefile for Makefile in /home/lacomm_m/asm_minilibc
## 
## Made by Manon Lacommare
## Login   <lacomm_m@epitech.net>
## 
## Started on  Mon Mar  6 20:30:45 2017 Manon Lacommare
## Last update Fri Mar 24 12:04:53 2017 Nicolas
##

NASM	=	nasm -f elf64

CC	=	ld -shared

RM	=	rm -f

NAME	=	libasm.so

SRCS	=	strlen.S	\
		strchr.S	\
		memset.S	\
		memcpy.S	\
		strcmp.S	\
		memmove.S	\
		strncmp.S	\
		strcasecmp.S	\
		strstr.S	\
		strpbrk.S	\
		strcspn.S	\
		rindex.S

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
