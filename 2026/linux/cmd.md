. –------> Search from current directory.

/ –------> Search from root directory (entire filesystem).

1. Sort Command (Linux)

su -                  # Switch to administrator (root) user

cat > file1           # Create and write data into file1
Ctrl + D              # Save and exit

sort file1            # Display data in ascending order (A to Z)

sort -r file1         # Display data in descending order (Z to A)

sort -u file1         # Display sorted unique lines (remove duplicates)
                      # Does NOT modify original file1
                      # Original file1 remains unchanged

sort -u file1 > file2 # Save sorted unique data into file2
                      # Original file1 remains unchanged

sort -u file1 -o file1 # Sort, remove duplicates and update original file1


2] sed Command

cat > file1              # Create and write data into file1
Ctrl + D                 # Save and exit

sed 's/old/new/' file1   # Replace first occurrence of old with new in each line
                         # Original file1 remains unchanged

sed 's/old/new/g' file1 # Replace all occurrences of old with new in each line
                         # Original file1 remains unchanged

sed -n '2p' file1       # Display only the second line

sed '2d' file1          # Delete the second line from output
                         # Original file1 remains unchanged

sed 's/old/new/' file1 > file2
                         # Replace text and save output in file2
                         # Original file1 remains unchanged

sed -i 's/old/new/g' file1
                         # Replace all occurrences and update original file1

3] find Command

## 3. FIND Command (Linux)

FIND is used to search for files and directories in Linux.

bash

```bash
find                 # Display files and directories in current location

find /home -name file1
                     # Search for file1 in /home directory

find . -name file1   # Search for file1 in current directory and subdirectories

find . -name "*.txt" # Search all .txt files

find . -type f       # Display only files

find . -type d       # Display only directories

find . -name file1 -delete
                     # Find and delete file1
```

Important:

- `-name` – Search by filename.
- `-type f` – Search files.
- `-type d` – Search directories.
- `.` – Current directory.
- `-delete` – Delete matching files.


-----------
```bash

find . -mtime 0       # Files modified within the last 24 hours

find . -mtime 1       # Files modified 1 day ago (24–48 hours)

find . -mtime +7      # Files modified more than 7 days ago

find . -mtime -7      # Files modified within the last 7 days


-----------

`-type` is used with the find command to search for specific types of files and directories.

bash

```bash
find / -type f    # Search all files from root directory

find / -type d    # Search all directories from root directory

find . -type f    # Search files in current directory

find . -type d    # Search directories in current directory
```

Important:

- `-type f` – Regular files.
- `-type d` – Directories.
- `-type l` – Symbolic links.
- `-type c` – Character devices.
- `-type b` – Block devices.