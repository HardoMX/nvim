## Requiered programs

- ripgrep
- fd
- npm and any other package managers, depending on which LSPs you want
- Relevant debuggers not automatically set up by Mason, i.e gdb for C/C++, or lua-local for lua


# Neovim Config
A balanced and reliable config, usually kept up to date with lates Neovim stable release. 

## Getting started
### Prerequisites
**Using Arch linux**
```
# Install Neovim and required programs
sudo pacman -S neovim unzip wget curl tar gzip ripgrep find-fd

# Install package managers for LSP installation
sudo pacman -S npm python-pip
```
You might need to install more package managers depending on which LSPs you want. Some DAP-debuggers also need their debugger installed separately.

### Installation
If you plan on making any changes to your config, I recommend that you make a fork of this repository and use that instead of directly using mine.
```
# If nvim config directory exists, remove it
rm -r ~/.config/nvim/

# Download new config (using github-cli)
cd ~/.config
gh repo clone nvim

# Download new config (using git)
cd ~/.config
git clone https://github.com/<your-username-here>/nvim
```

## Contributing
I appreciate suggestions and pull-requests regarding documentation and bugs. This extends to adding and removing plugins aswell, but there I will be quite picky since this repo is the configuration I use. 

If you find a bug or want an improvement in documentation etc, please begin by creating an issue. This allows me to see what needs improvement and to prioritise what I work on.
If you want to work on the issue, please fork the repo and then open a pull request once the issue is fixed.

## Acknowledgements
- [MaxMiia](https://github.com/MaxNiia)
- [TJ](https://github.com/tjdevries)
- [ThePrimeagen](https://github.com/theprimeagen)
