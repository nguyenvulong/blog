#!/usr/bin/env fish

for bak_file in (find . -type f -name "*.md.bak")
    set md_file (string replace ".bak" "" $bak_file)
    echo "Restoring $md_file from $bak_file"
    cp -f "$bak_file" "$md_file"
end
