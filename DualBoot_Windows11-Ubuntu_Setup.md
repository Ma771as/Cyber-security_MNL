# Dual-Boot Setup: Adding Ubuntu to a Windows 11 System
## Overvierw
Different OS (*Operating Systems*) possess features that can be beneficial for specific fields. Nevertheless, just like switching careers, changing OS can be very challenging, but depending the choosen path also very rewarding.
CLI (*Command-Line Interface*) based OS such as Linux can be especially frightening for the level of technicalities that implies navigating a system trough commands and stopping relying on GUI (*Graphical-User Interface*).
To make the transition softer, and to continue to benefit from the features that we are already used to, I found *Dual-Boot Configuarion* to be the more balanced solution, offering: New specialized working tools more compatible to my career decisions, while maintaning comfort and access to a more familiar setup at least, while going trough the learning-curve and adapting to the new system.

## UBUNTU
Altough CLI based OS such as Linux can be intimidating, requiring deep understanding of the System Architecture to be able to navigate it efficently (especially for work purposes) Ubuntu offers a intuitive and beginner-friendly CUI (called GNU) which further facilitate the task of getting started with the new uses for our OS.

## Prerequisites
The stated represent the minimum requirement for the operation to be successfull. Higher standard/better equipment will impact positively the outcome but are not specifically required.

#### System Specifications Review
- Processor Dual-core 2
- 8 GB RAM
- At least 50 GB of free space on drive
- Confirm access to UEFI/BIOS to change boot order and settings
- Verify the SHA256 checksum

#### Required Tools Review
- Ubuntu ISO
- USB Flash Drive (at least 4 GB)
- Tool for bootable USB creation (the following project, being Windows11 based will make use of Rufus)

#### Preventive steps
Before beginning is important to:
- Backup important Data
- Disable Fast Startup (Control Panel > Power options > Choose what the power buttons do > **Uncheck** Turn on fast startup)
- Disable BitLocker if enabled

## Memory Partition
This section is dedicated on explaining how to allocate space for Ubuntu in the Disk.
1. Access Disk Management:
    - Open Disk management 