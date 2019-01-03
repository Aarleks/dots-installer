# Dotfiles Installer for My Various Machines

This repo contains an installer script and a list of programs to be installed on my Arch Linux machines. The installer script is built/iterated from and shamelessly ripped from Luke Smiths's [LARBS](https://larbs.xyz) project. If you're new to Arch and are looking for a tiling WM, vim-based system, you should check LARBS out.

## Installation

To be run from a clean Arch installation, logged in as `root`. The installer will create a new user and will write over anything with a user of the same name.

First download the installer script:

```sh
curl -LO https://raw.githubusercontent.com/Aarleks/dots-installer/master/strappyboot.sh
```
Then, either download `programs.csv` and edit it, or simply run the installer script:
```sh
bash strappyboot.sh
```
The installer will provide a number of prompts along the way, which will need answering, but it's really pretty simple.
