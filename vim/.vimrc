call plug#begin()

Plug 'natebosch/vim-lsc'

call plug#end()

" =============================
" Clipboard configuration for Wayland
" =============================
set mouse=a

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
" vim-lsc configuration
" =============================
let g:lsc_server_commands = {
  \ 'python': ['pyright-langserver', '--stdio']
  \ }

let g:lsc_auto_map = v:true
let g:lsc_enable_diagnostics = v:true
let g:lsc_enable_autocomplete = v:true
let g:lsc_enable_apply_edit = v:true

let g:python_highlight_all = 1

let g:lsp_settings = {
      \ 'pyright-langserver': {
      \   'root_markers': ['pyproject.toml', '.git/', 'setup.cfg', '.flake8'],
      \   'settings': {}
      \ }
      \ }


" Show diagnostic messages
let g:lsc_auto_map = {
  \ 'GoToDefinition': 'gd',
  \ 'FindReferences': 'gr',
  \ 'Rename': '<leader>rn',
  \ 'ShowHover': 'K',
  \ 'FindCodeActions': 'ga',
  \ 'DocumentSymbol': 'go',
  \ 'Completion': 'completefunc',
  \ }

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
