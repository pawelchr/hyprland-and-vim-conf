call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" =============================
" Clipboard configuration for Wayland
" =============================
set mouse=a

" === CoC completion keybindings ===
let mapleader=','
nnoremap <silent> <leader>a :call CocActionAsync('codeAction')<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ pumvisible() ? "\<C-n>" :
      \ "\<TAB>"

inoremap <silent><expr> <CR>
      \ coc#pum#visible() ? coc#pum#confirm() :
      \ "\<CR>"

if $WAYLAND_DISPLAY != ''
  if !has('gui_running')
    vnoremap <silent> y y:call system('wl-copy', @")<CR>
    vnoremap <silent> d d:call system('wl-copy', @")<CR>
    nnoremap <silent> yy yy:call system('wl-copy', @")<CR>
    nnoremap <silent> Y Y:call system('wl-copy', @")<CR>
  else
    set clipboard=unnamedplus
  endif
else
  set clipboard=unnamedplus
endif

" =============================
" Basic settings
" =============================
syntax on
filetype plugin indent on
set background=dark

" Kitty terminal undercurl and colored underline support
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
let &t_AU = "\e[58:5:%dm"

" LSP error/warning highlighting - undercurl with colored underline
highlight lscDiagnosticError cterm=undercurl ctermul=Red
highlight lscDiagnosticWarning cterm=undercurl ctermul=Yellow
highlight lscReference cterm=underline

let $XDG_RUNTIME_DIR = "/run/user/1000"
let $WAYLAND_DISPLAY = "wayland-1"

" =============================
" Project-specific configuration
" =============================
set exrc
set secure

" =============================
" Change swap files location
" =============================
" swap files (.swp) in a common location
" // means use the file's full path
set dir=~/.vim/_swap//

" backup files (~) in a common location if possible
set backup
set backupdir=~/.vim/_backup/,~/tmp,.

" turn on undo files, put them in a common location
set undofile
set undodir=~/.vim/_undo/

set relativenumber

""" Remove preview windows
set completeopt -=preview


" Make Coc sign column background transparent (match terminal)
hi SignColumn guibg=NONE ctermbg=NONE

