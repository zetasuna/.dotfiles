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
let g:mapleader='\'
filetype on
filetype plugin on
filetype indent on
set nocompatible
set runtimepath^=$HOME/.local/share/nvim

if !filereadable(expand("$HOME/.local/share/nvim/autoload/plug.vim"))
	silent execute "!curl -fLo $HOME/.local/share/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	autocmd VimEnter * PlugInstall
endif

" Enable completion where available.
" This setting must be set before ALE is loaded.
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled=1
let g:ale_completion_delay=0

call plug#begin(expand("$HOME/.local/share/nvim/plugged"))
Plug 'sainnhe/gruvbox-material'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" Important!!
if has('termguicolors')
	set termguicolors
endif
if has("syntax")
	syntax on
endif
set background=dark
" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background='hard'
"colorscheme gruvbox-material
colorscheme  dracula

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save=1
let g:ale_fixers = {
			\ '*': ['remove_trailing_lines', 'trim_whitespace'],
			\ 'javascript': ['eslint'],
			\}
let g:ale_lint_delay=0
let g:ale_linters={
			\ 'vim' : ['ale_custom_linting_rules'],
			\ 'lua' : ['lua_language_server'],
			\}
"}}}

" [[ OPTIONS ]] {{{
"set t_Co=256
set timeout
set ttimeout
set timeoutlen=3000
set ttimeoutlen=0
set number
set cursorline
set cursorlineopt=number,line
set nocursorcolumn
"set clipboard
set noshowmode
set showcmd
set cmdheight=0
set laststatus=3
set noruler
set showtabline=0
set splitright
set fillchars=vert:┃,vertleft:┫,vertright:┣,verthoriz:╋,horiz:━,horizup:┻,horizdown:┳
"set viewdir=$HOME/.local/share/vim/view
set viewoptions-=options
set foldmethod=marker
"hi Normal           guibg=NONE                  gui=NONE
hi Terminal         guibg=#1d2021               gui=NONE
hi StatusLine       guibg=#a9b665 guifg=#1d2021 gui=NONE
hi StatusLineNC     guibg=#a9b665 guifg=#1d2021 gui=NONE
hi StatusLineTerm   guibg=#a9b665 guifg=#1d2021 gui=NONE
hi StatusLineTermNC guibg=#a9b665 guifg=#1d2021 gui=NONE
hi Visual           guibg=#a9b665 guifg=#1d2021 gui=NONE
"hi LineNr           guibg=#1d2021 guifg=#a9b665 gui=NONE
"hi CursorColumn     guibg=235                   gui=NONE
"hi CursorLine       guibg=#504945               gui=NONE
"hi CursorLineNr     guibg=#1d2021 guifg=#a9b665 gui=NONE
hi WinSeparator       guibg=#1d2021 guifg=#a9b665 gui=NONE
"hi IncSearch        ctermbg=green ctermfg=black cterm=NONE
"hi WildMenu         ctermbg=NONE ctermfg=10 cterm=NONE
hi ModeMsg          guibg=#a9b665 guifg=#1d2021 gui=NONE
hi MoreMsg          guibg=#1d2021 guifg=#a9b665 gui=NONE
hi ErrorMsg         guibg=#1d2021 guifg=#ea6962 gui=NONE
hi WarningMsg       guibg=#1d2021 guifg=#ea6962 gui=NONE
hi Question         guibg=#1d2021 guifg=#ea6962 gui=NONE
hi Title            guibg=#1d2021 guifg=#a9b665 gui=NONE
"hi SpecialKey       guibg=#1d2021 guifg=#a9b665 gui=NONE
"hi NonText          guibg=#1d2021 guifg=#a9b665 gui=NONE
"hi MatchParen       ctermbg=NONE ctermfg=10 cterm=NONE
"}}}

" [[ MAPPINGS ]] {{{
nnoremap <silent> fz :fzf!<CR>
nnoremap <silent> ff :Files!<CR>
nnoremap <silent> fb :Buffers!<CR>
nnoremap <silent> <leader>t :vertical terminal<CR>
"}}}

" [[ VIMSCRIPT ]] {{{
function! EnterStatuslineColor()
	if mode() =~ "[vV\x16]"
		hi statusline guibg=#d8a657 guifg=#1d2021 gui=none
	else
		if mode() =~ 'i'
			hi statusline guibg=#7daea3 guifg=#1d2021 gui=none
		elseif mode() =~ 'R'
			hi statusline guibg=#ea6962 guifg=#1d2021 gui=none
		else
			hi statusline guibg=#7c6f64 guifg=#1d2021 gui=none
		endif
	endif
endfunction

function! LeaveStatuslineColor()
	hi statusline guibg=#a9b665 guifg=#1d2021 gui=none
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
    	\   ' %d│ %d',
    	\   all_non_errors,
    	\   all_errors
    	\)
endfunction

autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd WinEnter,BufEnter * setlocal statusline=%{FileFormat()}│%{&fileencoding?&fileencoding:&encoding}%4c┃%-4l%t│%{LinterStatus()}%w%h%r%m%=
autocmd WinLeave,BufLeave * setlocal statusline=%=

autocmd BufWinLeave *.* silent! mkview
autocmd BufWinEnter *.* silent! loadview
"}}}
