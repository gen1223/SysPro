#include <stdlib.h>
#include <stdio.h>

main() {
    while (1) {
        if ((putc('.', stdout)==EOF))   // stderr needs no 'fflush'
                exit(0);
        fflush(stdout);
        sleep(1);
    }
}
