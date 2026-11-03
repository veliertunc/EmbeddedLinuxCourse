#include <stdio.h>

int main(int argc, char *argv[])
{
    char line[256];

    if (argc != 2) {
        fprintf(stderr, "Usage: %s LOG_FILE\n", argv[0]);
        return 2;
    }

    FILE *log = fopen(argv[1], "r");
    if (log == NULL) {
        perror(argv[1]);
        return 1;
    }

    while (fgets(line, sizeof line, log) != NULL) {
        if (fputs(line, stdout) == EOF) {
            perror("stdout");
            fclose(log);
            return 1;
        }
    }

    if (ferror(log)) {
        perror(argv[1]);
        fclose(log);
        return 1;
    }

    fclose(log);
    if (fflush(stdout) == EOF) {
        perror("stdout");
        return 1;
    }

    return 0;
}
