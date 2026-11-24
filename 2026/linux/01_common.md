
```bash
find / -type f 2>/dev/null | wc -l
```

Counts all accessible regular files in the system starting from root (`/`), while suppressing permission-denied and other error messages.