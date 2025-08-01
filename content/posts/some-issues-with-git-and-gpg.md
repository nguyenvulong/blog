---
title: Some issues with git and gpg
author: admin
type: post
date: 2022-06-11T17:01:30+00:00
url: /some-issues-with-git-and-gpg/
categories:
  - IT
tags:
  - git
  - gpg
  - signing

---
[Read here if you want to stumble upon some interesting URLs][1] (my repo)

Key takeaways:

**make sure to configure** your username, email, and gpg private key, sometimes even gpg version

<pre class="wp-block-code"><code class="">git config --global --list</code></pre>

**you can get some info** here about your key, after generating your key

<pre class="wp-block-code"><code class="">gpg --list-secret-keys --keyid-format=long</code></pre>

if you got that error while executing `gpg -a --export your@email` then try these commands instead, in order to get your public key to provide to github (or gitlab)

<pre class="wp-block-code"><code class="">gpg --armor --export 7E98CBC76F9B33F8 to get pub key
OR gpg --export -a  5E0E8CB44844126F (key id)</code></pre>

**Make sure to**



<pre class="wp-block-code"><code class="">export GPG_TTY=$(tty)</code></pre>

If shit still happens

see if any errors here

<pre class="wp-block-code"><code class="">systemctl --user status gpg-agent</code></pre>

and try my last resort

<pre class="wp-block-code"><code lang="bash" class="language-bash">❯ cat  ~/.gnupg/gpg-agent.conf
pinentry-program /usr/bin/pinentry-curses</code></pre>

 [1]: https://github.com/nguyenvulong/QA/issues/25
