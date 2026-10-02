---
title: 'Bash: check if a zip or a rar file has password-protection'
description: Two short Bash snippets to detect whether a zip or rar archive is password-protected.
date: 2015-07-25T12:14:05+00:00
url: /bash-check-if-a-zip-or-a-rar-file-has-password-protection/
categories:
  - IT
  - Linux
tags:
  - check password
  - rar
  - unrar
  - unzip
  - zip

---
## ZIP

```bash
crypted=$( 7z l -slt -- "$file" | grep -i -c "Encrypted = +" )
if [ "$crypted" -ge 1 ]; then
    protected=1
fi
```

## RAR

```bash
unrar x -p- -y -o+ "$file" > /dev/null 2>&1
if [ "$?" -eq 3 ]; then
    # exit code 3 means the archive needs a password
    unrar x -p"$password" -y -o+ "$file" > /dev/null 2>&1
fi
```

Source: <https://supportex.net/blog/2011/08/bash-check-zip-rar-file-password-protection/>
