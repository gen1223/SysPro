// choi++20201201 lab11-a
//      display sub-directories and files using dir-system calls

#include <stdio.h>
#include <string.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#define TRUE 1
#define FALSE 0

int dis_subdir(const char *path, int f) {
    DIR * dp = NULL;
    struct dirent *file = NULL;
    struct stat buf;
    char filename[1024];

    if((dp = opendir(path)) == NULL) {
        return -1;
    }

    // display current directory
    printf("[%s]\n", path);

    // display sub-directories
    while ((file = readdir(dp)) != NULL) {
        if (strcmp(file->d_name, ".") == 0 || strcmp(file->d_name, "..") == 0)
            continue;
        sprintf(filename, "%s/%s", path, file->d_name);
        if (stat(filename, &buf) == -1)
            continue;
        if (S_ISDIR(buf.st_mode))
            dis_subdir(filename, f);
        else if (S_ISREG(buf.st_mode) && f)
            printf("%s\n", file->d_name);
    }

    // end of directory
    closedir(dp);
    return 0;
}

int main(int argc, char **argv) {
    struct stat file_stat;
    int f;

    switch (argc) {
        case 3:
            if (strcmp(argv[2], "-f") == 0)
                f = TRUE;
            else
                f = FALSE;
        case 2:
            stat(argv[1], &file_stat);
            if (S_ISDIR(file_stat.st_mode)) {
                dis_subdir(argv[1], f);
                break;
            }
        default:
            fprintf(stderr, "usage: %s <dir-name>\n", argv[0]);
    }
    return 0;
}
