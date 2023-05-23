# NEW CONFIG FILES AT [here](https://github.com/HardoMX/nvim)

---

# Hardo's neovim config; "hvim"

### Features:
- (Soon) Lazyloading for fast startup
- Nice-looking (Nordic theme)
- A complete, but pretty simple package, whith an easy (soon<sup>tm</sup>) to read/use structure

---

### Installation:
1. Clone the repository
2. Copy the nvim folder int your ~/.config folder
3. There might be errors, but just run `:PackerInstall`, and everything should work
4. That's all (right now)

---

### Plugins used
- Manager: [nvim.packer](https://github.com/wbthomason/packer.nvim)
- Colorschemes: 
    - [Nordic](https://github.com/AlexvZyl/nordic.nvim)
    - [Tokyonight](https://github.com/folke/tokyonight.nvim)
    - [onenord](https://github.com/rmehri01/onenord.nvim)
    - [oxocarbon](https://github.com/nyoom-engineering/oxocarbon.nvim)
    - [tender](https://github.com/jacoborus/tender.vim)
    - [kanagawa](https://github.com/rebelot/kanagawa.nvim)
    - [Catpuccin](https://github.com/rebelot/kanagawa.nvim)
- Statusline: [lualine](https://github.com/nvim-lualine/lualine.nvim)
- File Explorer: [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
    - Icons: [devicons](https://github.com/nvim-tree/nvim-web-devicons)
- Syntax Highlighting: [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (LSP will be added later)
    - [context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- Search: [telescope](https://github.com/nvim-telescope/telescope.nvim)
- Autoclose: [autoclose](https://github.com/m4xshen/autoclose.nvim)
- Color-"picker": [colorizer](https://github.com/NvChad/nvim-colorizer.lua)
- Indent and Chunk Highlighting: [hl-chunks](https://github.com/shellRaining/hlchunk.nvim)
- Regex Help(Maybe broken): [regexplainer](https://github.com/bennypowers/nvim-regexplainer)
- Tabs: [tabline](https://github.com/kdheepak/tabline.nvim)
    - Close buffer nicely: [vim-bbye](https://github.com/moll/vim-bbye)
- Word Highlighting: [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- Keymap Help: [Which-Key](https://github.com/folke/which-key.nvim)
- Wild Menu: [wilder](https://github.com/gelguy/wilder.nvim)
- Extras: 
    - [numbertoggle](https://github.com/sitiom/nvim-numbertoggle), Automatically switches between relative and absolute numbers depending on mode
    - [mkdir](https://github.com/jghauser/mkdir.nvim), Creates a directory-path if there isn't already one
    - [FTerm](https://github.com/numToStr/FTerm.nvim), Open a terminal window in NeoVIM
    - [bbye](https://github.com/moll/vim-bbye), Close the current buffer without f-ing up your tab/window layout
    - [noice](https://github.com/folke/noice.nvim), Improved UI
    - [tabout](https://github.com/abecodes/tabout.nvim), Use tab to get out of (), {}, and more

---

### Mappings
- Open tree: <ctrl+n>
- Open search: <ctrl+p>
- Choose Colorscheme: <space+t>
- Next Tab: <shift+t>
- Previous Tab: <shift+b>
- Close current Tab: <shift+g>
- Open Terminal: <Enter+Enter>
- Close Terminal: <Esc>, but easier to just type `exit` in the terminal window
