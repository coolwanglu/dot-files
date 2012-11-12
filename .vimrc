" ~/.vimrc
" by WangLu

set go=
set ruler
set number
set mouse=a
set wildmenu
set tabstop=4
set expandtab
set shellslash
set smartindent
set nocompatible
set cindent shiftwidth=4
set grepprg=grep\ -nH\ $*
set fileencodings=utf8,gbk
set backspace=indent,eol,start
set wildmode=longest,list,full

autocmd Filetype c set omnifunc=ccomplete#Complete
autocmd Filetype cpp set omnifunc=cppcomplete#Complete

syntax on

" for vundle
filetype off
set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle "daylerees/colour-schemes", { "rtp": "vim-themes/" }
Bundle 'Solarized'
"Bundle 'Syntastic'
Bundle 'molokai'
Bundle 'jQuery'
Bundle 'derekwyatt/vim-scala'

filetype plugin on
filetype indent on

" For YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

" Background changed to transparent
"set background=dark
"let g:solarized_termcolors=256 " Use this when the terminal is not using the Solarized theme
"let g:solarized_contrast="high"
"let g:solarized_termtrans=1
"let g:solarized_bold=0
colorscheme Darkside
" need a visible background for Pmenu
" For DaskSide, I just copy the color of StatsLine here.
hi Pmenu ctermfg=250 ctermbg=239 cterm=bold guifg=#bababa guibg=#4e4f50 gui=bold

" for spelling check
setlocal spell spelllang=en_us

" for latexsuite
let g:Tex_DefaultTargetFormat = 'dvi'
" let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_dvi = 'xdvi'
let g:Tex_ViewRule_pdf = 'evince'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'

" for w!!
cmap w!! %!sudo tee %

" for gvim
set guifont=DejaVu\ Sans\ Mono\ Book\ 9
set winaltkeys=no

" for mutt alias auto completion
"au BufRead /tmp/mutt-* source ~/.vim/scripts/mutt-aliases.vim

" using singlecompile
"nmap <F5> :SCCompileRun<CR>
" for SingleCompile
"call SingleCompile#SetCompilerTemplate('scheme', 'mzscheme', 'mzscheme', 'mzscheme', '-r', '')
"call SingleCompile#SetCompilerTemplate('cpp', 'gcc with c++0x & openmp', 'gcc', 'g++', '--std=c++0x -fopenmp', './a.out')
"call SingleCompile#ChooseCompiler('cpp', 'gcc with c++0x & openmp')

" auto format upon ';' and '}' at the end of line
function! WL_auto_format()
    let curline = getline('.')
    let curcol = col('.')
    if match(curline[curcol :], '\S') == -1 " current char is curline[curcol-1]
        let c = curline[curcol-1]
        if c == ';'
            execute "normal \<S-v>=$"
        elseif c == '}'
            execute "normal =%%"
        endif
    endif
endfunction


autocmd Filetype c imap ; ;<ESC>:call WL_auto_format()<CR>a
autocmd Filetype c imap } }<ESC>:call WL_auto_format()<CR>a
autocmd Filetype cpp imap ; ;<ESC>:call WL_auto_format()<CR>a
autocmd Filetype cpp imap } }<ESC>:call WL_auto_format()<CR>a


" for easytags
"set tags=./tags
"let g:easytags_dynamic_files = 1
"let g:easytags_python_enabled = 1
