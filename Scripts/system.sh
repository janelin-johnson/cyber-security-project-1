#!/bin/bash


#Prints the amount of free memory on the system and saves it to ~/backups/freemem/free_mem.txt.

grep MemTotal /proc/meminfo > ~/backups/freemem/free_mem.txt

#Prints disk usage and saves it to ~/backups/diskuse/disk_usage.txt.

df -H > ~/backups/diskuse/disk_usage.txt
#Lists all open files and saves it to ~/backups/openlist/open_list.txt.

lsof /dev/null

#Prints file system disk space statistics and saves it to ~/backups/freedisk/free_disk.txt.
du -H > ~/backups/freedisk/free_disk.txt



