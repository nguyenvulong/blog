---
title: Some issues with git and gpg
description: Short troubleshooting notes for signing git commits with GPG, from key export to gpg-agent and pinentry problems.
date: 2022-06-11T17:01:30+00:00
url: /some-issues-with-git-and-gpg/
categories:
  - IT
tags:
  - git
  - gpg
  - signing
---
Related discussion (some interesting URLs) in [my QA repo](https://github.com/nguyenvulong/QA/issues/25).

Key takeaways:

**Make sure to configure** your username, email and GPG signing key, and sometimes check the GPG version too:

```bash
git config --global --list
```

**After generating your key**, you can see its info with:

```bash
gpg --list-secret-keys --keyid-format=long
```

If `gpg -a --export your@email` fails, try one of these instead to get your public key for GitHub (or GitLab):

```bash
gpg --armor --export 7E98CBC76F9B33F8
# or, using the key ID
gpg --export -a 5E0E8CB44844126F
```

**Make sure to set:**

```bash
export GPG_TTY=$(tty)
```

If it still fails, check for errors here:

```bash
systemctl --user status gpg-agent
```

As a last resort, change the pinentry program:

```bash
cat ~/.gnupg/gpg-agent.conf
# pinentry-program /usr/bin/pinentry-curses
```
