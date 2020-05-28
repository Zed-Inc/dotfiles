

call plug#begin('~/.vim/plugged')
Plug 'yorickpeterse/happy_hacking.vim'
Plug 'mhartington/oceanic-next'
Plug 'manu-sh/neonvimcolorscheme'
Plug 'alessandroyorba/despacio'
call plug#end()



execute pathogen#infect()
syntax on
set autoindent
set smartindent
set ts=4 sw=4 et si
set whichwrap +=<,>,[,]
set backspace=indent,eol,start
set hlsearch
set number
set mouse=a
set mousemodel=popup_setpos
inoremap {<CR> {<CR>}<C-o>O
inoremap [<CR> [<CR]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

if has("gui_running")
    syntax on
    set hlsearch
endif

" This is for the miramare theme
set termguicolors
"let g:miramare_enable_italic = 1
"let g:miramare_disable_italic_comment = 1
"---------------------------------------

" These settings are for the despacio theme 
"let g:despacio_Sunset = 1 " dark grey background
let g:despacio_Twilight = 1 "dark dark gray background
"let g:despacio_Midnight = 1 "Almost black background 
"let g:despacio_Pitch = 1 " black background
"-----------------------------



"set foldmethod=syntax
"colorscheme wolfpack
"colorscheme taffy
"colorscheme space-macs-dark
"colorscheme xcodedarkhc
"colorscheme miramare
"colorscheme OceanicNext
"colorscheme spacegray
"colorscheme neuromancer
"colorscheme neon
colorscheme despacio

set ru
nmap <silent> ,, :let@/=""<CR>
" let &colorcolumn=join(range(81,81),",")

"autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"autocmd VimEnter * if argc() == 0 | exe 'NERDTree' | endif
autocmd vimenter * ClangFormatAutoEnable
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" clear the current search 
nnoremap ,<space> :nohlsearch<CR>

" simplify getting to the end of the line with this key map 
"nnoremap e<CR> <S>$<CR>
" file explorer quick shortcut 
nnoremap f<CR> :Explore<CR>
" quick terminal access from vim if needed
nnoremap t<CR> :terminal<CR>

" turn numbers on
nnoremap zenoff :set nu<CR>
"turn numbers off
nnoremap zen :set nonu<CR>

" copy one line short cut 
nnoremap c<CR> yy<CR>

let mapleader = ","
let maplocalleader = ","

nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bf :bfirst<CR>
nmap <leader>bd :bdelete<CR>

"set guifont="SF Mono"
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    "au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    "au WinLeave * setlocal nocursorcolumn
    au WinLeave * setlocal nocursorline
augroup END


fun! JumpToDef()
    if exists("*GotoDefinition_" . &filetype)
        call GotoDefinition_{&filetype}()
    else 
        exe "norm! \<C-]>"
    endif
endif

"Jump to tag 
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>
:endfunction
