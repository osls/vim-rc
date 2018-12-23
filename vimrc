""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Wang's Vim configuration,
"     for processing tex/pdf, and coding in Golang & Python
"
" Based on Amir Salihefendic's basic.vimrc
"     https://github.com/amix/vimrc
" Bram Moolenaar's mswin.vim
"     http://vim.cybermirror.org/runtime/mswin.vim
" and many other internet resources.
"
" COPYRIGHT  B.W.  2010-2018
" https://github.com/osls/vim-rc
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Init
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" necesary for lots of cool vim things
set nocompatible

" replace system's fish shell. run sh cmd with :! or :r!
set shell=/bin/zsh

" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" set the leader
let mapleader = ","
let g:mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
"  'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
call plug#begin()
    "" surround
        Plug 'tpope/vim-surround'
    "" exchange
        Plug 'tommcdo/vim-exchange'
    "" multiple-cursors
        Plug 'terryma/vim-multiple-cursors'
    "" auto-align
        Plug 'junegunn/vim-easy-align'
    "" easy motion
        Plug 'lokaltog/vim-easymotion'
    "" better repeater
        Plug 'tpope/vim-repeat'
    "" user interface
        Plug 'reedes/vim-colors-pencil'
    "" show | in front of indent line
        Plug 'Yggdroot/indentLine'
    "" a better status line
        Plug 'vim-airline/vim-airline'
    "" resources
        Plug 'shougo/denite.nvim'
        Plug 'codepiano/ctrlp.vim'
    "" session and more
        Plug 'mhinz/vim-startify'
        Plug 'xolox/vim-misc'
        Plug 'xolox/vim-session'
    "" auto completion
        Plug 'valloric/YouCompleteMe', { 'do': 'git submodule update --init --recursive;./install.py --gocode-completer' }
        Plug 'ervandew/supertab'
    "" snippet
        Plug 'sirver/ultisnips'
        Plug 'honza/vim-snippets', { 'do': 'cp $HOME/.vim/plugged/vim-snippets/UltiSnips/ $HOME/.vim/' }
    "" syatastic
        Plug 'scrooloose/syntastic'
    "" nerds
        Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
        Plug 'scrooloose/nerdcommenter'
    "" debugger (, { 'on':  'VBGattachGDB' })
        Plug 'Shougo/vimproc.vim', { 'do': 'make; cp -r $HOME/.vim/plugged/vimproc.vim/autoload $HOME/.vim/; cp -r $HOME/.vim/plugged/vimproc.vim/lib $HOME/.vim/' }
        Plug 'idanarye/vim-vebugger', { 'do': 'cp -r $HOME/.vim/plugged/vim-vebugger/autoload $HOME/.vim/' }
    "" tagbar --- use with exuberant-ctags ( 'on':  'TagbarToggle', )
        Plug 'majutsushi/tagbar', { 'do': 'go get -u github.com/jstemmer/gotags' }
    "" c/c++
        Plug 'vim-scripts/c.vim'
    "" golang
        Plug 'fatih/vim-go'
        Plug 'nsf/gocode', { 'do': 'go get -u github.com/nsf/gocode; cp $HOME/.vim/plugged/gocode/vim/autoload/gocomplete.vim $HOME/.vim/autoload/' }
    "" python
        "Plug 'klen/python-mode'
    "" latex
        Plug 'gerw/vim-latex-suite'
    "" pandoc and markdown
        Plug 'vim-pandoc/vim-pandoc'
        Plug 'vim-pandoc/vim-pandoc-syntax'
    "" Vim's Org-Mode
        Plug 'jceb/vim-orgmode'
    "" input chinese
        "Plug 'vim-scripts/fcitx.vim'
call plug#end()

" SuperTab
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

" UltiSnips
let g:UltiSnipsExpandTrigger           = '<Tab>'
let g:UltiSnipsJumpForwardTrigger      = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<S-Tab>'

" ycm
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Ctrl-P
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" sessions
let g:session_directory = $HOME . '/.vim/sessions'
"" autosave/autoload? works or not?
let g:session_autosave = 'yes' "works
"let g:session_autoload = 'yes' "not work with vim-startify

" easy motion
nmap <leader>m <Plug>(easymotion-s)
" nmap <....>. <Plug>(easymotion-t)

" vim-debugger
let g:vebugger_leader='<C-c>'
"let g:vebugger_view_source_cmd='edit'

" syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" EasyAlign (e.g. vipga, gaip)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" vim-go
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Tagbar configuration for gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : '$HOME/go/bin/gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" pymode
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

"set fold
set foldmethod=indent " syntax, indent, marker, manual, expr ...
set foldlevel=10

" set line break
set linebreak
set textwidth=0
set wrapmargin=0

" Turn on the WiLd menu
set wildmenu

" command-line completion
set wildmode=longest:full,full

" to recognize a list header
set formatlistpat=^\\s*\\(\\d\\\|[-*]\\)\\+[\\]:.)}\\t\ ]\\s*
set formatoptions+=n

"show the tabes
set list
set listchars=tab:\|\ ,trail:·,extends:#,nbsp:.

"do not break words joined by the following characters
set iskeyword+=_,@

" make >> and << work better
set shiftround

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab
set stal=2

" wrap or not
set wrap
set whichwrap+=<,>,[,],h,l,b,s,~

" A buffer becomes hidden when it is abandoned
set hid

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

"use dialog when file was not saved
set confirm

"inline replace
set gdefault

"set auto-complete
set completeopt=longest,menu

"share clipboard
set clipboard+=unnamedplus

" Use spaces instead of tabs
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Show matching brackets, and how many tenths of a second to show
set showmatch
set mat=10

" set delay
set timeoutlen=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Screen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=3

" Increase the space between lines
set linespace=6

"show the command typing
set showcmd

" Try to keep the cursor line in the vertically center (27 lines)
set scrolloff=3

"Always show current position
set ruler

"show line number
set number

" hightlight current line/col
set cursorline
set cursorcolumn

" Enable syntax highlighting
syntax enable

" Height of the command bar
set cmdheight=2

" colorscheme and background
let $VIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme pencil
set background=light "dark "
set t_ut=

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" colors
set colorcolumn=+1
hi ColorColumn NONE ctermbg=Cyan

"set font
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
set guifont=DejaVu\ Sans\ Mono\ 12

" add more components to statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" display the status line always
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set dir to the current file's directory.
set autochdir

" Open dialog defaults to the current file's directory.
set browsedir=buffer

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Turn backup on. Need to build these folders manually.
set backup
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/tmp

" Set utf8 as standard encoding, and en_US as the standard language
set encoding=utf8
set termencoding=utf8

"Chinese vim menus (windows)
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"Chinese vim messages (windows)
language messages zh_CN.utf-8

" encodeing just opened file.
set fileencodings=utf8,gbk,ucs-bom,cp936,gb2312,gb18030,big5,euc-jp,euc-kr

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ exec ":call UpdateCopyright()" |
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal! g`\"" |
    \ exe "normal! zz" |
    \ endif

" Automatically update copyright notice with current year
autocmd BufWritePre *
    \ exec ":call UpdateCopyright()" |
    \ exec ":call DeleteTrailingWS()" |
    \ let &backupext = '.-' . strftime("%Y%m%d-%H%M%S")

" enable omni-completion
set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType perl set omnifunc=perlcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType node set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType cpp set omnifunc=cppcomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType d set omnifunc=ccomplete#Complete
autocmd Filetype octave set omnifunc=syntaxcomplete#Complete
autocmd FileType go set omnifunc=gocomplete#Complete

" commenting blocks of code.
autocmd FileType *                     let b:comment_leader = '// '
autocmd FileType c,d,cpp,java,scala,go let b:comment_leader = '// '
autocmd FileType sh,ruby,python,text   let b:comment_leader = '#  '
autocmd FileType conf,fstab,perl       let b:comment_leader = '#  '
autocmd FileType tex,octave            let b:comment_leader = '%  '
autocmd FileType mail                  let b:comment_leader = '>  '
autocmd FileType vim                   let b:comment_leader = '"  '
autocmd FileType lisp                  let b:comment_leader = ';; '
autocmd FileType haskell,vhdl,ada      let b:comment_leader = '-- '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gk
nnoremap k gj
nnoremap <Down> gj
nnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Map \ to replace
noremap \ :1,$s/%/ic

" Disable highlight when <leader>/ is pressed.
noremap <silent> <leader>/ :noh<CR>

" Del the tailing ^M (to work with MSDOS files)
noremap <Leader>; mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

" Opens a new tab with the current buffer's path
noremap <leader><CR> :tabedit <c-r>=expand("%:p:h")<CR>/

" :W sudo saves the file
command! W w !sudo tee % > /dev/null

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nnoremap <M-k> mz:m+<CR>`z
nnoremap <M-j> mz:m-2<CR>`z
vnoremap <M-k> :m'>+<CR>`<my`>mzgv`yo`z
vnoremap <M-j> :m'<-2<CR>`>my`<mzgv`yo`z

" Delete trailing white spaces
noremap <leader><BS> :%s/\s\+$//ge<CR>

" F1-F4 resources
noremap <F1> :Denite file_rec<CR>
noremap <F2> :Denite buffer<CR>
noremap <F3> :Denite line<CR>
noremap <F4> :Denite change<CR>

" F5: run according to filetypes
au FileType go nmap <F5> :terminal<CR><Plug>(go-run)
au FileType python let g:pymode_run_bind = "<F5>"

" F6: toggle and untoggle spell checking
noremap <F6> :setlocal spell!<CR>

" F7: build something
au FileType go nmap <F7> <Plug>(go-build)
au FileType tex nmap <F7> :!xelatex %<CR>
au FileType markdown nmap <F7> :!pandoc -f markdown+lhs % -o markdown.html -t dzslides -i -s -S --toc<CR>

" F8: open vim file explorer
noremap <F8> :NERDTreeToggle<CR>

" F9: start the debugger
noremap <F9> :VBGstartGDB

" F10: tags
noremap <F10> :TagbarToggle<CR>

" F11: be focus
noremap <F11> 2o<ESC>k:call AddPartingLine()<CR>j

" F12 attach copyright things
noremap <F12> :call AddCopyright()<CR>:call ProcessEnv()<CR>

" backspace in Visual mode deletes selection
vnoremap <BS> d
inoremap <C-BS> <C-W>
inoremap <C-Del> <C-O>dw

" Use CTRL-S for saving, also in Insert mode
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" CTRL-F4 is Close window
noremap  <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" Smart way to move between windows (<ctrl>j etc.)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" emacsish keybindings
noremap  <C-G> <Esc>
vnoremap <C-G> <Esc>
snoremap <C-G> <Esc>
inoremap <C-G> <Esc>
cnoremap <C-G> <Esc>

" run a command
noremap  <C-Z> :
vnoremap <C-Z> :
snoremap <C-Z> :
inoremap <C-Z> <C-O>:

"Change Y to yank to end of line
map Y y$

" paste over without overwriting register
xnoremap p pgvy
xnoremap P Pgvy

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" To avoid the extra 'shift' keypress when typing the colon to go to cmdline mode
noremap ; :
noremap ;; ;

" Quickly insert parenthesis/brackets/etc.
inoremap <space>( ()<esc>i
inoremap <space>[ []<esc>i
inoremap <space>{ {}<esc>i
inoremap <space>' ''<esc>i
inoremap <space>" ""<esc>i
inoremap <space>` ``<esc>i
inoremap <space>$ $$<esc>i
inoremap <space>\| \|\|<esc>i

" Surround the visual selection in parenthesis/brackets/etc.
vnoremap <space>( <esc>`>a)<esc>`<i(<esc>
vnoremap <space>[ <esc>`>a]<esc>`<i[<esc>
vnoremap <space>{ <esc>`>a}<esc>`<i{<esc>
vnoremap <space>" <esc>`>a"<esc>`<i"<esc>
vnoremap <space>' <esc>`>a'<esc>`<i'<esc>
vnoremap <space>` <esc>`>a`<esc>`<i`<esc>
vnoremap <space>$ <esc>`>a$<esc>`<i$<esc>
vnoremap <space>\| <esc>`>a\|<esc>`<i\|<esc>

" brackets
inoremap <expr> <silent> ( MayCloseParentheses('(')
inoremap <expr> <silent> [ MayCloseParentheses('[')
inoremap <expr> <silent> { MayCloseParentheses('{')

" Insert the current date and time (useful for timestamps)
iab xdate <c-r>=strftime("%Y/%m/%d %H:%M:%S")<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! HasPaste()
    if &paste
        return 'MP'
    else
        return 'NP'
    endif
endfunction

function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")
    if buflisted(l:alternateBufNum)
      buffer #
    else
      bnext
    endif
    if bufnr("%") == l:currentBufNum
      new
    endif
    if buflisted(l:currentBufNum)
      execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction

function! MayCloseParentheses(cmd)
    if col('.') == col('$')
        if a:cmd == '('
            return "()\<Left>"
        elseif a:cmd == '{'
            return "{}\<Left>"
        elseif a:cmd == '['
            return "[]\<Left>"
        endif
    else
        if a:cmd == '('
            return "("
        elseif a:cmd == '['
            return "["
        elseif a:cmd == '{'
            return "{"
        endif
    endif
endfunction

function! HasLinewidth()
    if &tw<1000
        return &tw
    else
        return 'K+'
    endif
endfunction

function! AddPartingLine()
    call append(line('.'), b:comment_leader . "· <=>---<=> · <=>---<=> · <=>---<=> · <=>---<=> · <=>---<=> · <=>---<=>")
endfunction

function! AddCopyright()
    call append(0, b:comment_leader . "==============================================")
    call append(1, b:comment_leader . "·")
    call append(2, b:comment_leader . "· Author: Benjamin Wang")
    call append(3, b:comment_leader . "·")
    call append(4, b:comment_leader . "· Benjamin.mj.wang@gmail.com")
    call append(5, b:comment_leader . "·")
    call append(6, b:comment_leader . "· Filename: ".expand("%:t"))
    call append(7, b:comment_leader . "·")
    call append(8, b:comment_leader . "· COPYRIGHT ".strftime("%Y"))
    call append(9, b:comment_leader . "·")
    call append(10, b:comment_leader . "· Description:")
    call append(11, b:comment_leader . "·")
    call append(12, b:comment_leader . "==============================================")
    call append(13, "")
    echohl WarningMsg | echo "copyright information added." | echohl None
endfunction

function! UpdateCopyright()
    let n=1
    while n < 20
        let line = getline(n)
        if line =~ '\s*\S*COPYRIGHT\S*.*$'
            if line !~ strftime("%Y")
                exe "g#\\cCOPYRIGHT \\(".strftime("%Y")."\\)\\@![0-9]\\{4\\}\\(-".strftime("%Y")."\\)\\@!#s#\\([0-9]\\{4\\}\\)\\(-[0-9]\\{4\\}\\)\\?#\\1-".strftime("%Y")
            endif
            echohl WarningMsg | echo "copyright information updated." | echohl None
            return
        endif
        let n = n + 1
    endwhile
    echohl WarningMsg | echo "no copyright information found." | echohl None
endfunction

function! ProcessEnv()
    let n=1
    while n < 3
        let line = getline(n)
        if line =~ '\s*\S*env\S*.*$'
            echohl WarningMsg | echo "env information exists." | echohl None
            return
        endif
        let n = n + 1
    endwhile
    if &filetype == 'tex'
        call append(0, b:comment_leader . "!/usr/bin/env pdflatex")
    elseif &filetype == 'sh'
        call append(0, b:comment_leader . "!/usr/bin/env fish")
    elseif &filetype == 'python' || &filetype == 'py'
        call append(0, b:comment_leader . "!/usr/bin/env python")
    elseif &filetype == 'octave' || &filetype == 'm'
        call append(0, "#  !/usr/bin/env octave")
    else
        call append(0, b:comment_leader . "!/usr/bin/env " . &filetype)
    endif
    call append(1, b:comment_leader . "-*- coding:utf-8 -*-")
    call append(2, "")
    echohl WarningMsg | echo "env information added(gg check it)!" | echohl None
endfunction

augroup LargeFile
        " Set options:
        "   eventignore+=FileType (no syntax highlighting etc
        "   assumes FileType always on)
        "   noswapfile (save copy of file)
        "   bufhidden=unload (save memory when other file is viewed)
        "   buftype=nowritefile (is read-only)
        "   undolevels=-1 (no undo possible)
        let g:large_file = 1048576 " 1MB

        au BufReadPre *
                \ let f=expand("<afile>") |
                \ if getfsize(f) > g:large_file |
                        \ set eventignore+=FileType |
                        \ setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 |
                \ else |
                        \ set eventignore-=FileType |
                \ endif
augroup END
