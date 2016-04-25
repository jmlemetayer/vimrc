" ~/.vimrc

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Do not use bell
set noerrorbells

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Use backups in a global directory
set backup
set backupdir=~/.vim/backup

" Formatting
set tabstop=8
set shiftwidth=8
set textwidth=80
set noexpandtab
set cindent
set formatoptions=tcqlron
set cinoptions=:0,l1,t0,g0

" Keywords
syntax keyword cOperator likely unlikely
syntax keyword cType u8 u16 u32 u64 s8 s16 s32 s64

" Highlight 80 column
set colorcolumn=+1
hi ColorColumn ctermbg=black

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Remove multiple blank line
autocmd BufWritePre * :g/^\_$\n\_^$/de

" Remove ending blank line
autocmd BufWritePre * :%s#\($\n\s*\)\+\%$##e

" Searching autocompletion
set incsearch

" Make search results appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" HTML5 configuration
let g:html_exclude_tags = ['html', 'style', 'script', 'body']

" Auto-Format configuration
let g:formatprg_args_expr_c = '"--mode=c
			\ --style=linux
			\ --indent=tab=8
			\ --break-blocks=all
			\ --pad-oper
			\ --pad-header
			\ --unpad-paren
			\ --align-pointer=name
			\ --add-brackets
			\ --max-code-length=80
			\ --lineend=linux"'

" Auto-Format remap
" * Auto-Format
" * Remove trailing whitespaces
" * Remove multiple blank line
" * Remove ending blank line
noremap <F3> :Autoformat<CR>
			\ :%s/\s\+$//e<CR>
			\ :g/^\_$\n\_^$/de<CR>
			\ :%s#\($\n\s*\)\+\%$##e<CR><C-L>

" Solarized
if $TERM =~ "^xterm" || $TERM =~ "^rxvt"
	syntax enable
	set background=dark
	let g:solarized_termtrans=1
	colorscheme solarized
endif
