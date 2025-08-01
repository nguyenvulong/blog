#!/usr/bin/env fish

for file in (find . -type f -name "*.md")
    echo "Processing $file..."

    # Create a backup
    cp $file "$file.bak"

    gawk '
    BEGIN {
      in_figure = 0
      buffer = ""
    }
    {
      # Start of <figure>
      if ($0 ~ /<figure[^>]*>/) {
        in_figure = 1
        buffer = $0
        next
      }

      if (in_figure) {
        buffer = buffer "\n" $0
        if ($0 ~ /<\/figure>/) {
          in_figure = 0
          match(buffer, /src=["'\'']([^"'\'']+)["'\'']/, arr)
          src = arr[1]
          if (src != "") {
            gsub(/\.\.\/\//, "./", src)
            n = split(src, parts, "/")
            alt = parts[n]
            print "\n![" alt "](" src ")\n"
          }
          buffer = ""
        }
        next
      }

      # Handle standalone <img ... />
      if ($0 ~ /<img[^>]*>/) {
        line = $0
        match(line, /src=["'\'']([^"'\'']+)["'\'']/, arr)
        src = arr[1]
        if (src != "") {
          gsub(/\.\.\/\//, "./", src)
          n = split(src, parts, "/")
          alt = parts[n]
          print "\n![" alt "](" src ")\n"
        }
        next
      }

      # Default
      print
    }
    ' "$file.bak" >"$file"
end
