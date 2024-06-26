"=====================================================
"=====================================================
"==                                .-----.         ===
"==     .----------------------.   | === |         ===
"==     |.-""""""""""""""""""-.|   |-----|         ===
"==     ||                    ||   | === |         ===
"==     ||      NAM VIMRC     ||   |-----|         ===
"==     ||                    ||   | === |         ===
"==     ||                    ||   |-----|         ===
"==     ||:Tutor              ||   |:::::|         ===
"==     |'-..................-'|   |____o|         ===
"==     `"")----------------(""`   ___________     ===
"==    /::::::::::|  |::::::::::\  \ no mouse \    ===
"==   /:::========|  |==hjkl==:::\  \ required \   ===
"==  '""""""""""""'  '""""""""""""'  '""""""""""'  ===
"=====================================================
"=====================================================


" [[ PLUGINS ]] {{{
let g:mapleader=' '
filetype on
filetype plugin on
filetype indent on
set nocompatible
"set runtimepath^=$HOME/.config/vim
" Important!!
if has('termguicolors')
    set termguicolors
endif
if has("syntax")
    syntax on
endif

if !filereadable(expand("$VIMRUNTIME/autoload/plug.vim"))
    silent execute "!curl -fLo $VIMRUNTIME/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall
endif

call plug#begin(expand("$VIM/plugged"))
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
call plug#end()

colorscheme dracula
set background=dark
"}}}

" [[ OPTIONS ]] {{{
"set t_Co=256
"set clipboard
set encoding=utf-8
set number
set ignorecase
set smartcase
set completeopt=menu,menuone,popup,noselect,noinsert
set timeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=0
set cursorline
set cursorlineopt=number,line
set nocursorcolumn
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set noruler
set noshowmode
set showcmd
set cmdheight=1
set laststatus=2
set showtabline=0
set splitright
"set fillchars=vert:┃,vertleft:┫,vertright:┣,verthoriz:╋,horiz:━,horizup:┻,horizdown:┳
"set viewdir=$HOME/.config/vim/view
set viewoptions-=options
set foldmethod=marker
"}}}

" [[ MAPPINGS ]] {{{
nnoremap <silent> fz :fzf!<CR>
nnoremap <silent> ff :Files<CR>
nnoremap <silent> fb :Buffers<CR>
nnoremap <silent> <leader>t :vertical terminal<CR>
"}}}

" [[ VIMSCRIPT ]] {{{
function! CustomHighlight()
    hi Normal           guibg=NONE                  gui=NONE
    hi Terminal         guibg=NONE                  gui=NONE
    hi StatusLine       guibg=#bd93f9 guifg=#282a36 cterm=bold
    hi StatusLineNC     guibg=#bd93f9 guifg=#282a36 cterm=bold
    hi StatusLineTerm   guibg=#bd93f9 guifg=#282a36 cterm=bold
    hi StatusLineTermNC guibg=#bd93f9 guifg=#282a36 cterm=bold
    hi Visual           guibg=#bd93f9 guifg=#282a36 gui=NONE
    "hi LineNr           guibg=#1d2021 guifg=#a9b66V5 gui=NONE
    "hi CursorColumn     guibg=235                   gui=NONE
    "hi CursorLine       guibg=#504945               gui=NONE
    hi CursorLineNr     guibg=#282a36 guifg=#bd93f9 cterm=bold
    hi WinSeparator     guibg=#282a36 guifg=#50fa7b gui=NONE
    "hi IncSearch        ctermbg=green ctermfg=black cterm=NONE
    "hi WildMenu         ctermbg=NONE ctermfg=10 cterm=NONE
    hi ModeMsg          guibg=#282a36 guifg=#50fa7b gui=NONE
    hi MoreMsg          guibg=#282a36 guifg=#50fa7b gui=NONE
    hi ErrorMsg         guibg=#282a36 guifg=#ff5555 gui=NONE
    hi WarningMsg       guibg=#282a36 guifg=#ff5555 gui=NONE
    hi Question         guibg=#282a36 guifg=#ff5555 gui=NONE
    hi Title                          guifg=#50fa7b gui=NONE
    hi SpecialKey       guibg=#282a36 guifg=#50fa7b gui=NONE
    hi NonText          guibg=#282a36 guifg=#50fa7b gui=NONE
    "hi MatchParen       ctermbg=NONE ctermfg=10 cterm=NONE
endfunction
autocmd VimEnter * call CustomHighlight()

function! EnterStatuslineColor()
    if mode() =~ "[vV\x16]"
        hi statusline guibg=#ffb86c guifg=#282a36 cterm=bold
    else
        if mode() =~ 'i'
            hi statusline guibg=#50fa7b guifg=#282a36 cterm=bold
        elseif mode() =~ 'R'
            hi statusline guibg=#ff5555 guifg=#282a36 cterm=bold
        else
            hi statusline guibg=#8be9fd guifg=#282a36 cterm=bold
        endif
    endif
endfunction

function! LeaveStatuslineColor()
    hi statusline guibg=#bd93f9 guifg=#282a36 cterm=bold
endfunction

autocmd ModeChanged *:[i]* call EnterStatuslineColor()
autocmd ModeChanged [i]*:* call LeaveStatuslineColor()
autocmd ModeChanged *:[vV\x16]* call EnterStatuslineColor()
autocmd ModeChanged [vV\x16]*:* call LeaveStatuslineColor()
autocmd ModeChanged *:[R]* call EnterStatuslineColor()
autocmd ModeChanged [R]*:* call LeaveStatuslineColor()

function! FileFormat()
    if &fileformat == 'unix'
        return '  '
    elseif &fileformat == 'dos'
        return '  '
    elseif &fileformat == 'mac'
        return '  '
    else
        return &fileformat
    endif
endfunction

autocmd WinEnter,BufEnter * setlocal statusline=%{FileFormat()}│%{&fileencoding==\"\"?&encoding:&fileencoding}%4c┃%-4l%t\ %w%h%r%m│\ \ %=
autocmd WinLeave,BufLeave * setlocal statusline=

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"autocmd BufWinLeave *.* silent! mkview
"autocmd BufWinEnter *.* silent! loadview
"}}}
