## Linux Redirection Operators

1. `<` (Input Redirection) Takes input from a file instead of the keyboard.

Example:

bash

```bash
cat < file.txt
```

2. `>` (Output Redirection) Saves command output into a file. Old content is overwritten.

Example:

bash

```bash
echo Hello > file.txt
```

3. `>>` (Append Redirection) Adds new output at the end of a file without deleting old content.

Example:

bash

```bash
echo Hello >> file.txt
```

4. `2>` (Error Redirection) Saves error messages into a file.

Example:

bash

```bash
ls abc 2> error.txt
```

5. `2>>` (Append Error Redirection) Adds error messages to the end of a file.

Example:

bash

```bash
ls abc 2>> error.txt
```

6. `&>` (Output and Error Redirection) Saves both normal output and error messages into one file.

Example:

bash

```bash
ls /home &> output.txt
```

## File Descriptors

- `0` – STDIN (Input)
- `1` – STDOUT (Normal Output)
- `2` – STDERR (Error Output)