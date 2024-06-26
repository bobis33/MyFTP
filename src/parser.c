/*
** EPITECH PROJECT, 2024
** myftp
** File description:
** parser.c
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

#include "tools.h"

static bool is_dir(const char *path)
{
    struct stat st;

    if (path == NULL)
        return false;
    if (stat(path, &st) == ERROR) {
        perror("stat");
        return false;
    }
    if (S_ISDIR(st.st_mode))
        return true;
    return false;
}

static int init_ftp(server_t *server, const int port, const char *path)
{
    server->port = port;
    server->path = strdup(path);
    if (!check_ptr(server->path, "strdup")) {
        free(server);
        return ERROR;
    }
    return SUCCESS;
}

static int check_args(const int port, const char *path)
{
    if (port < 1024 || port > 65535) {
        write_message(2, "Port must be between 1024 and 65535\n");
        return ERROR;
    }
    if (is_dir(path) == false)
        return ERROR;
    return SUCCESS;
}

int parser(server_t *server, const char *port, const char *path)
{
    const int port_to_int = atoi(port);

    if (check_args(port_to_int, path) == ERROR) {
        free(server);
        return ERROR;
    }
    return init_ftp(server, port_to_int, path);
}
