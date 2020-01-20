#define ROUNDUP_SIZEOF(a) ((sizeof(a) + 3) / 4 * 4)

void myprintf(char *fmt, ...);

int main()
{
    myprintf("one character [%c]",'a');
    myprintf("string [%s]", "hello");
    myprintf("decimal 100 = [%d]",100);
    myprintf("octal 100 = [%o]",100);
    myprintf("hexadecimal 100 = [%x]",100);
    myprintf("escape %% [%%]");
    myprintf("max 10 characters [%10s]","hello");
    myprintf("limit two characters [%.2s]","hello");
    myprintf("max 5 digits decimal [%5d]",100);
    myprintf("max 5 digits octal [%5o]",100);
    myprintf("max 5 digits hexadecimal [%5x]",100);
    myprintf("zero padding decimal [%05d]",100);
    myprintf("zero padding octal [%05o]",100);
    myprintf("zero padding hexadecimal [%05x]",100);
    myprintf("left decimal [%-5d]",100);
    myprintf("left octal [%-5o]",100);
    myprintf("left hexadecimal [%-5x]",100);
    myprintf("sign [%+d]",100);

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

int get_digit(int a,int base)
{
    int digit = 0;

    if (a == 0)
    {
        return 0;
    }
    else
    {
        while (a != 0)
        {
            a /= base;
            digit++;
        }
        return digit;
    }
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
        print_char(*str++);
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
            fmt += get_digit(leftrange,10);
            if (*fmt == '.')
            {
                rightrange = get_range(++fmt);
                fmt += get_digit(rightrange,10);
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
                    rightrange = strlen(*(char **)p);
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
                    print_fill(max(leftrange - get_digit(*(int *)p,10) - is_plus, 0), 0);
                }
                else
                {
                    print_fill(max(leftrange - get_digit(*(int *)p,10) - is_plus, 0), read_zero == 1);
                    print_plus(is_plus);
                    print_int(*(int *)p);
                }
                p += ROUNDUP_SIZEOF(int);
                break;
            case 'o':
                if (is_left == 1)
                {
                    print_plus(is_plus);
                    print_base(*(int *)p, 8);
                    print_fill(max(leftrange - get_digit(*(int *)p,8) - is_plus, 0), 0);
                }
                else
                {
                    print_fill(max(leftrange - get_digit(*(int *)p,8) - is_plus, 0), read_zero == 1);
                    print_plus(is_plus);
                    print_base(*(int *)p, 8);
                }
                p += ROUNDUP_SIZEOF(int);
                break;
            case 'x':
if (is_left == 1)
                {
                    print_plus(is_plus);
                    print_base(*(int *)p, 16);
                    print_fill(max(leftrange - get_digit(*(int *)p,16) - is_plus, 0), 0);
                }
                else
                {
                    print_fill(max(leftrange - get_digit(*(int *)p,16) - is_plus, 0), read_zero == 1);
                    print_plus(is_plus);
                    print_base(*(int *)p, 16);
                }
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
