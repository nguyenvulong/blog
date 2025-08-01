---
title: 'Bash: check if a zip or a rar file has password-protection'
author: admin
type: post
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
<pre><strong>ZIP</strong>
crypted=$( 7z l -slt -- $file | grep -i -c "Encrypted = +" )
if [ "$crypted" -eq "1" ]; then
    protected=1
fi

<strong>RAR</strong>
unrar x -p- -y -o+ "$file" 1&gt; /dev/null 2&gt; /dev/null
if [ "$?" -eq "3" ] ; then
    unrar x -p$password -y -o+ "$file" 1&gt; /dev/null 2&gt; /dev/null
fi</pre>

Source: <a href="https://supportex.net/blog/2011/08/bash-check-zip-rar-file-password-protection/" target="_blank">https://supportex.net/blog/2011/08/bash-check-zip-rar-file-password-protection/</a>
