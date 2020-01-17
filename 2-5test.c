#include <string.h>
#include <stdio.h>
#include <stdarg.h>

void myprintf(char *fmt, ...);

int main()
{
    myprintf("%.2s", "aaaaa");
    myprintf("%+10d|", 12345);
    printf("%+10d|\n", 12345);
    return 1;
}

int max(int a, int b)
{
    if (a > b)
    {
        return a;
    }
    else
    {
        return b;
    }
}

int min(int a, int b)
{
    if (a < b)
    {
        return a;
    }
    else
    {
        return b;
    }
}

int get_digit(int a)
{
    if (a == 0)
        return 0;

    int digit = 0;

    while (a != 0)
    {
        a /= 10;
        digit++;
    }
    return digit;
}

int get_range(char *str)
{
    int range = 0;

    while ((*str >= '0' && *str <= '9'))
    {
        range = range * 10 + (*str - '0');
        str++;
    }
    return range;
}

char get_char_for_fill(int is_zero)
{
    if (is_zero)
    {
        return '0';
    }
    else
    {
        return ' ';
    }
}

void print_plus(int is_plus)
{
    if (is_plus)
        printf("+");
}

void print_fill(int size, int is_zero)
{
    int i;
    for (i = 0; i < size; i++)
    {
        printf("%c", get_char_for_fill(is_zero));
    }
}

void print_limited_string(int limit, char *str)
{
    int i;
    for (i = 0; i < limit; i++)
    {
        if (*str == '\0')
        {
            break;
        }
        printf("%c", *str);
    }
}

void print_base(int num, int base)
{
    int surplus = num % base;
    int quotient = num / base;

    if (quotient != 0)
    {
        print_base(quotient, base);
    }

    if (surplus >= 10)
    {
        printf("%c", 'a' + surplus - 10);
    }
    else
    {
        printf("%d", surplus);
    }
    return;
}

void myprintf(char *fmt, ...)
{
    int leftrange = 0;
    int rightrange = 0;
    int read_zero = 0;
    int is_left = 0;
    int is_plus = 0;

    char *value;
    int num;

    va_list args;

    va_start(args, fmt);

    while (*fmt)
    {
        if (*fmt == '%')
        {
            fmt++;

            leftrange = 0;
            rightrange = 0;
            read_zero = 0;
            is_left = 0;
            is_plus = 0;

            while (*fmt == '0' || *fmt == '-' || *fmt == '+')
            {
                switch (*fmt)
                {
                case '0':
                    read_zero = 1;
                    break;
                case '-':
                    is_left = 1;
                    break;
                case '+':
                    is_plus = 1;
                    break;
                default:
                    break;
                }
                fmt++;
            }

            leftrange = get_range(fmt);
            fmt += get_digit(leftrange);
            if (*fmt == '.')
            {
                rightrange = get_range(++fmt);
                fmt += get_digit(rightrange);
            }

            switch (*fmt)
            {
            case 'c':
                break;
            case 's':

                value = va_arg(args, char *);

                if (is_left == 1)
                {
                    print_limited_string(rightrange, value);
                    print_fill(max(leftrange - strlen(value), 0), 0);
                }
                else
                {
                    print_fill(max(leftrange - strlen(value), 0), 0);
                    print_limited_string(rightrange, value);
                }
                break;
            case 'd':
                num = va_arg(args, int);

                if (is_left == 1)
                {
                    print_plus(is_plus);
                    printf("%d", num);
                    print_fill(max(leftrange - get_digit(num) - is_plus, 0), read_zero == 1 && is_left == 0);
                }
                else
                {
                    print_fill(max(leftrange - get_digit(num) - is_plus, 0), read_zero == 1 && is_left == 0);
                    print_plus(is_plus);
                    printf("%d", num);
                }
                break;
            case 't':
                break;
            case 'o':
                break;
            case 'x':
                break;
            case '%':
                break;
            default:
                break;
            }
        }
        else
        {
            printf("%c", *fmt);
        }
        fmt++;
    }
    printf("\n");

    va_end(args);

    return;
}
