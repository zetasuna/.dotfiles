"  _   _                         _                    
" | \ | |                       (_)                   
" |  \| | __ _ _ __ ___   __   ___ _ __ ___  _ __ ___ 
" | . ` |/ _` | '_ ` _ \  \ \ / / | '_ ` _ \| '__/ __|
" | |\  | (_| | | | | | |  \ V /| | | | | | | | | (__ 
" |_| \_|\__,_|_| |_| |_| (_)_/ |_|_| |_| |_|_|  \___|
"======================================================
"======================================================
"===                                .-----.         ===
"===     .----------------------.   | === |         ===
"===     |.-""""""""""""""""""-.|   |-----|         ===
"===     ||                    ||   | === |         ===
"===     ||   N.D.NAM .VIMRC   ||   |-----|         ===
"===     ||                    ||   | === |         ===
"===     ||                    ||   |-----|         ===
"===     ||:Tutor              ||   |:::::|         ===
"===     |'-..................-'|   |____o|         ===
"===     `"")----------------(""`   ___________     ===
"===    /::::::::::|  |::::::::::\  \ no mouse \    ===
"===   /:::========|  |==hjkl==:::\  \ required \   ===
"===  '""""""""""""'  '""""""""""""'  '""""""""""'  ===
"======================================================
"======================================================


" [[ PLUGINS ]] {{{
set runtimepath^=/home/$USER/.local/share/vim
if !filereadable(expand("/home/$USER/.local/share/vim/autoload/plug.vim"))
	silent execute "!curl -fLo /home/$USER/.local/share/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	autocmd VimEnter * PlugInstall
endif

call plug#begin(expand("/home/$USER/.local/share/vim/plugged"))
Plug 'joshdick/onedark.vim'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
syntax on
colorscheme onedark
set background=dark
let g:onedark_termcolors=256
let g:ale_lint_delay=0
let g:ale_linters={'java': ['javac']}
"let g:fzf_vim.preview_window = []
nnoremap <silent> fz :fzf!<CR>
nnoremap <silent> ff :Files!<CR>
nnoremap <silent> fb :Buffers!<CR>
nnoremap <silent> <leader>t :vertical terminal<CR>
"}}}

" [[ OPTIONS ]] {{{
if has("syntax")
	syntax on
endif
let g:mapleader='\'
filetype on
filetype plugin on
filetype indent on
set nocompatible
set t_Co=256
set timeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=0
set number
set cursorline
set cursorlineopt=number
set nocursorcolumn
"set clipboard
set noshowmode
set showcmd
set cmdheight=1
set laststatus=2
set noruler
set showtabline=0
set splitright
set fillchars+=vert:┃
set viewdir=$HOME/.local/share/vim/view
set viewoptions-=options
set foldmethod=marker
hi Normal           ctermbg=NONE            cterm=NONE
hi Terminal         ctermbg=NONE            cterm=NONE
hi User1            ctermbg=NONE ctermfg=10 cterm=NONE
hi StatusLine       ctermbg=10   ctermfg=0  cterm=NONE
hi StatusLineNC     ctermbg=NONE ctermfg=0  cterm=NONE
hi StatusLineTerm   ctermbg=10   ctermfg=0  cterm=NONE
hi StatusLineTermNC ctermbg=NONE ctermfg=0  cterm=NONE
hi MoreMsg          ctermbg=NONE ctermfg=10 cterm=NONE
"hi ModeMsg          ctermbg=green ctermfg=black cterm=NONE
hi Visual           ctermbg=10   ctermfg=0  cterm=NONE
"hi WildMenu         ctermbg=NONE ctermfg=10 cterm=NONE
"hi LineNr           ctermbg=NONE ctermfg=10 cterm=NONE
"hi CursorColumn     ctermbg=235             cterm=NONE   
hi CursorLine       ctermbg=NONE            cterm=NONE
hi CursorLineNr     ctermbg=NONE ctermfg=10 cterm=NONE
hi VertSplit        ctermbg=NONE ctermfg=10 cterm=NONE
"hi IncSearch        ctermbg=green ctermfg=black cterm=NONE
hi Question         ctermbg=NONE ctermfg=10 cterm=NONE
hi ErrorMsg         ctermbg=NONE ctermfg=9  cterm=NONE
hi WarningMsg       ctermbg=NONE ctermfg=9  cterm=NONE
"hi Title            ctermbg=NONE ctermfg=10 cterm=NONE
"hi SpecialKey       ctermbg=NONE ctermfg=10 cterm=NONE
"hi NonText          ctermbg=NONE ctermfg=10 cterm=NONE
hi MatchParen       ctermbg=NONE ctermfg=10 cterm=NONE
"}}}

" [[ MAPPINGS ]] {{{
"}}}

" [[ VIMSCRIPT ]] {{{
function! EnterStatuslineColor()
	if mode() =~ "[vV\x16]" 
		hi statusline ctermbg=3    ctermfg=0  cterm=NONE
		hi User1      ctermbg=NONE ctermfg=3  cterm=NONE
	else
		if mode() =~ 'i'
			hi statusline ctermbg=6    ctermfg=0  cterm=NONE
			hi User1      ctermbg=NONE ctermfg=6  cterm=NONE
		elseif mode() =~ 'R'
			hi statusline ctermbg=9    ctermfg=0  cterm=NONE
			hi User1      ctermbg=NONE ctermfg=9  cterm=NONE
		else
			hi statusline ctermbg=NONE ctermfg=0  cterm=NONE
			hi User1      ctermbg=NONE ctermfg=0  cterm=NONE
		endif
	endif
endfunction 

function! LeaveStatuslineColor()
	hi statusline ctermbg=10   ctermfg=0  cterm=NONE
	hi User1      ctermbg=NONE ctermfg=10 cterm=NONE
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

function! LinterStatus() abort
	let l:counts = ale#statusline#Count(bufnr(''))
	let l:all_errors = l:counts.error + l:counts.style_error
   	let l:all_non_errors = l:counts.total - l:all_errors
    	return l:counts.total == 0 ? '  ' : printf(
    	\   ' %d  %d',
    	\   all_non_errors,
    	\   all_errors
    	\)
endfunction

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd WinEnter,BufEnter * setlocal statusline=%{FileFormat()}│%{&fileencoding?&fileencoding:&encoding}%1*%*%4c┃%-4l%1*%*%t│%{LinterStatus()}%1*%*%w%h%r%m%=
autocmd WinLeave,BufLeave * setlocal statusline=
autocmd BufWinLeave *.* silent! mkview
autocmd BufWinEnter *.* silent! loadview  

"augroup statusline  
"	autocmd!	
"	autocmd WinEnter,BufEnter * setlocal statusline=%{FileFormat()}│%{&fileencoding?&fileencoding:&encoding}%1*%*%4c┃%-4l%1*%*%t│%{LinterStatus()}%1*%*%w%h%r%m
"	autocmd WinLeave,BufLeave * setlocal statusline=
"	autocmd BufLeave * silent! mkview
"	autocmd BufEnter * silent! loadview  
"augroup end

"augroup remember_folds
"  autocmd!
"  "autocmd BufWinLeave * silent! mkview
"  "autocmd BufWinEnter * silent! loadview
"augroup END
"}}}
