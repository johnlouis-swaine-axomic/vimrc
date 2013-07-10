" vim: fdm=marker
 
" GENERAL SETTINGS                                                             {{{
" --------------------------------------------------------------------------------
set nocompatible                " Disable Vi compatibility
 
syntax on                       " Enable syntax highlighting
filetype plugin indent on       " Enable file type detection
filetype plugin on
set ofu=syntaxcomplete#Complete 
set encoding=utf-8              " Use UTF-8 as default file encoding
set laststatus=2                " Always show status line
set modeline                    " Look for modeline
set autoread                    " Reload unchanged buffer when file changes
set history=500                 " Keep 500 lines of history
set hidden                      " Allow unedited buffers to be hidden
set cc=80
set vb
set foldmethod=syntax
"" Command line
set wildmenu                    " Command line completion
set showcmd                     " Show (partial) command in status line
 
"" Whitespace
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set tabstop=4                   " Tabs count for 4 spaces
set shiftwidth=4                " Each indent step is 4 spaces
 
"" Searching
set hlsearch                    " Highlight search matches
set incsearch                   " Do incremental searching
set ignorecase                  " Searches are case-insensitive...
set smartcase                   " ...unless they contain at least one capital letter
let mapleader = ","
noremap k j
noremap j h
noremap i k
noremap a i
noremap s a
noremap h s
noremap q b
nmap <silent> <c-i> :wincmd k<CR>                                                                                                                       
nmap <silent> <c-k> :wincmd j<CR>                                                                                                                       
nmap <silent> <c-j> :wincmd h<CR>                                                                                                                       
nmap <silent> <c-l> :wincmd l<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap f za
nnoremap F zR
if has('mouse')
	set mouse=a
endif
set guioptions-=r
set guioptions-=L
set guioptions-=m  "remove menu bar
 " automatically leave insert mode after 'updatetime' milliseconds of inaction
au CursorHoldI * stopinsert

" set 'updatetime' to 10 seconds when in insert mode
au InsertEnter * let updaterestore=&updatetime | set updatetime=10000
au InsertLeave * let &updatetime=updaterestore

" Movement between tabs OR buffers
nnoremap <C-]> :call MyNext()<CR>
nnoremap <C-[> :call MyPrev()<CR>

" MyNext() and MyPrev(): Movement between tabs OR buffers
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction

for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor
set number
set nocompatible               " be iMproved
 filetype off                   " required!

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
if has('mouse')
	set mouse=a
endif
if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif







" ALL PLUGIN-DEPENDENT OPTIONS BELOW ==================

