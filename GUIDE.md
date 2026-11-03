# Embedded Linux from scratch

By the end of this roadmap, you'll be able to build a small Linux image, boot it in an emulator, run your own application on it, and diagnose common boot and runtime failures.

## How we'll work

Start with a Linux development environment and use QEMU as the target. A board is optional until the hardware phase. On Windows, use WSL 2 or a Linux virtual machine for the command-line labs. We'll start with an emulated x86-64 target to learn the boot flow, then move to AArch64 to practice cross-compilation.

Learn one concept at a time, try it in a lab, then repeat the lab without the walkthrough. Save commands, version numbers, and useful error messages as you go. Move on when you can demonstrate the checkpoint.

## Roadmap

| Phase | What you'll learn | Lab | Checkpoint |
| --- | --- | --- | --- |
| 1. Linux basics | Shell, paths, files, permissions, pipes, processes, and exit codes | Create a lab directory, redirect command output into a log, and start and stop a background process | Explain a permission error and identify a running process by PID |
| 2. C and build tools | C basics, pointers, file I/O, compiler warnings, Make, and Git | Write a small program that reads a file, build it with Make, and inspect it with `file` and `readelf` | Rebuild from a clean directory and explain how the source becomes an executable |
| 3. Boot and root filesystem | Firmware, bootloader, kernel, initramfs, root filesystem, and PID 1 | Boot a Linux kernel directly in QEMU with a minimal BusyBox initramfs and an `/init` script | Reach a serial shell and explain which boot stages QEMU's direct kernel boot bypasses |
| 4. Cross-compilation | Host versus target, instruction sets, ELF, and static versus dynamic linking | Cross-compile your C program for AArch64, inspect its ELF header, and run it in an AArch64 QEMU guest | Diagnose a wrong-architecture binary and explain how a missing dynamic loader can prevent a binary from running |
| 5. Buildroot | Toolchains, kernel configuration, packages, and reproducible image builds | Build a QEMU image and add your application as a package | Rebuild from a saved configuration and confirm your application is present in the resulting image |
| 6. Debugging and networking | Serial logs, `dmesg`, `/proc`, `/sys`, network interfaces, and service startup | Start your application at boot, then deliberately break its startup and diagnose it from the console | Locate the failure, fix it, and confirm the fix after a reboot |
| 7. Hardware and device tree | Board boot flow, serial console, device tree, and driver binding | Inspect the device tree of an AArch64 QEMU guest. If you have a board, capture its serial boot log and identify a peripheral | Trace a peripheral from its device tree node to the driver that handles it |
| 8. Capstone | Putting the system together and handing it off | Build a minimal image that starts a small status service and reports uptime over the network | Rebuild and boot the image from your written instructions, reach the service from the host, and verify it returns after reboot |

After the capstone, explore Yocto and BitBake if your projects use layers and recipes, or go deeper into kernel drivers if your projects need custom hardware support.

## First lesson

We'll set up or verify your Linux environment, then use `pwd`, `ls`, `mkdir`, `cd`, `printf`, and `cat` to create and inspect your first lab log. By the end, you'll be able to tell where you are in the filesystem, explain the difference between relative and absolute paths, and save command output to a file.
