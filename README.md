# A cross-platform CLI clipboard management utils, written in POSIX shell

Quickly access your clipboard on the command line, on any platform.

## Supported platforms

- Any terminal that supports the OSC 52 as described by [XTerm spec](https://invisible-island.net/xterm/ctlseqs/ctlseqs.html)
- Linux - X11 (`xclip`)
- Linux - Wayland (`wl-clipboard`)
- Android - Termux (`termux-clipboard-set`, `termux-clipboard-get`)

## Dependencies

- `xclip`, `wl-clipboard` or `termux` (depending on platform): clipboard access
- `imagemagick`: image conversion to PNG to yank images

## Utilities

### `yank`

Usage: `yank [-p] [file]`

Yanks specified file to the system clipboard selection.

If no file is specified, uses standard input instead.

Flags:

- **TODO**: `-p`, `--primary` yanks to the system primary selection instead if available on the platform

### `put`

Usage: `put [-p]`

Puts the contents of system clipboard selection to the standard output.

Flags:

- **TODO**: `-p`, `--primary` puts to the primary selection instead if available on the platform
