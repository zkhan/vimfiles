" General
set nocompatible

" Editing
set aw ai
set et ts=8 sts=2 sw=2 nu
set fo+=tcrqw fo-=o
set showmatch matchtime=5
set whichwrap=<,>,h,l,[,]
set cursorline
set nofoldenable
"let maplocalleader = ","
let mapleader = ","

" Style
highlight CursorLine cterm=bold
highlight MatchParen cterm=none ctermbg=none ctermfg=yellow

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/VimClojure'
"Bundle 'vim-scripts/AutoClose'
Bundle 'vim-scripts/sessionman.vim'
Bundle 'vim-scripts/taglist.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'kchmck/vim-coffee-script'
Bundle 'edsono/vim-matchit'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rails.vim'
Bundle 'markabe/bufexplorer'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'cespare/zenburn'

" Filetypes
filetype off " forces reload
filetype plugin indent on
syntax on
colorscheme solarized
set background="dark"
:so ~/vimfiles/vim/bundle/vim-colors-solarized/autoload/togglebg.vim

" Searching
set incsearch hlsearch
set ignorecase smartcase
set tags=tags,./tags
nmap <silent> <C-c> <Esc>:!ctags -R<CR><CR>
nmap <silent> ,h <Esc>:set invhls<CR>:set hls?<CR>


" Saving
map <c-s> :w<cr>
imap <c-s> <c-o><c-s>
imap <c-s> <esc><c-s>


" Buffers - explore/next/previous: Alt-Tab, Ctrl-Tab, Ctrl-Alt-Tab.
nnoremap <silent> <A-Tab> :BufExplorer<CR>
nnoremap <silent> <C-Tab> :bnext<CR>
nnoremap <silent> <C-A-Tab> :bprevious<CR>


" Completions
set wildmenu wildmode=full completeopt+=longest
set wildignore+=node_modules,classes,target,Maildir,tmp
set wildignore+=*.pyc,*.o,*.a,*.class,*.jar,*.zip,*.tgz,*.tar.gz,*.tbz2,*~
set wildignore+=.git,.hg,.svn,.bzr,CVS
let g:CommandTAcceptSelectionSplitMap='<C-w>'

" Store .swp files in /var/tmp with mangled names
set directory=/var/tmp//

" Windows
nmap <C-N> <C-W>w
nmap <C-P> <C-W>W
nmap ,n <C-W>w
nmap ,p <C-W>W
nmap ,H <C-W>H
nmap ,J <C-W>J
nmap ,K <C-W>K
nmap ,L <C-W>L
nmap ,= <C-W>=
nmap ,T <C-W>T
nmap ,r <C-W>r
nmap ,R <C-W>R
set hidden
set equalalways
set splitbelow splitright
set mouse=a

" Taglist
let Tlist_Use_Horiz_Window = 1
let Tlist_Show_One_File = 1
let Tlist_win_height = 350
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nmap <Leader>l :TlistToggle<CR>

" NERD-Tree
nmap <Leader>f :NERDTreeToggle<CR>

" Sessions
set viminfo=!,'100,<50,s10,h
let sessionman_save_on_exit = 1

" Let %% expands to directory of %
cabbr <expr> %% expand('%:h')

" General programming
autocmd BufRead,BufNewFile *.ejs   set filetype=html
autocmd BufRead,BufNewFile *.ru    set filetype=ruby
autocmd BufNewFile,BufRead *.inc   set filetype=sh
autocmd BufNewFile,BufRead *.md    set filetype=markdown
autocmd FileType java,javascript   set ts=8 sts=4 sw=4 et nu
autocmd FileType markdown,vimwiki  set fo+=a2 tw=78

" Coffee-Script
"let coffee_compile_on_save = 1

" Clojure
autocmd FileType clojure nmap ,s <Plug>ClojureEvalToplevel
autocmd FileType clojure nmap ,f <Plug>ClojureEvalFile
autocmd FileType clojure nmap ,b <Plug>ClojureEvalBlock
autocmd FileType clojure nmap ,d <Plug>ClojureDocLookupWord
autocmd FileType clojure nmap ,i <Plug>ClojureDocLookupInteractive
autocmd FileType clojure nmap ,j <Plug>ClojureJavadocLookupWord
autocmd FileType clojure nmap ,r <Plug>ClojureStartRepl

let vimclojure#WantNailgun = 1
let vimclojure#HighlightBuiltins = 1

" Shell scripts
let g:is_bash=1
"let g:sh_fold_enabled=7
