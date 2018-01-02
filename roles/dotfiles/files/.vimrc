" pathogen will load all vim bundles (located in ~/.vim/bundle)
call pathogen#infect()
call pathogen#helptags()

syntax on
filetype plugin indent on

"set foldmethod=indent        " fold based on indentation (alt: syntax, but does not work with Clojure)

set wildmenu                 " show selection menu for :find command
set path+=**                 " search for files in all subdirectories

set tabstop=4                " size of a hard tabstop
set shiftwidth=4             " size of an "indent"
set smarttab                 " make "tab" insert indents instead of tabs at the beginning of a line
set expandtab                " always uses spaces instead of tab characters
set backspace=indent,start   " allow deleting beyond indent and start of insert buffer (not EOL)

set number                   " display line numbers
set relativenumber           " display relative line numbers

set ignorecase               " ignore case in search (\C for case sensitive search)
set smartcase                " if including uppercase in search, do case sensitive search
set hlsearch                 " highlight search match
set incsearch                " also highlight other matches

set cursorline               " highlight the line where my cursor is
set highlight=c:LineNr       " highlight the number of the current line (not working?)

set scrolloff=3              " keep a few lines for context

set list                     " display spaces
set listchars=trail:-        " display trailing spaces as bullet (U+2022)

set laststatus=2             " display status line always
"set ruler                    " display ruler: useless when using statusline

let mapleader=","

" Unmap arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" shortcut to follow link C-] does not work on Azerty
nnoremap <C-T> <C-]>

" let g:LoupeLoaded=1    " to avoid loading Loupe plugin
let g:LoupeVeryMagic=0   " do not enable 'very magic' mode by default
" nnoremap <leader>x :nohl<CR>
nmap <leader>x <Plug>(LoupeClearHighlight)

nnoremap <C-w>: :vsplit<CR><C-w><C-w>
nnoremap <C-w>- :split<CR><C-w><C-w>

nnoremap <C-S-F> :Ack <c-r>=expand("<cword>")<CR>

" shortcuts for executing Clojure in vim (through Fireplace)
nnoremap <leader>e :Eval<CR>
"nnoremap E :%Eval<CR>
"nnoremap T :Require!<CR>:RunTests<CR>

nnoremap <leader>n :NERDTree<CR>

"colorscheme tayra
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Clojure rainbow parentheses always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['black',       'SeaGreen3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['red',         'firebrick3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ]

let g:notes_directories = ['~/Dropbox/Notes/LPixel']
let g:notes_conceal_url = 0

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

if has('linebreak')
    "let &showbreak='⤷'
    let &showbreak='+'
endif

" filetype mappings
au BufNewFile,BufRead *.ino set filetype=c
au BufNewFile,BufRead *.sdf set filetype=xml
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead *.pxi set filetype=clojure

" highlight current search in green
highlight Search gui=underline ctermfg=green ctermbg=black cterm=bold,underline term=underline
highlight IncSearch guibg=green ctermbg=green term=underline

" NERDTree settings
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']

" PyMode settings
let g:pymode_rope=0
let g:pymode_lint=0

" YouCompleteMe settings
set encoding=utf-8

