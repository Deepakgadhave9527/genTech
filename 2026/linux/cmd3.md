## Here are the 4 basic Linux user management commands (CMC):

1. Creat.  ===> 
##   sudo useradd -m rahul
   
2. Modify User.  ===> 
##   sudo usermod -aG developers rahul
   
3. Delete User.  ===> 
##   sudo userdel -r rahul
   
4. Change User Password.  ===> 
##   sudo passwd rahul
   


# Linux User Management – All Commands One-Liner Cheat Sheet


## 1. User creation commands

1. Create User ===\> `sudo useradd john`
2. Create User with Home Directory ===\> `sudo useradd -m john`
3. Create User with Bash Shell ===\> `sudo useradd -m -s /bin/bash john`
4. Create User with Specific UID ===\> `sudo useradd -u 1050 -m john`
5. Create User with Custom Home Directory ===\> `sudo useradd -m -d /app/john john`
6. Create User with Comment ===\> `sudo useradd -m -c "DevOps Engineer" john`
7. Create User with Primary Group ===\> `sudo useradd -m -g developers john`
8. Create User with Supplementary Group ===\> `sudo useradd -m -G developers john`
9. Create User with No Login Shell ===\> `sudo useradd -s /usr/sbin/nologin appuser`
10. Create User Interactively (Ubuntu) ===\> `sudo adduser john`
11. Set User Password ===\> `sudo passwd john`
12. Create System User ===\> `sudo useradd -r -s /usr/sbin/nologin appuser`

## 2. User modification commands

1. Change Username ===\> `sudo usermod -l newjohn john`
2. Change Home Directory ===\> `sudo usermod -d /home/devjohn -m john`
3. Change Login Shell ===\> `sudo usermod -s /bin/bash john`
4. Lock User Account ===\> `sudo usermod -L john`
5. Unlock User Account ===\> `sudo usermod -U john`
6. Add Supplementary Group ===\> `sudo usermod -aG developers john`
7. Replace Supplementary Groups ===\> `sudo usermod -G developers,devops john`
8. Change Primary Group ===\> `sudo usermod -g devops john`
9. Change User UID ===\> `sudo usermod -u 1050 john`
10. Change User Comment ===\> `sudo usermod -c "Senior DevOps Engineer" john`
11. Set Account Expiry Date ===\> `sudo usermod -e 2027-12-31 john`
12. Move Home Directory ===\> `sudo usermod -d /data/john -m john`
13. Change User Shell to Nologin ===\> `sudo usermod -s /usr/sbin/nologin john`

## 3. User deletion commands

1. Delete User ===\> `sudo userdel john`
2. Delete User with Home Directory ===\> `sudo userdel -r john`
3. Delete User Interactively (Ubuntu) ===\> `sudo deluser john`
4. Delete User and Home Directory (Ubuntu) ===\> `sudo deluser --remove-home john`
5. Check User Before Deletion ===\> `id john`
6. Find Files Owned by User ===\> `sudo find / -xdev -user john`
7. Check User Processes ===\> `pgrep -a -u john`

## 4. User information commands

1. Check Current User ===\> `whoami`
2. Check User ID and Group ID ===\> `id john`
3. Check Current User ID ===\> `id -u`
4. Check Current User Groups ===\> `groups`
5. Check Specific User Groups ===\> `groups john`
6. List All Linux Users ===\> `cat /etc/passwd`
7. List Usernames Only ===\> `cut -d: -f1 /etc/passwd`
8. Find Specific User ===\> `getent passwd john`
9. Check User Home Directory ===\> `getent passwd john | cut -d: -f6`
10. Check User Login Shell ===\> `getent passwd john | cut -d: -f7`
11. Check UID and GID ===\> `id -u john && id -g john`
12. List Currently Logged-in Users ===\> `who`
13. Show Login History ===\> `last`
14. Show Failed Login Attempts ===\> `sudo lastb`
15. Check User Account Details ===\> `sudo chage -l john`

## 5. User password management commands

1. Change User Password ===\> `sudo passwd john`
2. Change Current User Password ===\> `passwd`
3. Lock Password ===\> `sudo passwd -l john`
4. Unlock Password ===\> `sudo passwd -u john`
5. Check Password Status ===\> `sudo passwd -S john`
6. Force Password Change at Next Login ===\> `sudo passwd -e john`
7. Set Maximum Password Age to 90 Days ===\> `sudo chage -M 90 john`
8. Set Minimum Password Age to 7 Days ===\> `sudo chage -m 7 john`
9. Set Password Warning Period to 7 Days ===\> `sudo chage -W 7 john`
10. Set Password Inactive Period to 30 Days ===\> `sudo chage -I 30 john`
11. Set Account Expiry Date ===\> `sudo chage -E 2027-12-31 john`
12. View Password Expiry Information ===\> `sudo chage -l john`
13. Force Password Change on Next Login ===\> `sudo chage -d 0 john`

## 6. Group creation commands

1. Create Group ===\> `sudo groupadd developers`
2. Create Group with Specific GID ===\> `sudo groupadd -g 2000 developers`
3. Create System Group ===\> `sudo groupadd -r appgroup`
4. Delete Group ===\> `sudo groupdel developers`
5. Rename Group ===\> `sudo groupmod -n devteam developers`
6. Change Group GID ===\> `sudo groupmod -g 3000 developers`
7. List All Groups ===\> `cat /etc/group`
8. List Group Names Only ===\> `cut -d: -f1 /etc/group`
9. Check Specific Group ===\> `getent group developers`
10. Check Current User Groups ===\> `id -Gn`

## 7. Group management commands

1. Add User to Group ===\> `sudo usermod -aG developers john`
2. Add User to Multiple Groups ===\> `sudo usermod -aG developers,devops john`
3. Change Primary Group ===\> `sudo usermod -g developers john`
4. Remove User from Group ===\> `sudo gpasswd -d john developers`
5. List Group Members ===\> `getent group developers`
6. Check User Group Membership ===\> `groups john`
7. Check Group ID ===\> `getent group developers | cut -d: -f3`
8. Check All Groups of User ===\> `id john`

## 8. Sudo access management commands

1. Add User to Sudo Group (Ubuntu) ===\> `sudo usermod -aG sudo john`
2. Add User to Wheel Group (RHEL) ===\> `sudo usermod -aG wheel john`
3. Check User Sudo Permissions ===\> `sudo -l -U john`
4. Edit Sudoers File Safely ===\> `sudo visudo`
5. Edit Sudoers Drop-in Configuration ===\> `sudo visudo -f /etc/sudoers.d/john`
6. Validate Sudoers Configuration ===\> `sudo visudo -c`
7. Check Current Sudo Permissions ===\> `sudo -l`
8. Execute Command as Another User ===\> `sudo -u john whoami`
9. Switch to Root User ===\> `sudo -i`
10. Execute Command as Root ===\> `sudo systemctl status nginx`

## 9. SSH user management commands

1. Generate SSH Key ===\> `ssh-keygen -t ed25519`
2. Copy SSH Public Key to Server ===\> `ssh-copy-id john@SERVER_IP`
3. Connect to Remote Server ===\> `ssh john@SERVER_IP`
4. Connect Using Specific Private Key ===\> `ssh -i ~/.ssh/id_ed25519 john@SERVER_IP`
5. Copy File to Remote Server ===\> `scp file.txt john@SERVER_IP:/tmp/`
6. Copy File from Remote Server ===\> `scp john@SERVER_IP:/tmp/file.txt .`
7. Check SSH Directory Permissions ===\> `ls -ld /home/john/.ssh`
8. Set SSH Directory Permissions ===\> `chmod 700 /home/john/.ssh`
9. Set Authorized Keys Permissions ===\> `chmod 600 /home/john/.ssh/authorized_keys`
10. View Authorized SSH Keys ===\> `sudo cat /home/john/.ssh/authorized_keys`
11. Check SSH Service Status (Ubuntu) ===\> `sudo systemctl status ssh`
12. View SSH Authentication Logs (Ubuntu) ===\> `sudo tail -f /var/log/auth.log`

## 10. Switch user and session management commands

1. Switch to Another User ===\> `su - john`
2. Switch to Root User ===\> `sudo su -`
3. Execute Command as Another User ===\> `sudo -u john whoami`
4. Check Current Username ===\> `whoami`
5. Check Logged-in Users ===\> `w`
6. List Active Sessions ===\> `who -u`
7. View Login History ===\> `last john`
8. Terminate User Processes ===\> `sudo pkill -u john`
9. Check User Processes ===\> `ps -u john`
10. Check User Process Count ===\> `ps -u john --no-headers | wc -l`

## 11. Important Linux user and group files

1. View User Account File ===\> `cat /etc/passwd`
2. View Password Hash File ===\> `sudo cat /etc/shadow`
3. View Group File ===\> `cat /etc/group`
4. View Secure Group File ===\> `sudo cat /etc/gshadow`
5. View Default User Settings ===\> `cat /etc/default/useradd`
6. View Password Policy Settings ===\> `cat /etc/login.defs`
7. Check User Creation Defaults ===\> `useradd -D`
8. Check Shadow File Permissions ===\> `ls -l /etc/shadow`
9. Check Passwd File Permissions ===\> `ls -l /etc/passwd`

## 12. Production-level user troubleshooting commands

1. Find Files Owned by User ===\> `sudo find / -xdev -user john 2>/dev/null`
2. Find Files Owned by Group ===\> `sudo find / -xdev -group developers 2>/dev/null`
3. Check User's Running Processes ===\> `ps -fu john`
4. Check User Login Failures ===\> `sudo grep -i "failed" /var/log/auth.log`
5. Check SSH Authentication Logs ===\> `sudo journalctl -u ssh`
6. Check User Account Expiry ===\> `sudo chage -l john`
7. Check User's Sudo Access ===\> `sudo -l -U john`
8. Check User's Primary Group ===\> `id -gn john`
9. Check User's Home Directory Permissions ===\> `ls -ld /home/john`
10. Check User's Shell ===\> `getent passwd john | cut -d: -f7`
11. Check User's UID ===\> `id -u john`
12. Check Whether User Exists ===\> `id john`
13. Check File Ownership ===\> `stat /app/project`
14. Check Active User Sessions ===\> `who`

## 13. Most important commands to memorize for DevOps

Top 20 commands| No. | Command | Purpose |
| --- | --- | --- |
| 1 | `useradd -m john` | Create user |
| 2 | `passwd john` | Set password |
| 3 | `usermod -l newjohn john` | Rename user |
| 4 | `usermod -aG devops john` | Add group |
| 5 | `usermod -g devops john` | Change primary group |
| 6 | `usermod -L john` | Lock account |
| 7 | `usermod -U john` | Unlock account |
| 8 | `userdel -r john` | Delete user and home |
| 9 | `groupadd devops` | Create group |
| 10 | `groupdel devops` | Delete group |
| 11 | `gpasswd -d john devops` | Remove from group |
| 12 | `id john` | Check user information |
| 13 | `groups john` | Check groups |
| 14 | `chage -l john` | Check password aging |
| 15 | `chage -M 90 john` | Set max password age |
| 16 | `sudo -l -U john` | Check sudo access |
| 17 | `su - john` | Switch user |
| 18 | `getent passwd john` | Get user information |
| 19 | `getent group devops` | Get group information |
| 20 | `ssh john@SERVER_IP` | Connect to server |

Production safety tips:

- Always use `usermod -aG` instead of `usermod -G` when adding supplementary groups.
- Don't delete users before checking their processes and file ownership.
- Use `visudo` for sudo permission changes.
- Never share password hashes or private SSH keys.
- Test SSH and sudo access before closing your existing administrative session.

Next recommended topic: Linux File Permissions – `chmod`, `chown`, `chgrp`, `umask`, SUID, SGID and Sticky Bit.