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

if !filereadable(expand("$HOME/.vim/autoload/plug.vim"))
	silent execute "!curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
	autocmd VimEnter * PlugInstall
endif

" Enable completion where available.
" This setting must be set before ALE is loaded.
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 0
let g:ale_completion_delay = 0
let g:ale_completion_autoimport = 0

call plug#begin(expand("$HOME/.vim/plugged"))
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
call plug#end()

colorscheme dracula
set background=dark

set omnifunc=ale#completion#OmniFunc
let g:ale_use_neovim_diagnostics_api = 0
let g:ale_set_signs = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = ''
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_virtualtext_cursor = 0
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save=1
let g:ale_fixers = {
			\ '*': ['remove_trailing_lines', 'trim_whitespace'],
			\ 'javascript': ['eslint'],
			\}
let g:ale_lint_delay=0
let g:ale_linters={
			"\ 'vim' : ['ale_custom_linting_rules'],
			\ 'lua' : ['lua_language_server'],
			\}
"}}}

" [[ OPTIONS ]] {{{
"set t_Co=256
"set clipboard
set encoding=utf-8
set number
set ignorecase smartcase
set completeopt=menu,menuone,popup,noselect,noinsert
set timeout ttimeout timeoutlen=3000 ttimeoutlen=0
set cursorline cursorlineopt=number,line nocursorcolumn
set autoindent expandtab tabstop=4 shiftwidth=4
set noruler noshowmode showcmd cmdheight=1 laststatus=3 showtabline=0
set splitright
set fillchars=vert:┃,vertleft:┫,vertright:┣,verthoriz:╋,horiz:━,horizup:┻,horizdown:┳
"set viewdir=$HOME/.config/vim/view
set viewoptions-=options
set foldmethod=marker
hi Normal           guibg=NONE                  gui=NONE
hi Terminal         guibg=NONE                  gui=NONE
hi StatusLine       guibg=#50fa7b guifg=#282a36 gui=NONE
hi StatusLineNC     guibg=#50fa7b guifg=#282a36 gui=NONE
hi StatusLineTerm   guibg=#50fa7b guifg=#282a36 gui=NONE
hi StatusLineTermNC guibg=#50fa7b guifg=#282a36 gui=NONE
hi Visual           guibg=#50fa7b guifg=#282a36 gui=NONE
"hi LineNr           guibg=#1d2021 guifg=#a9b66V5 gui=NONE
"hi CursorColumn     guibg=235                   gui=NONE
"hi CursorLine       guibg=#504945               gui=NONE
hi CursorLineNr     guibg=#282a36 guifg=#50fa7b gui=NONE
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
"}}}

" [[ MAPPINGS ]] {{{
nnoremap <silent> fz :fzf!<CR>
nnoremap <silent> ff :Files<CR>
nnoremap <silent> fb :Buffers<CR>
nnoremap <silent> <leader>t :vertical terminal<CR>
"}}}

" [[ VIMSCRIPT ]] {{{
function! EnterStatuslineColor()
	if mode() =~ "[vV\x16]"
		hi statusline guibg=#ffb86c guifg=#282a36 gui=NONE
	else
		if mode() =~ 'i'
			hi statusline guibg=#8be9fd guifg=#282a36 gui=NONE
		elseif mode() =~ 'R'
			hi statusline guibg=#ff5555 guifg=#282a36 gui=NONE
		else
			hi statusline guibg=#ff79c6 guifg=#282a36 gui=NONE
		endif
	endif
endfunction

function! LeaveStatuslineColor()
	hi statusline guibg=#50fa7b guifg=#282a36 gui=NONE
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

"autocmd BufWinLeave *.* silent! mkview
"autocmd BufWinEnter *.* silent! loadview
"}}}
