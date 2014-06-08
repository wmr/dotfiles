"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" .vimrc // OSX
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" default mode setup
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" switch off vi compatibility mode, cuz that's for grandpas
set nocompatible
" allow backspace in any context
set backspace=2
" enable line numbers
set nu
" set tab stop
set ts=4
" set shift width
set sw=4
" enable auto indentation
set autoindent
" use C indentation rules
set cindent
" expand tabs to spaces
set expandtab
" show line and cursor position
set ruler
" enable modelines
set modeline
" check 5 lines for modelines
set modelines=5
" enable magic for pattern matching
set magic
" switch off the annoying error bell
set noerrorbells
set visualbell t_vb=
" do not create backup/swap files
set nobackup
set nowb
set noswapfile
" hide buffers instead of closing them
set hidden
" increase the size of history
set history=100
" always show status line
set laststatus=2
" show trailing whitespace
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.
" enable folding
set foldenable
set foldmethod=indent
" use the_silver_searcher for grep
set grepprg=ag
" set search ignore case based on the search string
set smartcase
" enable search highlight
set hls

"
" set search paths (for gf, etc)
"
set path=.,/usr/include/,/usr/local/include/,/opt/local/include/,
" OSX / clang specific include paths
set path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/c++/v1/,
set path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/5.1/include/,


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" global variables
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" switch of special arrow characters in NERDTree by default
let NERDTreeDirArrows=0
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

" add support for ninja in makeshift
let g:makeshift_systems={
            \'build.ninja':'ninja'
            \}

" enable objc support in Tagbar
let g:tagbar_type_objc = {
            \ 'ctagstype': 'objc',
            \ 'ctagsargs': [
            \ '-f',
            \ '-',
            \ '--excmd=pattern',
            \ '--extra=',
            \ '--format=2',
            \ '--fields=nksaSmt',
            \ '--options='.expand('~/.vim/objctags'),
            \ '--objc-kinds=-N',
            \ ],
            \ 'sro': ' ',
            \ 'kinds': [
            \ 'c:constant',
            \ 'e:enum',
            \ 't:typedef',
            \ 'i:interface',
            \ 'P:protocol',
            \ 'p:property',
            \ 'I:implementation',
            \ 'M:method',
            \ 'g:pragma',
            \ ],
            \ }

" gist-vim setup for github
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_use_password_in_gitconfig=1

" disable goldenview default mappings
let g:goldenview__enable_default_mapping=0

" UltiSnips setup
let g:snips_author="wmr"
let g:snips_author_email="wmr101@gmail.com"

" <NL> == <C-j>, works in term well
let g:UltiSnipsExpandTrigger="<NL>"
let g:UltiSnipsSnippetDir="~/.vim/UltiSnips"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" yankring key mapping
let g:yankring_replace_n_pkey='‘' "option+[
let g:yankring_replace_n_nkey='“' "option+]

" airline theme + powerline fonts
let g:airline_theme='luna'

" UI specific fonts and themes
if has("gui_running")
    let g:airline_powerline_fonts=1
    let g:unite_prompt = '❫ '
    let NERDTreeDirArrows=1
endif

" clang complete
let g:clang_library_path="/Library/Developer/CommandLineTools/usr/lib/"

" Syntastic
let g:syntastic_cpp_compiler="clang++"
let g:syntastic_cpp_compiler_options=" -std=c++1y -stdlib=libc++ "

let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_auto_refresh_includes=1

let g:syntastic_objc_compiler="clang"
let g:syntastic_objc_compiler_options=" -fobjc -fobjc-arc "
let g:syntastic_objc_check_header=1
let g:syntastic_objc_auto_refresh_includes=1

let g:syntastic_objcpp_compiler="clang++"
let g:syntastic_objcpp_compiler_options=" -std=c++1y -stdlib=libc++ -fobjc -fobjc-arc "
let g:syntastic_objcpp_check_header=1
let g:syntastic_objcpp_auto_refresh_includes=1

"
" functions
"

" see unsaved changes in vimdiff
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=".filetype

endfunction
com! DiffSaved call s:DiffWithSaved()

" see unsaved changes in ksdiff
function! s:KSDiffWithSaved()
    :silent !mkdir -p /tmp/vimtemp
    :silent w! /tmp/vimtemp/%:t
    :silent !ksdiff % /tmp/vimtemp/%:t &
endfunction
com! KSDiffSaved call s:KSDiffWithSaved()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" load bundles with NeoBundle
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
    set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" vimproc plugin native extension
let g:neobundle_ext_vimproc_updcmd = has('win64') ?
            \ 'tools\\update-dll-mingw 64' : 'tools\\update-dll-mingw 32'

" background process support // used by unite and NeoBundle itself
NeoBundle 'Shougo/vimproc.vim', {'build':
            \{'windows': g:neobundle_ext_vimproc_updcmd,
            \'cygwin': 'make -f make_cygwin.mak',
            \'mac': 'make -f make_mac.mak',
            \'unix': 'make -f make_unix.mak'}}

" web api
NeoBundle 'mattn/webapi-vim'
" creating gists
NeoBundle 'mattn/gist-vim'
" async build/dispatch
NeoBundle 'tpope/vim-dispatch'
" git wrapper
NeoBundle 'tpope/vim-fugitive'
" edit text surrounding a selection
NeoBundle 'tpope/vim-surround'
" sharhands for generic stuff
NeoBundle 'tpope/vim-unimpaired'
" repeat last action
NeoBundle 'tpope/vim-repeat'
" enhancements for date string literals
NeoBundle 'tpope/vim-speeddating'
" powerline alternative
NeoBundle 'bling/vim-airline'
" snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
" easy naviagation within files
NeoBundle 'Lokaltog/vim-easymotion'
" smart selection
NeoBundle 'gcmt/wildfire.vim'
" fuzzy search files/buffers
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/unite.vim'
" formatting tools
NeoBundle 'Chiel92/vim-autoformat'
" flake8 for python
NeoBundle 'nvie/vim-flake8'
" check for errors on save
NeoBundle 'scrooloose/syntastic'
" easy comment management
NeoBundle 'scrooloose/nerdcommenter'
" folder management
NeoBundle 'scrooloose/nerdtree'
" fuzzy code completion
" essential color schemes
NeoBundle 'flazz/vim-colorschemes'
" ObjC enhancements
"NeoBundle 'b4winckler/vim-objc'
"NeoBundle 'msanders/cocoa.vim'
" syntax hl for go
"NeoBundle 'fatih/vim-go'
" syntax hl for markdown
NeoBundle 'plasticboy/vim-markdown'
" yank history
NeoBundle 'vim-scripts/YankRing.vim'
" ag // silver_searcher
NeoBundle 'rking/ag.vim'
" show git diff inline
"NeoBundle 'airblade/vim-gitgutter'
" close brackets automatically
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Valloric/YouCompleteMe', {'build': {'mac': 'install.sh'}}
NeoBundle 'AndrewRadev/switch.vim'
NeoBundle 'xuhdev/SingleCompile'
NeoBundle 'majutsushi/tagbar'
" autoreize windows w/ golden ratio
NeoBundle 'zhaocai/GoldenView.Vim'
" select makeprg automatically
NeoBundle 'johnsyweb/vim-makeshift'
NeoBundle 'godlygeek/tabular'

call neobundle#end()

" re-enable filetype
filetype plugin indent on
NeoBundleCheck


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" set color scheme and font
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use different color scheme and font for MacVim and vim
if has("gui_running")
    set guifont=Monaco\ for\ Powerline:h12
    colo hornet
    set columns=105
else
    colo distinguished
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Auto commands
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remove whitespace on save
autocmd BufWritePre *.hh,*.hpp,*.m*,*.c*,*.py,*.rb,*.ninja,.vimrc :%s/\s\+$//e

" disable syntax hl for huge files
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" change the working directory to the current file's directory
autocmd BufEnter * silent! lcd %:p:h

" set codepage and style for .nfo files
autocmd BufReadPre,BufNewFile *.nfo setlocal encoding=cp437 lines=50 columns=85
            \colo ir_black

" set custom tabsize for yaml/*html* files
autocmd BufReadPre,BufNewFile *.yml setlocal ts=2 setlocal sw=2 sts=2 expandtab
autocmd BufReadPre,BufNewFile *.*htm* setlocal ts=2 sw=2 sts=2 expandtab

" set custom syn hl for python (MacVim only)
if has("gui_running")
    autocmd BufReadPre,BufNewFile *.py colo hemisu
endif

autocmd BufReadPre,BufNewFile *.py setlocal mp=python2.7\ %

" set filetype for ObjC + + files
autocmd BufRead,BufNewFile *.m setlocal filetype=objc
autocmd BufRead,BufNewFile *.mm setlocal filetype=objcpp

autocmd FileType objcpp ru after/syntax/objc_enhanced.vim
			\| let b:match_words = '@\(implementation\|interface\):@end'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Keyboard mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Navigation
"

" treat wrapped lines as normal lines
nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk

" go up and down in a faster peace option+j,k
nnoremap ∆ 4j
nnoremap ˚ 4k
xnoremap ∆ 4j
xnoremap ˚ 4k

" navigate between windows
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l


" move current line up or down in normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

nnoremap ,ag    :Ag<space>

" default make commands
nnoremap <silent> ,ma    :make<CR>
nnoremap <silent> ,mr    :make all<CR>
nnoremap <silent> ,mc    :make clean<CR>

"
" shorthands for various tasks
"

" kill the highlight of last search result with: ,/
nnoremap <silent> ,/    :nohlsearch<CR>

" vim-fugitive mapings
nnoremap [fugitive]  <Nop>
nmap    ,g [fugitive]

nnoremap <silent> [fugitive]s   :Gstatus<CR>
nnoremap <silent> [fugitive]c   :Gcommit<CR>
nnoremap <silent> [fugitive]d   :Gdiff<CR>

" Unite mappings
nnoremap [unite]    <Nop>
nmap f  [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
            \ -buffer-name=files buffer bookmark file<CR>

nnoremap <silent> [unite]s   :<C-u>Unite<CR>
nnoremap <silent> [unite]t   :<C-u>Unite tab<CR>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]fr  :<C-u>Unite file_rec/async<CR>
nnoremap <silent> [unite]g   :<C-u>Unite grep<CR>

" tool windows
nnoremap <silent> ,nt   :<C-u>NERDTree<CR>
nnoremap <silent> ,tb   :<C-u>TagbarToggle<CR>
nnoremap <silent> ,uu   :<C-u>GundoToggle<CR>

" exit buffer
nnoremap <silent> ,qq   :q!<CR>
nnoremap <silent> ,wq   :wq!<CR>

" cd to current file's working dir
nnoremap ,cd    :cd %:p:h<CR>:pwd<CR>

" edit rc files
nnoremap <silent> ,rc   :tabe ~/.vimrc<CR>
nnoremap <silent> ,zrc  :tabe ~/.zshrc<CR>

" diff unsaved
nnoremap <silent> ,vdc :DiffSaved<CR>
nnoremap <silent> ,dc :KSDiffSaved<CR>

"
" Plugin mappings
"

" EasyMotion mappings
" backlash to activate
map <Leader> <Plug>(easymotion-prefix)
"nmap s <Plug>(easymotion-s2)
"nmap t <Plug>(easymotion-t2)
" replace normal search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

" 1. split to tiled windows
nmap <silent> <C-L>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> ,wm   <Plug>GoldenViewSwitchMain
nmap <silent> ,wt <Plug>GoldenViewSwitchToggle

com! Autopep8 :!autopep8 -i %

" UltiSnips fixes
inoremap <c-x><c-k> <c-x><c-k>

" enable syntax highlighting
syn on
