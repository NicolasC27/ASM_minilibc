#include <stdio.h>
#include <string.h>
#include <strings.h>
#include <stdlib.h>

void	test_memcpy(char *_dest, char *_src, size_t n)
{
  void	*dest = calloc(strlen(_dest), 1);
  void	*src = calloc(strlen(_src), 1);
  void	*pt;

  memcpy(dest, _dest, strlen(_dest));
  memcpy(src, _src, strlen(_src));
  if ((pt = memcpy(dest, src, n)) == NULL)
    printf("NULL\n");
  else
    printf("%s\n", (char*)pt);
}

void	test_memmove(char *_dest, char *_src, size_t n)
{
  void	*dest = calloc(strlen(_dest), 1);
  void	*src = calloc(strlen(_src), 1);
  void	*pt;

  memcpy(dest, _dest, strlen(_dest));
  memcpy(src, _src, strlen(_src));
  if ((pt = memmove(dest, src, n)) == NULL)
    printf("NULL\n");
  else
    printf("%s\n", (char*)pt);
}

void	test_memset(char *str, int c, size_t n)
{
  void	*pt;

  if ((pt = memset(str, c, n)) == NULL)
    printf("NULL\n");
  else
    printf("%s\n", (char*)pt);
}

void	test_rindex(char *_dest, int c)
{
  void	*dest = calloc(strlen(_dest), 1);
  void	*pt;

  memcpy(dest, _dest, strlen(_dest));
  if ((pt = rindex(dest, c)) == NULL)
    printf("NULL\n");
  else
    printf("%c\n", *((char*)pt));
}

void	test_strcasecmp(char *one, char *two)
{
  printf("%d\n", strcasecmp(one, two));
}

void	test_strcmp(char *one, char *two)
{
  printf("%d\n", strcmp(one, two));
}

void	test_strncmp(char *one, char *two, size_t n)
{
  printf("%d\n", strncmp(one, two, n));
}

void	test_strchr(char *str, int c)
{
  char	*ch;

  if ((ch = strchr(str, c)) == NULL)
    printf("NULL\n");
  else
    printf("%c\n", *ch);
}

void   	test_strcspn(char *one, char *two)
{
  printf("%lu\n", strcspn(one, two));
}

void	test_strlen(char *str)
{
  printf("%lu\n", strlen(str));
}

void	test_strpbrk(char *one, char *two)
{
  char	*c;

  if ((c = strpbrk(one, two)) == NULL)
    printf("NULL\n");
  else
    printf("%c\n", *c);
}

void	test_strstr(char *one, char *two)
{
  char	*str;

  if ((str = strstr(one, two)) == NULL)
    printf("NULL\n");
  else
    printf("%s\n", str);
}

int	main(int ac, char **av)
{
  if (ac < 3)
    return (0);
  if (strcmp(av[1], "memcpy") == 0 && ac == 5)
    test_memcpy(av[2], av[3], atol(av[4]));
  else if (strcmp(av[1], "memmove") == 0 && ac == 5)
    test_memmove(av[2], av[3], atol(av[4]));
  else if (strcmp(av[1], "memset") == 0 && ac == 5)
    test_memset(av[2], av[3][0], atol(av[4]));
  else if (strcmp(av[1], "rindex") == 0 && ac == 4)
    test_rindex(av[2], av[3][0]);
  else if (strcmp(av[1], "strcasecmp") == 0 && ac == 4)
    test_strcasecmp(av[2], av[3]);
  else if (strcmp(av[1], "strcmp") == 0 && ac == 4)
    test_strcmp(av[2], av[3]);
  else if (strcmp(av[1], "strncmp") == 0 && ac == 5)
    test_strncmp(av[2], av[3], atol(av[4]));
  else if (strcmp(av[1], "strchr") == 0 && ac == 4)
    test_strchr(av[2], av[3][0]);
  else if (strcmp(av[1], "strcspn") == 0 && ac == 4)
    test_strcspn(av[2], av[3]);
  else if (strcmp(av[1], "strlen") == 0 && ac == 3)
    test_strlen(av[2]);
  else if (strcmp(av[1], "strpbrk") == 0 && ac == 4)
    test_strpbrk(av[2], av[3]);
  else if (strcmp(av[1], "strstr") == 0 && ac == 4)
    test_strstr(av[2], av[3]);
  return (0);
}
