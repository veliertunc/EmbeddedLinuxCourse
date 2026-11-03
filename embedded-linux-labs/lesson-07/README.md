# Lesson 7 · Inspect a running Linux system

Lesson 6 ended with a question about running an x86-64 program on an AArch64 board. You'd rebuild it with a compiler and libraries that target AArch64. We'll do that after getting a Linux guest to boot.

## Follow the boot sequence

On a typical board, firmware starts a bootloader, which loads the Linux kernel. The kernel initializes the system and launches its first userspace process, PID 1. If the kernel receives an initramfs containing an executable `/init`, it can run that script as PID 1. The script can start a shell for a minimal lab or prepare and switch to a persistent root filesystem.

## Inspect the result

From this lesson directory in your Linux shell, run:

```sh
sh inspect-boot.sh
```

The script reads three entries under `/proc`, a virtual filesystem that exposes information from the running kernel.

- `/proc/cmdline` shows the arguments passed to the kernel. If you see `console=`, it names a destination for kernel console output.
- `/proc/mounts` lists mounts visible to the script. The row mounted at `/` tells you the source and type of your current root filesystem.
- `/proc/1/comm` shows the name of the process visible as PID 1. The name depends on your environment. A Linux VM, WSL, and a container can show different results.

## Checkpoint

Identify your root filesystem type and the name of PID 1. Then explain how you'd tell whether you were looking at a kernel argument or a setting of a running process. In the next lab, you'll supply a kernel argument yourself and see its effect on a QEMU guest.
