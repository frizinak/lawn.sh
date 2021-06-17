# LAWNSH

A simple posix launcher for your terminal

## What

Parses config files with both static and dynamic definitions of applications
and pipes it all to fzf.

See examples/ and config header below.

obligatory animation: (of fzf really...)

![screenshot](https://github.com/frizinak/lawn.sh/raw/dev/examples/screen.gif)


## Requirements

[fzf](https://github.com/junegunn/fzf) or something similar

## Installation

Add `lawnsh` to your PATH or wrap it. E.g:
`st -c 'st-launcher' -f arcade12pxbmp:pixelsize=36 -e ~/dev/lawnsh/lawnsh`

## Config info

`lawnsh -c`

```
# LAWNSH config file
#
# FORMAT:
# 1) label <FLAGS> COMMAND
#                         static definition of a command.
# 2) #! executable
#                         lines starting with #! will be executed and should
#                         echo lines matching FORMAT(1)
#                         LAWNSH env variable will be set to the config
#                         directory of lawnsh.
# 3) #: script
#                         lines starting with #: will be eval'ed inline
#                         and should echo lines matching FORMAT(1).
# 4) #=key value
#                         set a config option.
#                         one of:
#                           - fzf: override fzf commandline
#
#
# FLAGS:
#     d:  detach from terminal
#     s:  run in shell
#
# COMMAND:
#     anything executable by your shell.
#
#     lawnsh:reload
#                         reload the current view.
#
#     lawnsh:goto:N
#                         reload lawnsh with a new view
#                         where N is the name of the config file.
#
#
# Example 1: ~/.config/lawnsh/main:
#
# #=fzf    fzf --border=rounded --layout=reverse-list
#
# terminal <d> xterm
# browser  <d> chromium
# say hi   <s> echo 'ereht ih' | rev; sleep 5
# a view   < > lawnsh:goto:view
#
# #: # Movies
# #: find my-movies -type f -iname '*.mp4' | while read -r line; do
# #:     echo "$(basename "$line" | tr -d '<>') <d> mpv --fs '$line'"
# #: done
#
# #! $LAWNSH/movies.sh
# reload   < > lawnsh:reload
#
# Example 2: ~/.config/lawnsh/view:
#
# back < > lawnsh:goto:main
```
