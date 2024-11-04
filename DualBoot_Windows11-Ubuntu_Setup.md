# Dual-Boot Setup: Adding Ubuntu to a Windows 11 System
## Table of Content
1. [General Info](#overvierw)
2. [Why ubuntu?](#ubuntu)
3. [Prerequisites](#prerequisites)
    - [System Specifications](#system-specifications-review)
    - [Required Tools](#required-tools-review)
    - [Preventive Steps](#preventive-steps)
4. [Memory Partiton](#memory-partition)
5. [Procedure](#installing-ubuntu)
6. [Post Installation](#post-installation-security-hardening)
7. [Other tools](#other-tools)
8. [Additional Resources](#additional-resources-credits)



## Overvierw
Different OS (*Operating Systems*) possess features that can be beneficial for specific fields. Nevertheless, just like switching careers, changing OS can be very challenging, but depending on the chosen path also very rewarding.
CLI (*Command-Line Interface*) based OS such as Linux can be especially frightening for the level of technicalities that implies navigating a system trough commands and stopping relying on GUI (*Graphical-User Interface*).
To make the transition softer, and to continue to benefit from the features that we are already used to, I found *Dual-Boot Configuarion* to be the more balanced solution, offering: New specialized working tools more compatible to my career decisions, while maintaning comfort and access to a more familiar setup at least, while going trough the learning-curve and adapting to the new system.


## UBUNTU
Although CLI based OS such as Linux can be intimidating, requiring deep understanding of the System Architecture to be able to navigate it efficiently (especially for work purposes) Ubuntu offers an intuitive and beginner-friendly GUI (called GNU) which further facilitate the task of getting started with the new uses for our OS.


## Prerequisites
The stated represent the minimum requirement for the operation to be successful. Higher standard/better equipment will impact positively the outcome but are not specifically required.

#### System Specifications Review
- Processor Dual-core 2
- 8 GB RAM
- At least 50 GB of free space on drive
- Confirm access to UEFI/BIOS to change boot order and settings
- Verify the SHA256 checksum

#### Required Tools Review
- Ubuntu ISO
- USB Flash Drive (at least 4 GB)
- Tool for bootable USB creation (the following project, being Windows11 based, will make use of Rufus)

#### Preventive steps
Before beginning is important to:
- Backup important Data
- Disable Fast Startup (`Control Panel > Power options > Choose what the power buttons do > **Uncheck** Turn on fast startup`)
- Disable BitLocker if enabled


## Memory Partition
This section is dedicated on explaining how to allocate space for Ubuntu in the Disk.
1. Access Disk Management:
    - Open Disk management 
    - Right click on the Main Windows partition (typically `C:`) and select *Shrink Volume*
    - Specify the amount of space to shrink, minimum 50 GB
**Desired Output:** There is now unallocated space on the disk (Destined for the installation of Ubuntu)


## Installing Ubuntu
To successfully install Ubuntu, we need to have it saved in the USB flash-drive. Afterwards we will be able to run the installation by inserting this Bootable Unit.

### Create a Bootable Ubuntu USB
1. Insert the USB flash-drive in the Computer, we must make sure all information inside the USB as been correctly backed-up for during the installation the memory will be formatted.
2. For the completion of this step we require to install both the Ubuntu ISO from the official website (https://ubuntu.com/download/desktop), in this case I opted the *Ubuntu 24.041 LTS*.
3. While the Download of the Ubuntu file is still in process, head to the Rufus website (https://rufus.ie/en/) and install the most recent version.
4. After completing the download the Rufus interface will prompt for the data to configure the Bootable USB.
    1. It appears as auto-completed, but we must make sure the *Device* is correctly selecting the USB we intend to use for the installation.
    2. In *Boot Selection*, we need to make sure to select the correct Ubuntu ISO from our files (the one we previously downloaded).
    3. In *Partition scheme* we should select the option that best suits our specific Computer (in my case was GPT).
    4. In *Target System*, we should select the option that best suits our specific Computer (in my case was UEFI).
    5. after ensuring the information is complete and correct we can click on START.
    6. We can select the 0k/yes option for the warning message prompted, yet is still recommendable to read the content and be sure of what we are agreeing on.
5. Once the process is complete we can now restart the compute (the USB must be plugged) and enter the option BIOS/UEFI during Boot (In my case was the F10 button but it may vary depending the model of the computer)
6. Change the Boot order to prioritize the USB drive, then save and exit.
7. Select try Ubuntu to load the live session and test compatibility.
8. Select Install Ubuntu on the desktop > Install ubuntu alongside Windows Boot Manager.

**ADVICE:** the latest option may not be available, in such case it would be necessary to execute the manual partitioning.

9. **Encryption** select encrypt the new Ubuntu installation for security to enable LUKS encryption (set a strong pass-phrase)
*the last steps of the installation are very beginner friendly and are based on personal taste and necessities therefore won-t be covered here.*
10. Remove the USB when prompted.

## Post-Installation Security hardening

### Windows 11
- Re-enable BitLocker if it was disabled for the installation.
- Ensure Windows Defender Firewall is active.
- Update Windows 
*Normally I have it disabled, yet after this kind of procedures is good-practice to ensure that the **remote access** is still off*

### Ubuntu
- Enable the Uncomplicated Firewall (UFW).
    click `ctrl+alt+t` to open the terminal then run the `sudo ufw enable` command
- Set up automatic updates to keep your system secure.
    run the `sudo apt upgrade && sudo apt upgrade -y` command in the terminal

### Shared security Measures
- Install a VPN client in both OS to secure the internet traffic.
- Enable secure Boot in BIOS/UEFI to prevent unauthorized OS loading.
- Use strong passwords ideally follow the advice:
    1. **NEVER** use personal information such as your name, birthday, user-name, or e-mail address.
    2. Use at least 6 characters (ideally more)
    3. Include numbers, symbols, and both uppercase and lowercase letters.
    4. Avoid words that can be found in the dictionary.
    5. Ideally use a phrase not a word, or the first letters of each word from a phrase to create your password.

### Other tools
This project has the purpose to enable the experimentation with tools suitable for both the programmation and the cybersecurity field.
I installed a few tools to be able to run some tests and dive into more projects of this kind, under no circumstance this is a comprehensive guide of the tools needed to work in these fields, but I believe it to be a solid starting point.
The commands to install each program (or to check if they are already included in the distro you installed), his uses and functioning will also be discussed in future projects.

- **Web Development**
    - Google Chrome
    - Visual Studio Code
    - Git + creation of an SSH key
- **Cyber-security**
    - Nmap
    - Wireshark
    - Metasploit


## Additional Resources-Credits
- for [Windows and Ubuntu DualBoot Installation](https://ubuntu.com/tutorials)
- for [Cybersecurity for Ubuntu](https://help.ubuntu.com/community/Security)
- to [Secure Windows 11](https://learn.microsoft.com/en-us/windows/security/)
- to [Create strong password](https://edu.gcfglobal.org/en/techsavvy/password-tips/1/)
- on [Setting up an programming environment with DualBoot](https://www.theodinproject.com/lessons/foundations-installations)
- to [Set up Git](https://www.theodinproject.com/lessons/foundations-setting-up-git)

