##
## EPITECH PROJECT, 2024
## myftp
## File description:
## Makefile
##

SRC				=   src/core.c 							    \
                    src/parser.c                            \
                    src/tools.c                             \
                    src/server/server.c                     \
                    src/server/socket.c                     \
                    src/client/client.c                     \
                    src/commands/handle_inputs.c            \
                    src/commands/cmd_tools.c                \
                    src/commands/handlers/cdup.c            \
                    src/commands/handlers/cwd.c             \
                    src/commands/handlers/dele.c            \
                    src/commands/handlers/help.c            \
                    src/commands/handlers/list.c            \
                    src/commands/handlers/noop.c            \
                    src/commands/handlers/pass.c            \
                    src/commands/handlers/pasv.c            \
                    src/commands/handlers/port.c            \
                    src/commands/handlers/pwd.c             \
                    src/commands/handlers/quit.c            \
                    src/commands/handlers/retr.c            \
                    src/commands/handlers/stor.c            \
                    src/commands/handlers/user.c            \

SRC_MAIN 		=	src/main.c

SRC_TEST		=	units_tests/test.c

OBJ 			=	$(SRC_MAIN:.c=.o)						\
					$(SRC:.c=.o)

OBJ_TEST		=	$(SRC_TEST:.c=.o)						\
					$(SRC:.c=.o)

INC             =   -I./include

CFLAGS			=	-W -Wall -Werror -Wextra $(INC) -std=c17 -D_GNU_SOURCE

LDFLAGS         =   --coverage -lcriterion

NAME			=	myftp

NAME_TEST		=   unit_tests

RM              =   rm -f

$(NAME):			$(OBJ)
					gcc -o $(NAME) $(OBJ) $(CFLAGS)

all:				$(NAME)

debug: 				CFLAGS += -g3 -ggdb
debug:              re

clean:
					$(RM) $(OBJ) $(OBJ_TEST)

fclean:             clean
					$(RM) $(NAME) $(NAME_TEST)
					find . -name "*.gcda" -delete -or -name "*.gcno" -delete
					find . -name "*.log" -delete

tests_run:			CFLAGS += $(LDFLAGS)
tests_run: 			$(OBJ_TEST)
					gcc -o $(NAME_TEST) $(OBJ_TEST) $(CFLAGS)
					./unit_tests --verbose

re:					fclean all

.PHONY:             all debug clean fclean tests_run re
