#define ROUNDUP_SIZEOF(a) ((sizeof(a) + 3) / 4 * 4)

void myprintf(char *fmt, ...);

int main()
{
    myprintf("%s", "aa");
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
        print_char('+');
}

void print_fill(int size, int is_zero)
{
    int i;
    for (i = 0; i < size; i++)
    {
        print_char(get_char_for_fill(is_zero));
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
        print_char(*str);
    }
}

int strlen(char *str)
{
    int length = 0;

    while (*str++ != '\0')
    {
        length++;
    }

    return length;
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
        print_char('a' + surplus - 10);
    }
    else
    {
        print_int(surplus);
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

    char *p = (char *)&fmt + ROUNDUP_SIZEOF(fmt);
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
                print_char(*(char *)p); //syscallsに新しく追加した（レポートに書く）
                p += ROUNDUP_SIZEOF(char);
                break;
            case 's':

                if (rightrange == 0)
                {
                    rightrange = strlen(value);
                }

                if (is_left == 1)
                {
                    print_limited_string(rightrange, *(char **)p);
                    print_fill(max(leftrange - strlen(*(char **)p), 0), 0);
                }
                else
                {
                    print_fill(max(leftrange - strlen(*(char **)p), 0), 0);
                    print_limited_string(rightrange, *(char **)p);
                }
                p += ROUNDUP_SIZEOF(char *);
                break;
            case 'd':
                if (is_left == 1)
                {
                    print_plus(is_plus);
                    print_int(*(int *)p);
                    print_fill(max(leftrange - get_digit(*(int *)p) - is_plus, 0), 0);
                }
                else
                {
                    print_fill(max(leftrange - get_digit(*(int *)p) - is_plus, 0), read_zero == 1);
                    print_plus(is_plus);
                    print_int(*(int *)p);
                }
                p += ROUNDUP_SIZEOF(int);
                break;
            case 't':
                if (is_left == 1)
                {
                    print_plus(is_plus);
                    print_int(*(int *)p * 1.1);
                    print_fill(max(leftrange - get_digit(*(int *)p * 1.1) - is_plus, 0), 0);
                }
                else
                {
                    print_fill(max(leftrange - get_digit(*(int *)p * 1.1) - is_plus, 0), read_zero == 1);
                    print_plus(is_plus);
                    print_int(*(int *)p * 1.1);
                }
                p += ROUNDUP_SIZEOF(int);
                break;
            case 'o':
                if (is_left == 1)
                {
                    print_plus(is_plus);
                    print_base(*(int *)p, 8);
                    print_fill(max(leftrange - get_digit(*(int *)p) - is_plus, 0), 0);
                }
                else
                {
                    print_fill(max(leftrange - get_digit(*(int *)p) - is_plus, 0), read_zero == 1);
                    print_plus(is_plus);
                    print_base(*(int *)p, 8);
                }
                p += ROUNDUP_SIZEOF(int);
                break;
            case 'x':

                print_base(*(int *)p, 16);
                p += ROUNDUP_SIZEOF(int);
                break;
            case '%':
                print_char('%');
                break;
            default:
                break;
            }
        }
        else
        {
            print_char(*fmt);
        }
        fmt++;
    }
    print_char('\n');
    return;
}
