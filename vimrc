" General
set nocompatible
let g:ruby_path = system('rvm current')
" Editing
set aw ai
set et ts=8 sts=2 sw=2 nu
set fo+=tcrqw fo-=o
set showmatch matchtime=5
set whichwrap=<,>,h,l,[,]
set cursorline
set nofoldenable
set nowrap!
"let maplocalleader = ","
let mapleader = ","

" Style
highlight CursorLine cterm=bold
highlight MatchParen cterm=none ctermbg=none ctermfg=yellow
" Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/AutoClose'
Plugin 'vim-scripts/sessionman.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/colorizer'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kchmck/vim-coffee-script'
Plugin 'edsono/vim-matchit'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-rails.git'
Plugin 'markabe/bufexplorer'
Plugin 'cespare/zenburn'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'eddsteel/vim-vimbrant'
Plugin 'ack.vim'
Plugin 'tpope/vim-endwise'
Plugin 'snipMate'
Plugin 'unimpaired.vim'
Plugin 'nono/vim-handlebars'
Plugin 'roman/golden-ratio'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'slim-template/vim-slim'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'tpope/vim-fireplace'

" Rainbow parentheses
Plugin 'kien/rainbow_parentheses.vim'

call vundle#end()            " required
filetype plugin indent on    " required
"  Parentheses colours using Solarized
let g:rbpt_colorpairs = [
  \ [ '13', '#6c71c4'],
  \ [ '5',  '#d33682'],
  \ [ '1',  '#dc322f'],
  \ [ '9',  '#cb4b16'],
  \ [ '3',  '#b58900'],
  \ [ '2',  '#859900'],
  \ [ '6',  '#2aa198'],
  \ [ '4',  '#268bd2'],
  \ ]
 
" Enable rainbow parentheses for all buffers
augroup rainbow_parentheses
  au!
  au VimEnter * RainbowParenthesesActivate
  au BufEnter * RainbowParenthesesLoadRound
  au BufEnter * RainbowParenthesesLoadSquare
  au BufEnter * RainbowParenthesesLoadBraces
augroup END

" Status ine stuff
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'unicode'
set t_Co=256
let g:syntastic_mode_map = { 'mode': 'active',
                         \ 'active_filetypes': [ 'javascript' ],
                         \ 'passive_filetypes': [] }
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set statusline+=%{SyntasticStatuslineFlag()}   " Show syntastic error status

let g:ctrlp_switch_buffer=1
"let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p353/bin/ruby'
" Filetypes
filetype off " forces reload
filetype plugin indent on
syntax on
set guifont=Inconsolata\ Medium\ 12
set background="dark"
:so ~/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim

" Searching
set incsearch hlsearch
set ignorecase smartcase
set tags=tags,./tags
nmap <silent> <C-c> <Esc>:!ctags -R<CR><CR>
nmap <silent> ,h <Esc>:set invhls<CR>:set hls?<CR>
nnoremap <esc> :noh<return><esc>


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
nmap <C-M> <C-W>W
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
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
set guioptions-=r
set guioptions-=L
"set mouse=a
"autocmd VimEnter * set ttymouse=xterm2
"autocmd FocusGained * set ttymouse=xterm2
"autocmd BufEnter * set ttymouse=xterm2

" Taglist
let Tlist_Use_Horiz_Window = 1
let Tlist_Show_One_File = 1
let Tlist_win_height = 350
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
nmap <Leader>l :TlistToggle<CR>

" NERD-Tree
nmap <Leader>f :NERDTreeToggle<CR>
nmap <Leader>m :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1

" Sessions
set viminfo=!,'100,<50,s10,h
let sessionman_save_on_exit = 1
" when opening a new tab, disable insert mode
autocmd WinEnter * stopinsert

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
if has('gui_running')
  colorscheme solarized
else
  colorscheme vimbrant
endif


" Use nicer whitespace characters and show whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related from: http://amix.dk/vim/vimrc.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set listchars=tab:>-,trail:-
set list

