# A cross-platform CLI clipboard management utils, written in POSIX shell

Quickly access your clipboard on the command line, on any platform.

## Supported platforms

- Any terminal on any OS that supports the OSC 52 as described by [XTerm spec](https://invisible-island.net/xterm/ctlseqs/ctlseqs.html)
- Linux/BSD - X11 (`xclip`)
- Linux/BSD - Wayland (`wl-clipboard`)
- Android - Termux (`termux-clipboard-set`, `termux-clipboard-get`)

## Installation

### Nix

Use the `default` or `clip` package in your config.

```bash
# Try
nix shell github:nativerv/clip
nix shell github:nativerv/clip --command yank
nix shell github:nativerv/clip --command put

# Install statefully
nix profile install github:nativerv/clip
```

## Dependencies

- `xclip`, `wl-clipboard` or `termux` (depending on platform): clipboard access
- `imagemagick`: image conversion to PNG to yank images

## Utilities

### `yank`

#### Usage

`yank [-p] [file]`

Yanks specified file to the system clipboard selection.

If no file is specified, uses standard input instead.

#### Flags:

- `-p`, `--primary` yanks to the system primary selection instead if available on the platform
- `--help` show usage

#### Environment variables:

- `DEBUG` if set, print extra info to standard error

### `put`

#### Usage

`put [-p] [-t TYPE]`

Puts the contents of system clipboard selection to the standard output.

#### Flags:

- `-p`, `--primary` puts to the primary selection instead if available on the platform
- `-t`, `--type` specify MIME type 
- `--help` show usage


#### Environment variables:

- `DEBUG` if set, print extra info to standard error
