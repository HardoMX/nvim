# Requiered programs

- ripgrep
- fd
- npm (for LSP)

### TODO
- Might change autoclose.nvim to nvim-autopairs or ultimate-autopair.nvim

### Big thank you to:
- ThePrimeagen for making an awesome full set up video
- Josean Martinez for making a great video on LSP an Lazy
- Max Niia for having a really nice config to "borrow" ;) from

## Mappings
### By default <leader> is spacebar

### neovim
| Mode   | Keys | Function | Note |
| ----   | ---- | -------- | ---- |
| Visual | K/J  | Move highlighted code up or down | capital letter means <shift>+letter |
| Normal |  J   | Move line below to end of current line | |
| Normal | n/N  | Keep search term in middle of screen | |
| Vis only | <leader>p | Replace highlighted word without copying it | |
| Vis/Norm | <leader>d | Delete without copying | |
| Vis/Norm | <leader>y | Copy to system clipboard | |
| Normal | <leader>s | Replace all of hovered word | |
| Normal | <leader>x | Make current file executable | Only on linux |

### Telescope
|  Mode  |    Keys    | Function | Note |
|  ----  |    ----    | -------- | ---- |
| Normal |    <C-p>   | Open telescope for git files | |
| Normal | <leader>ff | Open telescope for all files | |
| Normal | <leader>fc | Open telescope for colorschemes | Might not be permanent |
| Normal | <leader>ps | Find files containing word | |

### Harpoon
|  Mode  |    Keys    | Function | Note |
|  ----  |    ----    | -------- | ---- |
| Normal |   <C-e>    | Open harpoon list | |
| Normal | <leader>ha | Add file to harpoon list | |
| Normal | <leader>h<1-9> | Go to file <1-9> | |

### Comment
|  Mode  |    Keys    | Function | Note |
|  ---   |    ----    | -------- | ---- |
| Normal | <leader>cc | Toggle comments linewise on line | |
| Normal | <leader>bc | Toggle comments blockwise on line | |
| Visual (x) | <leader>c | Toggle comments linewise on selection | |
| Visual (x) | <leader>b | Toggle comments blockwise on selection | |

### Other mappings
| Plugin |  Mode  |    Keys    | Function | Note |
| ------ |  ----  |    ----    | -------- | ---- |
|  Lazy  | Normal | <leader>l  | Open Lazy UI |  |
| Nvim-Tree | Normal | <leader>t | Toggle filetree | |
| Undotree | Normal | <leader>u | Toggle undotree | |
| Fugitive | Normal | <leader>gs | Open git status window | |
