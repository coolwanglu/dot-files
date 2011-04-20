" ~/.vimrc
" by WangLu

set ruler
set nocompatible
syntax on
set tabstop=4
set cindent shiftwidth=4
set smartindent
set expandtab
set fileencodings=utf8,gbk
set backspace=indent,eol,start
autocmd Filetype c set omnifunc=ccomplete#Complete
autocmd Filetype cpp set omnifunc=cppcomplete#Complete

filetype plugin on
set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on

" Background changed to transparent
set background=dark
"let g:solarized_termcolors=256 " Use this when the terminal is not using the Solarized theme
let g:solarized_contrast="normal"
let g:solarized_termtrans=1
colorscheme solarized

set mouse=a

set runtimepath+=/usr/share/vim/addons

" for spelling check
setlocal spell spelllang=en_us

let g:Tex_DefaultTargetFormat = 'dvi'
" let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'

" for w!!
cmap w!! %!sudo tee %

" for gvim
set guifont=DejaVu\ Sans\ Mono\ Book\ 11
set winaltkeys=no

" for mutt alias auto completion
au BufRead /tmp/mutt-* source ~/.vim/scripts/mutt-aliases.vim

set number
set go=
set guifont=DejaVu\ Sans\ Mono\ 10
