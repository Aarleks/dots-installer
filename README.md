# Dotfiles Installer for My Various Machines

This repo contains an installer script and a list of programs to be installed on my Arch Linux machines. The installer script is built/iterated from and shamelessly ripped from Luke Smiths's [LARBS](https://larbs.xyz) project. If you're new to Arch and are looking for a tiling WM, vim-based system, you should check LARBS out.

## Installation

To be run from a clean Arch installation, logged in as `root`. The installer will create a new user and will write over anything with a user of the same name.

First download the two key files:
* strappyboot.sh
* files.csv

```sh
curl -LO 
bash strappyboot.sh
```

## Files to be Installed

The list of files is generic and should be edited prior to installing on a particular machine.
