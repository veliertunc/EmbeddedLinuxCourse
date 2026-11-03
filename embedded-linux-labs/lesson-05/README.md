# Lesson 5 · Read a log in C

In Lesson 4, `sh status.sh` worked because the shell could read the script. Running `./status.sh` directly required execute permission on the script.

This time you'll build a C program that opens a log and prints it line by line. Later, we'll build a program like this for an embedded target.

## Build and run

Open your Linux shell and change into this lesson directory in your checkout. You need a C compiler and Make. On Debian or Ubuntu, install them with `sudo apt install build-essential` if they're missing.

```sh
make
./showlog ../lesson-02/boot.log
```

Make uses the rule in `Makefile` to build the `showlog` executable from `showlog.c`. Run `make` again and notice that it skips compilation when the executable is up to date.

## Read the source

- `argc` counts the command-line arguments, including the program name. `argv[1]` holds the log path.
- `fopen` opens the file for reading. If it returns `NULL`, `perror` prints the path and the reason the open failed.
- `fgets` reads into a fixed-size buffer. A long line can arrive in several chunks, which `fputs` prints in order.
- `fclose` closes the file. Returning `0` from `main` signals success to the shell.

## Checkpoint

Run each pair of commands and compare the exit statuses.

```sh
./showlog ../lesson-02/boot.log
printf 'Exit status = %s\n' "$?"
./showlog ./missing.log
printf 'Exit status = %s\n' "$?"
```

Then pipe the program's output into `grep` to show only lines starting with `ERROR`. Which part of your command opens the log, and which part filters it?
