" vimrc by Hanif Ladha.
" Borrowed from numerous sources, incuding:
" https://bitbucket.org/sjl/dotfiles
" https://github.com/amix/vimrc
" Required:
" Using vim-plug to manage the plugins: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/bundle')
 
" Bundle Section {{{
" Required:
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'klen/python-mode'
Plug 'sjl/gundo.vim'
Plug 'mbbill/undotree'
Plug 'valloric/youcompleteme'
Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'plasticboy/vim-markdown'
Plug 'kien/ctrlp.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'bling/vim-bufferline'
Plug 'majutsushi/tagbar'
Plug 'tomasr/molokai'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rking/ag.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
" }}}
" GUI specific settings {{{
if has('gui_running')
    " Hack font setup {{{
    if has("mac") || has("macunix")
        set gfn=Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
    elseif has("win16") || has("win32")
        set gfn=Hack:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
    elseif has("gui_gtk2")
        set gfn=Hack\ 12,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
    elseif has("linux")
        set gfn=Hack\ 12,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
    elseif has("unix")
        set gfn=Monospace\ 11
    endif
    " }}}
endif
" }}}
" {{{ Basic Settings
" Required:
filetype plugin indent on
" check just the final line of the file for a modeline
set modelines=1
" don't make vim compatible with vi
set nocompatible
" show relative line numbers with current absolute
set relativenumber
set number
" Sets how many lines of history VIM has to remember
set history=512
" Set to auto read when a file is changed from the outside
set autoread
" Disable arrow keys - force better habits!
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
" Moving around, tabs, windows and buffers {{{
" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
" Suppress accidently invoking help when trying to hit Esc
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :
" }}}
" Leader Shortcuts {{{
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>

" Gundo {{{
if has('python3')
    let g:gundo_prefer_python3=1
endif
nnoremap <leader>u :GundoToggle<CR>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif
" }}}
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
let g:ag_highlight=1
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" }}}
" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
nnoremap <space> za
set foldmethod=indent
" }}}
" Colors {{{
syntax enable
set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
colorscheme badwolf
" Make the gutters darker than the background.
let g:badwolf_darkgutter = 3
" Make the tab line darker than the background.
" let g:badwolf_tabline = 0
"
" " Make the tab line the same color as the background.
" let g:badwolf_tabline = 1
"
" " Make the tab line lighter than the background.
" let g:badwolf_tabline = 2
"
" " Make the tab line much lighter than the background.
let g:badwolf_tabline = 3
"
" Turn off HTML link underlining
let g:badwolf_html_link_underline = 0
"
" highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
let g:molokai_original = 1
" }}}
" Spaces, Tabs and Lines {{{
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set formatoptions=qrnl

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.
set list 
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
augroup trailing
    au!
    au InsertEnter * :set listchars-=trail:⌴
    au InsertLeave * :set listchars+=trail:⌴
augroup END
" }}}

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
" }}}
" {{{ Visual Selection
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
inoremap # X#
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
" }}}
" {{{ VIM user interface
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu

" Files to ignore
set wildignore=*.o,*~,*.pyc
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Redraw only when we need to 
set lazyredraw

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase
" }}}
" {{{ Searching
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch 
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <expr> K (&filetype is# 'vim' ? (':help ' . fnameescape(expand('<cword>')) . "\n") : 'K')
"nnoremap K :help <C-r><C-w><CR>
" Use sane regexes.
" nnoremap / /\v
" vnoremap / /\v
" }}}
" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" highlight last inserted text
nnoremap <leader>v V']

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,split,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
"
"Window splits
"Vertical Split : Ctrl+w + v
"Horizontal Split: Ctrl+w + s
"Close current windows: Ctrl+w + q
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set splitbelow
set splitright

" Resize windows
map <leader>= :resize +2<CR>
map <leader>- :resize -2<CR>
map <leader>> :vertical resize +2<CR>
map <leader>< :vertical resize -2<CR>

" }}}
" {{{ Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview
set diffopt+=vertical

" }}}
" CtrlP {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }
" let g:ctrlp_user_command = 'find %s -type f' 
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' 
" }}}
" {{{ Silver Searcher
" open Ag
nnoremap <leader>a :Ag!<CR>
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ctrlp_use_cache = 0
endif
" }}}
" NERDTree settings {{{
" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
" }}}
" GitGutter settings {{{
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = 'x'
let g:gitgutter_sign_removed_first_line = 'x_'
let g:gitgutter_sign_modified_removed = '~_'
" }}}
" Limelight and Goyo settings {{{
nmap <leader>l :Limelight!! 0.75<CR>
" Number of preceding/following paragraphs to include (default: 0)
map <leader>z :Goyo<CR>
let g:limelight_paragraph_span = 1
" Highlighting priority (default: 10)
" "   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
" }}}
" Fugitive settings {{{
" Copied from this stackflow post:
" http://stackoverflow.com/questions/15369499/how-can-i-view-git-diff-for-any-commit-using-vim-fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gt :Gcommit -v -q %<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>ge :Gedit<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gw :Gwrite<CR><CR>
nnoremap <leader>gl :silent! Glog<CR>
nnoremap <leader>gp :Ggrep<Space>
nnoremap <leader>gm :Gmove<Space>
nnoremap <leader>gb :Git branch<Space>
nnoremap <leader>go :Git checkout<Space>
nnoremap <leader>gps :Dispatch! git push<CR>
nnoremap <leader>gpl :Dispatch! git pull<CR>
" }}}

"""""""""""""""""""""""""""""""
" => Function key mappings
"""""""""""""""""""""""""""""""
"Buffer manipulation
nnoremap <F3> :BuffergatorToggle<CR>
" Toggline the tag bar (tagbar plugin)
nmap <F8> :TagbarToggle<CR>

"  vim-airline {{{
set laststatus=2
set t_Co=256
set encoding=utf-8
let g:airline#extensions#tabline#enabled = 1
" configure whether buffer numbers should be shown. >
let g:airline#extensions#tabline#buffer_nr_show = 1
" configure how buffer numbers should be formatted with |printf|. >
let g:airline#extensions#tabline#buffer_nr_format = '%s: '
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
"Since we are enabling bufferline in vim-airline, we disable the original
"plugin line
let g:bufferline_echo = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" }}}
" Ultisnips {{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsUsePythonVersion = 3
" }}}
"  Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*gbar
let g:syntastic_c_checkers=['make']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
" }}}
"  YouCompleteMe {{{
let g:clang_complete_copen = 0
let g:clang_hl_errors = 1
let g:clang_snippets = 1
let g:clang_snippets_engine = "ultisnips"
let g:clang_close_preview = 1
let g:clang_complete_macros = 1
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" }}}
" Cursor Line setting {{{
"i CursorLine   cterm=bold ctermbg=lightblue ctermfg=white guibg=darkred guifg=white
" hi CursorLine cterm=none ctermfg=darkblue ctermbg=lightgray guifg=#ffffff guibg=#000000
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
hi Search cterm=none ctermbg=Red ctermfg=White guibg=peru guifg=wheat
augroup CursorLine
    au!
    au WinLeave,InsertEnter * set nocursorcolumn nocursorline
    au WinEnter,InsertLeave * set cursorcolumn cursorline
augroup END
" }}}
" Python mode configuration {{{
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_bind = 'M'
"
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pylint']
let g:pymode_lint_ignore="E203,E231,E501,W601,E221,C901"
" PEP8 will now complain only if line length exceeds 120
let g:pymode_options_max_line_length = 120
" Disable auto check on save - let syntastic take care of it
let g:pymode_lint_on_write = 0

" Enable breakpoints plugin
let g:pymode_breakpoint = 0
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
" Signs
let g:pymode_lint_signs = 1
let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = g:syntastic_warning_symbol
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = g:syntastic_error_symbol
let g:pymode_lint_info_symbol = 'II'
" let g:pymode_lint_pyflakes_symbol = 'FF'


" Code completion
" Turn on code completion support in the plugin
let g:pymode_rope_completion = 1
" Turn on autocompletion when typing a period
let g:pymode_rope_complete_on_dot = 0
" Keymap for autocomplete
let g:pymode_rope_completion_bind = '<C-Space>'
" }}}
" Augroups {{{
" Change numberign style when focus changes - may not always work in terminal mode
au FocusLost * :set number
au FocusGained * :set relativenumber
augroup vimrc_autocmds
    autocmd!
"    highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=Blue guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    autocmd FileType python set cc=0
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md :call <SID>StripTrailingWhitespaces()
augroup END

" }}}
" Custom Functions {{{
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
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

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
" toggle between number and relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
        set number
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
    elseif a:mode == 'r'
        hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
    else
        hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
    endif
endfunction

" }}}
"
" vim:foldmethod=marker:foldlevel=0
