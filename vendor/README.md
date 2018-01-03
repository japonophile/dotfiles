# "dotfiles" and system configuration

## Dependencies

* [tmux](http://tmux.sourceforge.net/) 2.3 or later.
* [Neovim](https://neovim.io) or [Vim](http://www.vim.org/) 8.0 or later with Ruby and Python support (although there's a reasonable amount of feature detection in order to degrade gracefully).
* Relatively recent [Zsh](http://www.zsh.org/).
* Relatively recent [Git](http://git-scm.com/).
* On macOS, [iTerm2](http://www.iterm2.com/). Additionally, only the latest version of macOS (currently Sierra) gets actively tested.
* [Python](https://www.python.org/) to perform setup via the included `install` command.

## Installation

### Clone

```sh
git clone --recursive https://github.com/japonophile/dotfiles.git
```

### Install

```sh
./install
```

This sets up a local Python environment using the bundled virtualenv, bootstraps Ansible, and then uses Ansible to copy the dotfiles and configure the machine.

