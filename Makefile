##
## EPITECH PROJECT, 2017
## deBruijn
## File description:
## Makefile
##

NAME	=	deBruijn

all:	$(NAME)

$(NAME):
	stack build --copy-bins --local-bin-path .

clean:
	stack clean
	rm .stack-work deBruijn.cabal -rf

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

.PHONY:	all clean fclean re
