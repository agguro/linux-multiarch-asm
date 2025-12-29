#define _GNU_SOURCE
#include <sys/mman.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>

#define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
                        } while (0)

int
main(int argc, char *argv[])
{
    int fd;
    unsigned int seals;
    char *addr;
    char *name, *seals_arg;
    ssize_t len;

    if (argc < 3) {
        
        fprintf(stderr, "%s name size [seals]\n", argv[0]);
        fprintf(stderr, "\t'seals' can contain any of the "
                "following characters:\n");
        fprintf(stderr, "\t\tg - F_SEAL_GROW\n");
        fprintf(stderr, "\t\ts - F_SEAL_SHRINK\n");
        fprintf(stderr, "\t\tw - F_SEAL_WRITE\n");
        fprintf(stderr, "\t\tW - F_SEAL_FUTURE_WRITE\n");
        fprintf(stderr, "\t\tS - F_SEAL_SEAL\n");
        exit(EXIT_FAILURE);
    }

    name = argv[1];
    len = atoi(argv[2]);
    seals_arg = argv[3];

    /* Create an anonymous file in tmpfs; allow seals to be
        placed on the file */

    fd = memfd_create(name, MFD_ALLOW_SEALING);
    if (fd == -1)
        errExit("memfd_create");

    /* Size the file as specified on the command line */

    if (ftruncate(fd, len) == -1)
        errExit("truncate");

    printf("PID: %ld; fd: %d; /proc/%ld/fd/%d\n",
            (long) getpid(), fd, (long) getpid(), fd);

    /* Code to map the file and populate the mapping with data
        omitted */

    /* If a 'seals' command-line argument was supplied, set some
        seals on the file */

    if (seals_arg != NULL) {
        seals = 0;

        if (strchr(seals_arg, 'g') != NULL)
            seals |= F_SEAL_GROW;
        if (strchr(seals_arg, 's') != NULL)
            seals |= F_SEAL_SHRINK;
        if (strchr(seals_arg, 'w') != NULL)
            seals |= F_SEAL_WRITE;
        if (strchr(seals_arg, 'W') != NULL)
            seals |= F_SEAL_FUTURE_WRITE;
        if (strchr(seals_arg, 'S') != NULL)
            seals |= F_SEAL_SEAL;

        if (fcntl(fd, F_ADD_SEALS, seals) == -1)
            errExit("fcntl");
    }

    /* Keep running, so that the file created by memfd_create()
        continues to exist */

    pause();

    exit(EXIT_SUCCESS);
}
