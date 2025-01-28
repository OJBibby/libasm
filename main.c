/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: obibby <obibby@student.42wolfsburg.de>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/28 12:44:43 by obibby            #+#    #+#             */
/*   Updated: 2025/01/28 15:28:16 by obibby           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

void    strlen_test()
{
    char *str = "There are 39 characters in this string.";

    printf("%10s %10ld\n", "ft_strlen:", ft_strlen(str));
    printf("%10s %10ld\n", "ft_strlen:", strlen(str));
}

void    strcpy_test()
{
    char    *str = "This string will be copied.";
    char    str1[28];
    char    str2[28];

    ft_strcpy(str1, str);
    strcpy(str2, str);
    printf("%10s %10s\n", "ft_strcpy:", str1);
    printf("%10s %10s\n", "strcpy:", str2);
}

void    strcmp_test()
{
    char    *str2 = "This string will be compared to";
    char    *str1 = "this string";

    printf("%10s %10d\n", "ft_strcmp:", ft_strcmp(str1, str2));
    printf("%10s %10d\n", "strcmp:", strcmp(str1, str2));
    printf("%10s %10d\n", "ft_strcmp:", ft_strcmp(str2, str1));
    printf("%10s %10d\n", "strcmp:", strcmp(str2, str1));
}

void    write_test()
{
    write(1, "    write: This will be written.\n", 33);
    ft_write(1, " ft_write: This will be written.\n", 33);
}

void    read_test()
{
    FILE    *file;
    int     fd;
    char    buf[100];

    file = fopen("testfile.txt", "w+");
    fprintf(file, "This will be read.\n");
    fclose(file);
    fd = open("testfile.txt", 'r');
    bzero(buf, 100);
    ft_read(fd, buf, 99);
    close(fd);
    printf("%10s %10s\n", "ft_read:", buf);
    fd = open("testfile.txt", 'r');
    bzero(buf, 100);
    read(fd, buf, 99);
    close(fd);
    printf("%10s %10s\n", "read:", buf);
}

int main()
{
    strlen_test();
    strcpy_test();
    strcmp_test();
    write_test();
    read_test();
}