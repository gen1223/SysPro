// choi++20201201 lab11-b
//      display sub-directories using dir-system calls

#include <stdio.h>
#include <string.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

int dis_subdir(const char *path) {
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
            dis_subdir(filename);
 //       else if (S_ISREG(buf.st_mode))
 //           printf("%s\n", file->d_name);
    }

    // end of directory
    closedir(dp);
    return 0;
}

int main(int argc, char **argv) {
    struct stat file_stat;

    if (argc != 2) {
        fprintf(stderr, "usage: %s <dir-name>\n", argv[0]);
        return 0;
    }
    stat(argv[1], &file_stat);
    if (S_ISDIR(file_stat.st_mode))
        dis_subdir(argv[1]);
    else
        fprintf(stderr, "usage: %s <dir-name>\n", argv[0]);
}
