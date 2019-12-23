int primes_stat[10];

char *string_ptr = "ABCDEFG";
char string_ary[] = "ABCDEFG";

main()
{
    string_ptr = "AB";
    //string_ary = "AB"; コンパイルエラー発生
}