/* $begin statcheck */
#include <unistd.h>
#include <stdio.h>
#include <sys/stat.h>

int main (int argc, char **argv)
{
    struct stat file_stat;
    char *type, *readok;

    /* $end statcheck */
    if (argc != 2) {
	    fprintf(stderr, "usage: %s <filename>\n", argv[0]);
	    exit(0);
    }

    /* $begin statcheck */
    stat(argv[1], &file_stat);
    if (S_ISREG(file_stat.st_mode))     /* Determine file type */
	    type = "regular";
    else if (S_ISDIR(file_stat.st_mode))
	    type = "directory";
    else
	    type = "other";
    if ((file_stat.st_mode & S_IRUSR)) /* Check read access */
	    readok = "yes";
    else
	    readok = "no";

    printf("type: %s, read: %s\n", type, readok);
    exit(0);
}
/* $end statcheck */
