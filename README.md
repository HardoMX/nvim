# Hardo's neovim config

## Features:
- ### Incredibly short start time
- ### Nice-looking (Nordic and Tokyo Night themes "fully" integrated, comes with [more](https://github.com/HardoMX/nvim#gui) but without improved same-word highlighting)
- ### A complete, but pretty simple package, with an easy to read/use structure
- ### Easily modifiable for your usecase

---

### Installation:
1. Clone the repository into your `.config` directory
2. Start nvim with the `nvim` command
3. There might be errors, but just run `:PackerInstall`, and almost everything should work
4. To get coq_nvim to work you might also need to do `:COQdeps` and then you can do `:COQnow` to start COQ (Note that autostart is on, so this will only be necessary the first time)

**Notes**
- The README and LICENSE will also be in this repository, you could remove them if you want, but they shouldn't create any problems
- The reason I am doing it like this is that it will be mush easier to update the config, I can just change something and push it, without having to copy stuff to or from a folder

---

### Plugins used
- Manager: [nvim.packer](https://github.com/wbthomason/packer.nvim)
- #### **Core**
    - File Explorer: [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
        - Icons: [devicons](https://github.com/nvim-tree/nvim-web-devicons) (No Config)
    - Search: [telescope](https://github.com/nvim-telescope/telescope.nvim)
    - Syntax Highlighting: [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (LSP will be added later)
        - [context](https://github.com/nvim-treesitter/nvim-treesitter-context) (No Config)
  
- #### **GUI**
    - Colorschemes: (Configs are in theme.lua)
        - [Nordic](https://github.com/AlexvZyl/nordic.nvim)
        - [Tokyonight](https://github.com/folke/tokyonight.nvim)
        - [onenord](https://github.com/rmehri01/onenord.nvim)
        - [oxocarbon](https://github.com/nyoom-engineering/oxocarbon.nvim)
        - [tender](https://github.com/jacoborus/tender.vim)
        - [kanagawa](https://github.com/rebelot/kanagawa.nvim)
        - [Catpuccin](https://github.com/rebelot/kanagawa.nvim) (Currently broken)
    - Statusline: [lualine](https://github.com/nvim-lualine/lualine.nvim) (No Config)
    - Indent and Chunk Highlighting: [hl-chunks](https://github.com/shellRaining/hlchunk.nvim)
    - Regex Help(Maybe broken): [regexplainer](https://github.com/bennypowers/nvim-regexplainer)
    - Tabs: [tabline](https://github.com/kdheepak/tabline.nvim)
        - Close tab nicely: [vim-bbye](https://github.com/moll/vim-bbye) (Config in Utils)
    - Word Highlighting: [vim-illuminate](https://github.com/RRethy/vim-illuminate)
    - Wild Menu: [wilder](https://github.com/gelguy/wilder.nvim)
  
- #### **Utils**
    - [numbertoggle](https://github.com/sitiom/nvim-numbertoggle), Automatically switches between relative and absolute numbers depending on mode
    - [mkdir](https://github.com/jghauser/mkdir.nvim), Creates a directory-path if there isn't already one
    - [FTerm](https://github.com/numToStr/FTerm.nvim), Open a terminal window in NeoVIM
    - [noice](https://github.com/folke/noice.nvim), Improved UI
    - [tabout](https://github.com/abecodes/tabout.nvim), Use tab to get out of (), {}, and more
    - [autoclose](https://github.com/m4xshen/autoclose.nvim), Automatically closes (), {}, and more
    - [Which-Key](https://github.com/folke/which-key.nvim), Shows available keymaps
    - [colorizer](https://github.com/NvChad/nvim-colorizer.lua), Shows what color a color code is
    - [trouble](https://github.com/folke/trouble.nvim), Inline errors and more

- #### **LSP/Completion**
    - [coq_nvim](https://github.com/ms-jpq/coq_nvim), Very fast code completion
        - coq.artifacts
        - coq.thirdparty
    - [Tabnine](https://github.com/codota/tabnine-nvim), AI completion suggestions




---

### Mappings
| Keybind | Action |
| :-: | :- |
| <**ctrl+n**> | Open file tree |
| <**ctrl+p**> | Open search |
| <**space+t**> | Choose Colorscheme |
| <**shift+t**> | Next Tab |
| <**shift+b**> | Previous Tab |
| <**shift+g**> | Close current Tab |
| <**Enter+Enter**> | Open Terminal |
| <**Esc**> | Close Terminal, If the terminal is not focused, otherwise it is easier to just type `exit` in the terminal window |
| <**Tab**> | Cycle through comp suggestions |
| <**Enter**> | Accept comp suggestion |
| <**Right**> | Accept Tabnine Suggestion |

---

### Plans
- [ ] No LazyLoading, one second is still fast and then there will be less wait for plugins when you use them. However, if the config becomes bigger I might change this
- [ ] More Colorschemes
- [ ] LSP
- [ ] DAP
- [x] Autocompletion
- [x] Snippets
- [ ] "Code Moving"
