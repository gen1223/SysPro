#include<stdio.h>
int main()
{
    int num = 0;
    char c;
    char hex[] = "0123456789ABCDEF";
    do {
        c = getchar();
    /* if digits were input */
        if( c >= '0' && c <= '9' )
        {
            num += c - '0';
        }
    } while( c != '\n' ); // escape on newline
    int mask = 0xf;
    int masked_num;
    int cnt = 0;
    do {
        cnt++; // Count till 8 shifts
    // Rotate number to see 4 remained MSBs
        num = (num << 4) | (num >> 28);
    // Mask originally 4 remained MSBs, which are now 4 LSBs
        masked_num = num & mask;
    // Print hex digit for masked_num
        putchar(hex[masked_num]);
    } while (cnt < 8);
    putchar('\n');
}
