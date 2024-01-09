## Requiered programs

- ripgrep
- fd
- npm and any other package managers, depending on which LSPs you want
- deno, for peek.nvim (live md viewer)

### TODO
- Might change autoclose.nvim to nvim-autopairs or ultimate-autopair.nvim

### Big thank you to:
- ThePrimeagen for making an awesome full set up video
- Josean Martinez for making a great video on LSP an Lazy
- Max Niia for having a really nice config to "borrow" from

## Mappings
### By default <leader> is spacebar

### neovim
| Mode   | Keys | Function | Note |
| ----   | ---- | -------- | ---- |
| Visual | K/J  | Move highlighted code up or down | capital letter means \<shift>+letter |
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

### cmp
|  Mode  |  Keys  | Function | Notes |
|  ----  |  ----  | -------- | ----- |
| Insert | \<C-k> | Previous suggestion | |
| Insert | \<C-j> | Next suggestion | |
| Insert | \<C-b> | Scroll down suggestions | |
| Insert | \<C-f> | Scroll up suggestions | |
| Insert | \<C-space> | Complete suggestion | I have no idea what this is, the video-guy did it so... |
| Insert | \<C-e> | Close suggestions | |
| Insert | \<CR> | Confirm suggestion | |

### LSP
|  Mode  | Keys | Function | Notes |
|  ----  | ---- | -------- | ----- |
| Normal |  gd  | Show definitions | These mappings will probably change soon s I set more things up |
| Normal |  gi  | Show implementations | |
| Normal |  gt  | Show type defs | |
| Norm/Vis | \<leader>ca | See available code actions | |
| Normal | \<leader>rn | Smart rename | Renames all variables/functions with the same name |
| Normal | \<leader>D | Show buffer diagnostics | |
| Normal | \<leader>d | Show line diagnostics | |
| Normal | \<[d> | Go to previous diagnostic | These will definately be changed as they are difficult on swedish keyboards |
| Normal | \<]d> | Go to next diagnostic | |
| Normal | K | Show documentation for what is under cursor | |
| Normal | \<leader>rs | Restart LSP | Might get removed as it is an unusual and easy ":" command |


### Other mappings
| Plugin |  Mode  |    Keys    | Function | Note |
| ------ |  ----  |    ----    | -------- | ---- |
|  Lazy  | Normal | <leader>l  | Open Lazy UI |  |
| Nvim-Tree | Normal | <leader>t | Toggle filetree | |
| Undotree | Normal | <leader>u | Toggle undotree | |
| Fugitive | Normal | <leader>gs | Open git status window | |
