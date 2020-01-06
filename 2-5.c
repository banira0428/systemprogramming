#include<string.h>
#define ROUNDUP_SIZEOF(a) ((sizeof(a) + 3) / 4 * 4)

void myprintf(char *fmt, ...);

int main()
{
    myprintf("aaa|%d|%10s|%c|%o|%x|aa|%%", 1, "aaaaa",'a',19,26);
    return 1;
}

void print_base(int num,int base){
    int surplus = num % base;
    int quotient = num / base;

    if(quotient != 0){
        print_base(quotient,base);
    }

    if(surplus >= 10){
        
        print_char('a' + surplus - 10);

    }else{

        print_int(surplus);

    }
    return;    
}

void myprintf(char *fmt, ...)
{
    int leftrange = 0;
    int rightrange = 0;
    int flg = 0;
    int count = 0;

    char *p = (char *)&fmt + ROUNDUP_SIZEOF(fmt);
    while (*fmt)
    {
        if (*fmt == '%')
        {
            fmt++;

            leftrange = 0;
            rightrange = 0;
            while((*fmt >= '0' && *fmt <= '9') || *fmt == '.'){
                if(flg){
                    rightrange = rightrange * 10 + (*fmt - '0');
                }else{
                    leftrange = leftrange * 10 + (*fmt - '0');
                }
                
                if(*fmt == '.'){
                    flg = 1;
                }
                fmt++;
            }
            flg = 0;
            count = 0;

            switch (*fmt)
            {
            case 'c':
                print_char(*(char *)p); //syscallsに新しく追加した（レポートに書く）
                p += ROUNDUP_SIZEOF(char);
                break;
            case 's':
                for(count = 0;count < leftrange - strlen(*(char **)p);count++){
                    print_char(' ');
                }
                print_string(*(char **)p);
                p += ROUNDUP_SIZEOF(char*);
                break;
            case 'd':
                print_int(*(int *)p);
                p += ROUNDUP_SIZEOF(int);
                break;
            case 'o':
                print_base(*(int *)p,8);
                p += ROUNDUP_SIZEOF(int);
                break;
            case 'x':
                print_base(*(int *)p,16);
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
