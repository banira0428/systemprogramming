#include <stdio.h> //デバッグ用，あとで消す 自分で作ったsyscalls.sを使え
#include <string.h>

#define ROUNDUP_SIZEOF(a) ((sizeof(a) + 3) / 4 * 4)

void myprintf(char *fmt, ...);

int main()
{
    myprintf("あああ%d%dああああ", 1, 3);
    return 1;
}

void myprintf(char *fmt, ...)
{
    char *p = (char *)&fmt + 4; // ((sizeof(fmt) + 3) / 4) * 4; 実行環境に応じて変える
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
                printf("%d", *(int *)p);
                p = p + sizeof(int); // ((sizeof(int) + 3) / 4) * 4;
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
        }
        fmt++;
    }
    printf("\n");
    return;
}
