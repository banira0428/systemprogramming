#include <stdio.h> //デバッグ用，あとで消す 自分で作ったsyscalls.sを使え
#include <string.h>

void myprintf(char *fmt, ...);

int main()
{
    myprintf("あああ%dああああ", 1);
    return 1;
}

void myprintf(char *fmt, ...)
{
    int d;

    int *arg;
    while (*fmt)
    {

        

        if (*fmt == '%')
        {
            fmt++;
            switch (*fmt)
            {
            case 'c':
                break;
            case 's':
                break;
            case 'd':
                d = ((char *)&fmt) + ((sizeof(fmt) + 3) / 4) * 4;
                printf("%d", d);

                break;
            case 'u':
                break;
            case 'o':
                break;
            case 'x':
                break;
            case 'l':
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
            fmt++;
        }
    }
    printf("\n", d);
    return;
}
