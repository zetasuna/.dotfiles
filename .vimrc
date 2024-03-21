"  _   _                         _                    
" | \ | |                       (_)                   
" |  \| | __ _ _ __ ___   __   ___ _ __ ___  _ __ ___ 
" | . ` |/ _` | '_ ` _ \  \ \ / / | '_ ` _ \| '__/ __|
" | |\  | (_| | | | | | |  \ V /| | | | | | | | | (__ 
" |_| \_|\__,_|_| |_| |_| (_)_/ |_|_| |_| |_|_|  \___|
"

" [[ PLUGINS ]]
set runtimepath^=/home/$USER/.config/vim
if !filereadable(expand("/home/$USER/.config/vim/autoload/plug.vim"))
	silent execute "!curl -fLo /home/$USER/.config/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	autocmd VimEnter * PlugInstall
endif

call plug#begin(expand("/home/$USER/.config/vim/plugged"))
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
syntax on
colorscheme onedark
set background=dark
"let g:molokai_original=1
let g:onedark_termcolors=256
let g:ale_lint_delay=0
let g:ale_linters={'java': ['javac']}
"let g:fzf_vim.preview_window = []
nnoremap <silent> fz :fzf!<CR>
nnoremap <silent> ff :Files!<CR>
nnoremap <silent> fb :Buffers!<CR>
"nnoremap <silent> vt :vertical term<CR> 

" [[ OPTIONS ]]
set nocompatible
filetype on
filetype plugin on
filetype indent on
if has("syntax")
	syntax on
endif
"set background=dark
let g:mapleader=' '
set t_Co=256
set timeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=0
set number
set cursorline
set cursorcolumn
set viewdir=$HOME/.config/vim/view
set noshowmode
set showcmd
set cmdheight=1
set noruler
set showtabline=0
set splitright
nnoremap <silent> <leader>t :vertical terminal<CR>
function! EnterStatuslineColor()
	if mode() =~ "[vV\x16]" 
		hi statusline ctermbg=yellow ctermfg=black  cterm=NONE
		hi User1      ctermbg=black  ctermfg=yellow cterm=NONE
	else
		if mode() =~ 'i'
			hi statusline ctermbg=blue  ctermfg=black cterm=NONE
			hi User1      ctermbg=black ctermfg=blue  cterm=NONE
		elseif mode() =~ 'R'
			hi statusline ctermbg=red   ctermfg=black cterm=NONE
			hi User1      ctermbg=black ctermfg=red   cterm=NONE
		else
			hi statusline ctermbg=black ctermfg=black cterm=NONE
			hi User1      ctermbg=black ctermfg=black cterm=NONE
		endif
	endif
endfunction 

function! LeaveStatuslineColor()
	hi statusline ctermbg=green ctermfg=black cterm=NONE
	hi User1      ctermbg=black ctermfg=green cterm=NONE
endfunction	

au ModeChanged *:[i]* call EnterStatuslineColor()
au ModeChanged [i]*:* call LeaveStatuslineColor() 
au ModeChanged *:[vV\x16]* call EnterStatuslineColor()
au ModeChanged [vV\x16]*:* call LeaveStatuslineColor()
au ModeChanged *:[R]* call EnterStatuslineColor()
au ModeChanged [R]*:* call LeaveStatuslineColor()

hi StatusLine ctermbg=green ctermfg=black cterm=NONE
hi User1                    ctermfg=green cterm=NONE
set laststatus=2
function! FileFormat()
	if &fileformat == 'unix'
		return ' '
	elseif &fileformat == 'dos'
		return ' '
	elseif &fileformat == 'mac'
		return ' '
	else 
		return &fileformat		
	endif
endfunction
augroup statusline
	autocmd!
	"autocmd WinEnter,BufEnter * setlocal statusline=\ \ %1*%*%t%1*%*%w%h%r%m%1*%*%=%1*%*%4c%1*%*%4l%1*%*%{&fileencoding?&fileencoding:&encoding}%1*%*%{FileFormat()} | setlocal number | setlocal cursorline | setlocal cursorlineopt=number
	"autocmd WinEnter,BufEnter * setlocal statusline=\[%{&fileformat}\|%{&fileencoding?&fileencoding:&encoding}\]%1*%5c:%-5l%*%t\ %w%h%r%m | setlocal number | setlocal cursorline | setlocal cursorlineopt=number
	autocmd WinEnter,BufEnter * setlocal statusline=%{FileFormat()}%{&fileencoding?&fileencoding:&encoding}%1*%*%4c┃%-4l%1*%*%t%1*%*%w%h%r%m 
	autocmd WinLeave,BufLeave * setlocal statusline= 
augroup end
set fillchars+=vert:┃
hi StatusLineNC     ctermbg=black ctermfg=black cterm=NONE
hi StatusLineTerm   ctermbg=green ctermfg=black cterm=NONE
hi StatusLineTermNC ctermbg=black ctermfg=black cterm=NONE
" hi MoreMsg          ctermbg=black ctermfg=green cterm=NONE
" hi ModeMsg          ctermbg=green ctermfg=black cterm=NONE
" hi Visual           ctermbg=green ctermfg=black cterm=NONE
" hi WildMenu         ctermbg=black ctermfg=green cterm=NONE
" hi LineNr           ctermbg=black ctermfg=green cterm=NONE
" hi CursorLineNR     ctermfg=green cterm=NONE
hi VertSplit        ctermbg=black ctermfg=green cterm=NONE
"hi IncSearch        ctermbg=green ctermfg=black cterm=NONE
"hi Question         ctermbg=black ctermfg=red   cterm=NONE
"hi ErrorMsg         ctermbg=black ctermfg=red   cterm=NONE
"hi WarningMsg       ctermbg=black ctermfg=red   cterm=NONE
"hi Title            ctermbg=black ctermfg=green cterm=NONE
"hi SpecialKey       ctermbg=black ctermfg=green cterm=NONE
"hi NonText          ctermbg=black ctermfg=green cterm=NONE
"hi MatchParen       ctermbg=green ctermfg=black cterm=NONE

" [[ MAPPINGS ]]
" [[ VIMSCRIPT ]]
" Save current cursor when open/close file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

