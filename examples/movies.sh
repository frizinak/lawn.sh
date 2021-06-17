#! /bin/sh

find "/my-dvd-rips" -type f \( \
    -iname '*.mp4' -o \
    -iname '*.mkv' -o \
    -iname '*.avi' \
\) \
-size +300M \
-printf '%T@ %p\n' | sort -k1 -rn | \
while read -r line; do
    n="$(basename "$line"): $(basename "$(dirname "$line")")"
    n="$(echo "$n" | tr -d "<>")"
    f="$(echo "$line" | cut -d' ' -f2-)"
    echo "ﳜ  $n <d> mpv --fs '$f'"   # ﳜ  %{title} %{dirname} <d> mpv --fs '%{path}'
done
