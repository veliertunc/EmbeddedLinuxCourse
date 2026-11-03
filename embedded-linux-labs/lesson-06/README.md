# Lesson 6 · From C source to an ELF executable

In Lesson 5, `./showlog ../lesson-02/boot.log | grep '^ERROR'` used `showlog` to open and print the file and `grep` to filter its output. A missing file gave `showlog` exit status 1.

## Build in two steps

In your Linux shell, open this lesson directory and run:

```sh
sh build.sh
./build/showlog ../lesson-02/boot.log
```

The script first uses `cc -c` to compile the source into `build/showlog.o`. This object file contains machine code and references to functions such as `fopen`. The second compiler command invokes the linker to combine the object file with the startup code and library information needed to produce `build/showlog`.

## Inspect both files

```sh
file build/showlog.o build/showlog
readelf -h build/showlog.o
readelf -h build/showlog
```

ELF is a file format Linux uses for object files, executables, and shared libraries. Find the `Type` and `Machine` fields in each header. The object file should have type `REL` (relocatable). The executable may have type `EXEC` or `DYN`, depending on whether your toolchain builds a position-independent executable by default.

## Checkpoint

Which `Machine` value did you get? Compare it with `uname -m`, which reports the architecture of your running Linux system. Then explain which build step produced the file you could run and why the machine field matters when you move the executable to a board.
