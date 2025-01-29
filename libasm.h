/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: obibby <obibby@student.42wolfsburg.de>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/28 12:44:52 by obibby            #+#    #+#             */
/*   Updated: 2025/01/29 19:54:05 by obibby           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <stdio.h>
# include <unistd.h>
# include <string.h>
# include <stdlib.h>
# include <fcntl.h>

typedef struct s_list
{
	void			*data;
	struct s_list	*next;
} t_list;


int ft_read(int fd, void *buf, size_t count);
int ft_strcmp(const char *s1, const char *s2);
char *ft_strcpy(char *restrict dst, const char *restrict src);
char *ft_strdup(const char *s);
size_t ft_strlen(const char *s);
ssize_t ft_write(int fd, const void *buf, size_t count);
int ft_atoi_base(const char *str, int base);

#endif