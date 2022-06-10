"[ENVIRONMENT]
highlight ColorColumn ctermbg=2
highlight CursorLine cterm=underline

" relative number colors
highlight LineNr ctermfg=7

" popup window colors
highlight Pmenu ctermbg=7
highlight PmenuSel ctermfg=7
highlight PmenuThumb ctermbg=black

let g:deoplete#enable_at_startup=1


set nocompatible            "don't try to be Vi compatible
set bg=dark                 "theme
set cursorline
set noswapfile              "swap give annoying warnings
set number                  "show line numbers (current line number)
set relativenumber          "show relative line numbers (the rest of the lines)
set splitright              "split vertically to the right by default
set splitbelow              "split below rather than up
set textwidth=79
set formatoptions+=t        "enable automatic line wrapping, not default in nvim
set colorcolumn=+1
set scrolloff=0             "vim enforces line context to be shown before
                            "and after the cursor, set to 5 in defaults.vim

"[STATUS LINE]
set statusline+=%y          "filetype"
set statusline+=\ %F        "always show currently open file path
set statusline+=\ col:%c    "show current column
set statusline+=\ %P        "file progress as percentage"
set laststatus=2

"[KEY MAPPINGS]
let mapleader=","               "mod key

"remap ESC to jj,jk,kj
imap jj <Esc>
imap kj <Esc>

" access the compilation errors with Ctrl+up/down rather than with :c{next,prev}
map <C-down> :cnext<CR>
map <C-up> :cprev<CR>

" tabs
nnoremap <C-n> :tabnew<Space>
nnoremap <C-h> :tabprev<CR>
nnoremap <C-l> :tabnext<CR>

" files
nnoremap <A-n> :next<CR>
nnoremap <A-p> :prev<CR>

" exec the current line in shell and return the result into the current buffer
noremap Q !!$SHELL<CR>

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" NERDTree
nnoremap <C-A-v> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"[EDITOR]
" spell check
set spell spelllang=en
highlight SpellBad ctermbg=NONE ctermfg=NONE cterm=underline
highlight SpellCap ctermbg=NONE ctermfg=3 cterm=underline

" character casing
set ignorecase
set smartcase
set autoindent
set smartindent
set cindent

" global indentation settings
set tabstop=8           "existing tab width
set shiftwidth=4        "number of spaces used with indentation
set softtabstop=-1
set expandtab           "replaces tabs with spaces

" tell vim to show specific white spaces and how to show them
set listchars=tab:▸\ ,eol:¬
set list

" C indentation strategy
set cinoptions=(0,:0,l1,t0


" @vim-better-whitespace: enable highlighting and stripping whitespace on save
" by default
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0
let g:strip_only_modified_lines = 1
let g:strip_whitelines_at_eof = 1

" Use <TAB> to select the popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"file types
filetype on
filetype plugin indent on
autocmd FileType gitcommit setlocal textwidth=71
autocmd FileType html,xhtml,xml,xslt,rng,yaml setlocal tabstop=2 shiftwidth=2 softtabstop=-1
autocmd FileType make,gitconfig setlocal shiftwidth=8 softtabstop=0 noexpandtab
autocmd FileType mail,text setlocal noautoindent
autocmd FileType go setlocal tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
autocmd BufRead,BufNewFile *.am setlocal shiftwidth=8 softtabstop=0 noexpandtab


"airline
let g:airline_powerline_fonts=1


"auto-git-diff
let g:auto_git_diff_show_window_at_right=1


"[PLUGINS]
call plug#begin('~/.vim/plugged')

Plug 'cespare/vim-toml'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'jiangmiao/auto-pairs'
Plug 'ntpeters/vim-better-whitespace'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/git_patch_tags.vim'
Plug 'hotwatermorning/auto-git-diff'

Plug 'preservim/nerdtree'

call plug#end()
