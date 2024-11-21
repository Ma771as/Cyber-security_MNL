# Password Generator Script
### Table of Content
1. [Before starting](#considerations)
2. [Project Overview](#overview)
3. [Features](#features)
4. [Utility](#what-is-the-script-for)
5. [Improvements](#areas-of-opportunity)
6. [Usage](#usage)

### Considerations
- **Operative System** The following project was realized on Ubuntu, a popular Linux distribution. But it can be replicated also on Windows or macOS (as long as we make sure to install/already have Bash)
- **Dependencies** `openssl` is also a *must have* for this project; if not already installed we can run:
    `sudo apt update && sudo apt install openssl`

## Overview
This is a simple bash script that generates secure password using `openssl`.
Allows users to customize the lenght of the password and includes both alphanumeric and special characters.
Core concept of this project are an understanding of basic bash-scripting skills, secure password generation techniques and automation concepts.

### Features
- **Customizable lenght:** User can specify the number of characters for needed for the password.
- **Secure and random:** `openssl` generates cryptographically secure strings.
- **Special characters:** Includes uppercase, lowecase, numbers and special character for enhanced security.
- **Automation:** Makes the password generation process quick and efficient.
### What is the script for?
- creating random and secure password for personal and professional use, perhaps while asigning a user to anew employee.
- Learning about bash scripting and automation.
- Understanding secure random number generation with `openssl`.
### Areas of opportunity
- save passwords to an encrypted file for easy retrieval.
- Build a menu-driven interface for ease of use.
### Usage
1. Clone this repository or Download the script.
2. Run the script using 
    `./pwgenerator.sh`
    or
    `bash pwgenerator.sh`
3. on the terminal you will be prompted for the lenght of the password. Use numbers not words:
    Correct Use
    `Please enter the required lenght:`
    `10`
    Inproper Use
    `Please enter the required lenght:`
    `ten`
4. The output should be a string of of random text, mixing numbers, letters (lowecase and uppercase) and special characters.