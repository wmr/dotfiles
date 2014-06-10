" ============================================================================
"
" .vimrc // OSX // v1.4.1
" (c) 2014 // wmr
"
" ============================================================================


" ================================================================ Bundles {{{

if has('vim_starting')
    set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Fetch the NeoBundle itself
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


" Usability ============================================================== {{{

" Web api for plugins
NeoBundle 'mattn/webapi-vim'

" Creating gists
NeoBundle 'mattn/gist-vim'

" Async build/dispatch
NeoBundle 'tpope/vim-dispatch'

" Git wrapper
NeoBundle 'tpope/vim-fugitive'

" Edit text surrounding a selection
NeoBundle 'tpope/vim-surround'

" Shorthands for generic stuff
NeoBundle 'tpope/vim-unimpaired'

" Repeat last action
NeoBundle 'tpope/vim-repeat'

" Enhancements for date string literals
NeoBundle 'tpope/vim-speeddating'

" Powerline alternative
NeoBundle 'bling/vim-airline'

" easy naviagation within files
NeoBundle 'Lokaltog/vim-easymotion'

" Smart selection
NeoBundle 'gcmt/wildfire.vim'

" Fully capable terminal window
NeoBundle 'pthrasher/conqueterm-vim'

" Generate powerline prompts
NeoBundle 'edkolev/promptline.vim'

" yank history
NeoBundle 'vim-scripts/YankRing.vim'

" }}}

" FileSystem ============================================================= {{{

" Fuzzy search files/buffers
NeoBundle 'kien/ctrlp.vim'

" Another fuzzy search tool with different scope
NeoBundle 'Shougo/unite.vim'

" Browse the filesystem easily
NeoBundle 'scrooloose/nerdtree'


" ag // silver_searcher
NeoBundle 'rking/ag.vim'

" }}}

" Development ============================================================ {{{

" Snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

" Formatting tools
NeoBundle 'Chiel92/vim-autoformat'

" Flake8 for python
NeoBundle 'nvie/vim-flake8'

" Syntax and code quality check for various languages
NeoBundle 'scrooloose/syntastic'

" Commenting blocks, etc
NeoBundle 'scrooloose/nerdcommenter'

" Show git diff inline
"NeoBundle 'airblade/vim-gitgutter'

" Close brackets automatically
NeoBundle 'Raimondi/delimitMate'

" Tree like overview of undo options
NeoBundle 'sjl/gundo.vim'

" Text expander tool for html/xml
NeoBundle 'mattn/emmet-vim'

" Fuzzy code completion
NeoBundle 'Valloric/YouCompleteMe', {'build': {'mac': 'install.sh'}}

" Switch between text patterns
NeoBundle 'AndrewRadev/switch.vim'

" Display tags
NeoBundle 'majutsushi/tagbar'

" Auto-resize windows by the golden ratio
NeoBundle 'zhaocai/GoldenView.Vim'

" Select makeprg automatically
NeoBundle 'johnsyweb/vim-makeshift'

" Tabularize text by separator
NeoBundle 'godlygeek/tabular'

" Various tools for go
"NeoBundle 'fatih/vim-go'

" }}}


" Color Schemes ========================================================== {{{

" essential color schemes // the order is important
" to override the old stuff in flazz/vim-colorschemes
NeoBundle 'noahfrederick/vim-hemisu'
NeoBundle 'romainl/Apprentice'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jonathanfilip/vim-lucius'

" a bundle of many useful color schemes
NeoBundle 'flazz/vim-colorschemes'

" }}}


" Syntax ================================================================= {{{

" Enhanced python highlight
NeoBundle 'mitsuhiko/vim-python-combined'

" ObjC enhancements
NeoBundle 'b4winckler/vim-objc'
NeoBundle 'msanders/cocoa.vim'

" syntax hl for markdown
NeoBundle 'plasticboy/vim-markdown'

" enhanced c++14 highlight
NeoBundle 'octol/vim-cpp-enhanced-highlight'

" }}}


call neobundle#end()

" re-enable filetype
filetype on
filetype indent on
filetype plugin indent on
NeoBundleCheck

" }}}


" Default mode setup ===================================================== {{{


" Behavior =============================================================== {{{

" switch off vi compatibility mode, cuz that's for grandpas
set nocompatible

" allow backspace in any context
set backspace=2

" do not create backup/swap files
set nobackup
set nowb
set noswapfile

" hide buffers instead of closing them
set hidden

" increase the size of history
set history=100

" enable modelines
set modeline

" check 5 lines for modelines
set modelines=5

" enable magic for pattern matching
set magic

" switch off the annoying error bell
set noerrorbells
set visualbell t_vb=

" use the_silver_searcher for grep
set grepprg=ag

" set search ignore case based on the search string
set smartcase

" enable search highlight
set hls

" set fill character for diff
set fillchars+=diff:⣿

" do not select the end of the line
set selection=old

if has('mouse')

    " allow mouse everywhere
    set mouse=a

    " hide mouse while typing
    set mousehide

endif

" }}}


" Indent ================================================================= {{{

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

" }}}


" Appearance ============================================================= {{{

" enable line numbers
set nu

" always show status line
set laststatus=2

" show line and cursor position
set ruler

" show trailing whitespace
set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

" enable syntax highlighting
syn on

" }}}


" Folding ================================================================ {{{

" enable folding
set foldenable

" method to find folds
set foldmethod=syntax

" one level fold
set foldlevel=0

" do not nest more than 2 folds
set foldnestmax=2

" }}}


" UI specific ============================================================ {{{

if has('gui_running')

    " disable menu bar
    set guioptions-=m

    " disable tool bal
    set guioptions-=T

    " disable letf scrollbar (incl if split present)
    set guioptions-=l
    set guioptions-=L

    " disable right scrollbar (incl if split present
    set guioptions-=r
    set guioptions-=R

    set guifont=Monaco\ for\ Powerline:h12
    set columns=105

    colo hornet

    " MacVim specific settings
    if has('gui_macvim')
        set transparency=3
    endif

endif

" }}}

" }}}


" Path setup ============================================================= {{{

" set search paths (for gf, etc)
set path=.,.vim/,/usr/include/,/usr/local/include/,/opt/local/include/,
" OSX / clang specific include paths
set path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/c++/v1/,
set path+=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/5.1/include/,

" }}}


" Variable setup ========================================================= {{{

" Built-int ============================================================== {{{

let mapleader=','
let python_highlight_all=1

" }}}


" CtrlP ================================================================== {{{

"let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer=0
let g:ctrlp_working_path_mode=0
" use ag for search // TODO: tweak params since very slow from home folder
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_clear_cache_on_exit=1

" }}}


" ConqueTerm ============================================================= {{{

" disable warning messages
let g:ConqueTerm_StartMessages=0

" }}}


" NERDTree =============================================================== {{{

" switch off special arrow characters in NERDTree by default
let NERDTreeDirArrows=0
" close the NERDTree tool window after opening a file
let NERDTreeQuitOnOpen=1

" add support for ninja in makeshift
let g:makeshift_systems={
            \'build.ninja':'ninja'
            \}
" }}}


" Tagbar ================================================================= {{{

" set up exuberant-ctags
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

" add a definition for Objective-C to tagbar // needs build ctags from HEAD
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }

" add a definition for zsh support (requires config in ~/.ctags).
let g:tagbar_type_zsh = {
    \ 'ctagstype': 'zsh',
    \ 'kinds': [
        \ 'f:functions:1'
    \ ],
    \ 'fold': 0
\ }

" }}}


" Gist-vim =============================================================== {{{

" gist-vim setup for github
let g:gist_detect_filetype=1
let g:gist_open_browser_after_post=1
let g:gist_use_password_in_gitconfig=1

" }}}


" GoldenView ============================================================= {{{

" disable goldenview default mappings // overlaps w/ CtrlP
let g:goldenview__enable_default_mapping=0

" }}}


" UltiSnips ============================================================== {{{

" UltiSnips setup
let g:snips_author="wmr"
let g:snips_author_email="wmr101@gmail.com"

" favor single quotes in python snippets
let g:ultisnips_python_quoting_style='single'
" use sphinx docstring style
let g:ultisnips_python_style='sphinx'

" <NL> == <C-j>, works in term well
let g:UltiSnipsExpandTrigger="<NL>"
let g:UltiSnipsSnippetDir="~/.vim/UltiSnips"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" }}}


" YankRing =============================================================== {{{

" place history folder under ~/.cache/yankring-history
let g:yankring_history_dir="$HOME/.cache/"
let g:yankring_history_file = 'yankring-history.txt'

" yankring defaults overlaps w/ CtrlP
let g:yankring_replace_n_pkey='‘' "option+[
let g:yankring_replace_n_nkey='“' "option+]

" airline theme + powerline fonts
let g:airline_theme='luna'

" UI specific fonts and themes
if has("gui_running")
    let g:airline_powerline_fonts=1
    let g:unite_prompt = '❫ '
    let g:ycm_error_symbol = '❫ '
    let g:ycm_warning_symbol = '❫ '
    let NERDTreeDirArrows=1
endif

" }}}

" Syntastic ============================================================== {{{

" clang complete
let g:clang_library_path="/Library/Developer/CommandLineTools/usr/lib/"

" Syntastic compiler setup for c/cpp/objc/objcpp
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

" }}}

" }}}


" Functions ============================================================== {{{

" use ConqueTerm w/ keyword progs
function! ConqueMan()
    let cmd = &keywordprg . ' '
    if cmd ==# 'man ' || cmd ==# 'man -s '
        if v:count > 0
            let cmd .= v:count.' '
        else
            let cmd = 'man '
        endif
    endif
    let cmd .= expand('<cword>')
    exe 'ConqueTermSplit' cmd
endfunction
map K :<C-u>call ConqueMan()<CR>

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

" }}}


" Auto commands ========================================================== {{{

augroup variousGroup
    autocmd!

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
    autocmd BufReadPre,BufNewFile *.yml setlocal ts=2 sw=2 sts=2 expandtab
    autocmd BufReadPre,BufNewFile *.*htm* setlocal ts=2 sw=2 sts=2 expandtab

    " set custom syn hl for python (MacVim only)
    if has("gui_running")
        autocmd BufReadPre,BufNewFile *.py colo hemisu
    endif

    autocmd FileType vim,zsh colo badwolf
    autocmd FileType zsh setlocal ts=2 sw=2 sts=2 expandtab

    autocmd BufReadPre,BufNewFile *.py setlocal mp=python2.7\ %

    " set filetype for ObjC + + files
    autocmd BufRead,BufNewFile *.m setlocal filetype=objc
    autocmd BufRead,BufNewFile *.mm setlocal filetype=objcpp

    autocmd FileType objcpp ru after/syntax/objc_enhanced.vim
                \| let b:match_words = '@\(implementation\|interface\):@end'

augroup END

augroup switchGroup
    autocmd Filetype python let b:switch_custom_definitions=
                \[
                \   {
                \       'xrange': 'range',
                \       ' range': ' xrange',
                \   }
                \]
augroup END

" }}}

" Keyboard mappings ====================================================== {{{


" Navigation ============================================================= {{{

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

" emacs/mac textfield like navigation in insert mode
" this is sort of an abomination, but I guess I am lazier than religious
inoremap <C-a>  <Esc>^i
inoremap <C-e>  <Esc>$a
inoremap <C-k>  <Esc>d$a
inoremap <C-u>  <Esc>ddO

" move current line up or down in normal mode
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==

nnoremap <Leader>ag    :Ag<space>

" default make commands
nnoremap <silent> <Leader>ma    :make<CR>
nnoremap <silent> <Leader>mr    :make all<CR>
nnoremap <silent> <Leader>mc    :make clean<CR>

" kill the highlight of last search result with: <Leader>/
nnoremap <silent> <Leader>/    :nohlsearch<CR>

" exit buffer
nnoremap <silent> <Leader>qq   :q!<CR>
nnoremap <silent> <Leader>qw   :wq!<CR>

" cd to current file's working dir
nnoremap <Leader>cd    :cd %:p:h<CR>:pwd<CR>

" edit rc files
nnoremap <silent> <Leader>rc   :tabe ~/.vimrc<CR>
nnoremap <silent> <Leader>zrc  :tabe ~/.zshrc<CR>

" diff unsaved
nnoremap <silent> <Leader>vdc :<C-u>DiffSaved<CR>
nnoremap <silent> <Leader>dc :KSDiffSaved<CR>

com! Autopep8 :!autopep8 -i %

" }}}

" Plugin mappings ======================================================== {{{
"
" vim-fugitive mappings
nnoremap [fugitive]  <Nop>
nmap    <Leader>g [fugitive]

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
nnoremap <silent> <Leader>nt   :<C-u>NERDTree<CR>
nnoremap <silent> <Leader>tb   :<C-u>TagbarToggle<CR>
nnoremap <silent> <Leader>uu   :<C-u>GundoToggle<CR>

" EasyMotion mappings
" backlash to activate
map <Leader> <Plug>(easymotion-prefix)
"nmap s <Plug>(easymotion-s2)
"nmap t <Plug>(easymotion-t2)
" replace normal search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" 1. split to tiled windows
nmap <silent> <C-L>  <Plug>GoldenViewSplit

" quickly switch current window with the main pane
" and toggle back
nmap <silent> <Leader>lm    <Plug>GoldenViewSwitchMain
nmap <silent> <Leader>lt    <Plug>GoldenViewSwitchToggle

" resize current window appropriately
nmap <silent> <Leader>ll    <Plug>GoldenViewResize

" switch
nnoremap <Leader><Leader>s :Switch<CR>

" UltiSnips fixes
inoremap <c-x><c-k> <c-x><c-k>

" }}}

" }}}

" Color scheme =========================================================== {{{

if has('gui_running')
    colo hornet
else
    colo distinguished
endif

" }}}
