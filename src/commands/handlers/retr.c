/*
** EPITECH PROJECT, 2024
** myftp
** File description:
** retr.c
*/

#include "commands/cmd_tools.h"
#include "commands/messages.h"

void cmd_retr(
    data_t *client_data,
    client_t *client,
    const int fd,
    const char *args)
{
    (void)args;
    (void)client;
    if (!is_logged(client_data, fd)
    || is_args_empty(args, fd)
    || !is_mode(client_data->mode, fd))
        return;
    write_message(fd, NOT_TAKEN_550);
}
