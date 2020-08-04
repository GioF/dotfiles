set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
   
  " Basics
  Plugin 'mhinz/vim-startify'

  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'majutsushi/tagbar'

  Plugin 'vim-airline/vim-airline'
  " Plugin 'enricobacis/vim-airline-clock'
  
  " Plugin 'tpope/vim-surround'

  " Plugin 'scrooloose/syntastic'
  Plugin 'airblade/vim-gitgutter'

  " Colorschemes
  " Plugin 'chriskempson/base16-vim'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'kristijanhusak/vim-hybrid-material'
  " Plugin 'morhetz/gruvbox'

  " Coding
  Plugin 'neoclide/coc.nvim'    " code completion
  Plugin 'lervag/vimtex'        " LaTeX
  Plugin 'honza/vim-snippets'   " snippets
  Plugin 'ryanoasis/vim-devicons' " pretty icons

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required

  "####################
  " Table of Contents #
  "####################
  " 1. General
  " 2. Hotkeys
  " 3. Text, tab, indent
  " 4. Moving around
  " 5. Colors and Fonts
  " 6. Plugins
  " 6.1 Syntastic
  " 6.2 Airline
  " 6.3 Nerdtree
  " 6.4 Nerdcommenter
  " 6.5 Vimtex
  " 6.6 Tagbar
  " 6.7 Snippets
  " 6.8 Polyglot
  " 6.9 Skeletons
  " 6.10 CtrlP
  " 7. Coding
  " 7.1 I3WM


  "#####################
  "     1. General     #
  "#####################
  syntax on

  set autoread " Auto read files when changed outside
  set mouse =a
  set splitright " Put new buffer on the right of current buffer
  set splitbelow " Put new buffer below the current buffe
  set smartcase " When searching try to be smart about cases
  set ignorecase " When searching
  set number
  set nobackup
  set nowb
  set noswapfile
  set updatetime=100

  let g:tex_flavor = "latex" " Auto detect latex filetype


  "#####################
  "     2. Hotkeys     #
  "#####################
  map <F7> gg=G<C-o><C-o>       " Reindent

  map <leader>T :%s/\s\+$//<CR> " <leader>T = Delete all trailing space in file

  map <leader>R :retab<CR>      " <leader>R = Converts tabs to spaces in file

  " Edit and reload .vimrc file
  nmap <silent> <leader>ev :e  $MYVIMRC<CR>
  nmap <silent> <leader>es :so $MYVIMRC<CR>

  " Wtf is ex mode anyways
  nnoremap Q <nop>
  " Wtf is esc anyways
  inoremap jk <Esc>

  nnoremap <M-j> :m +1<CR>
  nnoremap <M-k> :m -2<CR>
  vnoremap <M-j> :m '>+1<CR>
  vnoremap <M-k> :m '<-2<CR>

  "close buffer but not window
  map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

  "###############################
  "     3. Text, tab, indent     #
  "###############################
  set tabstop=2
  set shiftwidth=2 " 1 tab == 2 spaces

  set smarttab " Be smart when using tabs
  set expandtab " Convert tabs to spaces

  "set ai " Auto indent
  set si " Smart indent

  set wrap " Wrap lines

  set foldmethod=indent
  set foldlevel=1 " Close every fold by default
  set modelines=1 " Modeline would be '" vim:foldmethod=marker:foldlevel=0' at the end of file

  " Disable automatic comment insertion
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  "autocmd vimenter * NERDTree

  " Disable scrollbars (real hackers don't use scrollbars for navigation!)
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set guioptions-=L


  "###########################
  "     4. Moving around     #
  "###########################
  " Buffer switching left, down, up, right
  nnoremap <c-h> <c-w>h
  nnoremap <c-j> <c-w>j
  nnoremap <c-k> <c-w>k
  nnoremap <c-l> <c-w>l

  " Buffer resizing
  map <leader>k :res +1<cr>
  map <leader>j :res -1<cr>
  map <leader>h :vertical resize +1<cr>
  map <leader>l :vertical resize -1<cr>
  map <leader>= <c-w>= 
  " Useful mappings for managing tabs
  map <leader>tn :tabnew<cr>
  map <leader>to :tabonly<cr>
  map <leader>tc :tabclose<cr>
  map <leader>tm :tabmove
  map <leader>t<leader> :tabnext

  " Tab switchting
  map <c-1> 1gt
  map <c-2> 2gt
  map <c-3> 3gt
  map <c-4> 4gt
  map <c-5> 5gt
  map <c-6> 6gt
  map <c-7> 7gt
  map <c-8> 8gt
  map <c-9> 9gt
  map <c-0> :tablast<CR>


  "##############################
  "     5. Colors and Fonts     #
  "##############################
  set termguicolors
  set background=dark

  colorscheme hybrid_material
  let g:gruvbox_contrast_dark= 'hard'

  let g:airline_theme='hybrid'

  if has("gui_running")   " Set extra options when running in GUI mode.
      set guioptions-=T
      set guioptions-=e
      set t_Co=256
      set guitablabel=%M\ %t
  endif

  set guifont=Inconsolata:h13
  set encoding=utf8

  hi Normal guibg=NONE ctermbg=NONE

  " "#####################
  " "     6. Plugins     #
  " "#####################
  " "~~~~~~~~~~~~~~~~~~~~
  " "   6.1 Syntastic   ~
  " "~~~~~~~~~~~~~~~~~~~~
  " set statusline+=%#warningmsg#
  " set statusline+=%{SyntasticStatuslineFlag()}
  " set statusline+=%*
  "
  " " let g:syntastic_mode_map = { 'mode': 'passive' } "Enable if you want to disable syntastic on file open
  " let g:syntastic_always_populate_loc_list = 1
  " let g:syntastic_auto_loc_list = 1
  " let g:syntastic_check_on_open = 1
  " let g:syntastic_check_on_wq = 0
  "
  " let g:syntastic_quiet_messages = {
  "     \ "level":  "warnings",
  "     \ "regex": [
  "         \ '\m\[C03\d\d\]',
  "         \ '\mpossible unwanted space at "{"'
  "         \]}


  "~~~~~~~~~~~~~~~~~~
  "   6.2 Airline   ~
  "~~~~~~~~~~~~~~~~~~
  set laststatus=2
  let g:airline#extensions#tabline#enabled=1


  let g:airline_powerline_fonts=1

  if !exists('g:airline_symbols')
      let g:airline_symbols = {}
  endif

  " airline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''

  "~~~~~~~~~~~~~~~~~~~
  "   6.3 Nerdtree   ~
  "~~~~~~~~~~~~~~~~~~~
  map <F3> :NERDTreeToggle<CR>
  map <F4> :Hex<CR>

  "let g:NERDTreeNotificationThreshold = 1000

  let NERDTreeShowHidden=1
  let NERDTreeShowBookmarks=1
  let g:NERDTreeFileExtensionHighlightFullName = 1
  let g:NERDTreeExactMatchHighlightFullName = 1
  let g:NERDTreePatternMatchHighlightFullName = 1
  let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
  let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

  let NERDTreeIgnore=[
      \ 'node_modules$[[dir]]',
      \ '.git$[[dir]]',
      \ '.vscode$[[dir]]',
      \ '.idea$[[dir]]',
      \ '.DS_Store$[[file]]',
      \ '.swp$[[file]]',
      \ 'hdevtools.sock$[[file]]',
      \ '.synctex.gz[[file]]',
      \ '.fls[[file]]',
      \ '.fdb_latexmk[[file]]',
      \ '.aux[[file]]'
  \ ]
  
  
  " NERDTress File highlighting
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
   exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
   exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction
  
  
  "~~~~~~~~~~~~~~~~~~~~~~~~
  "   6.4 Nerdcommenter   ~
  "~~~~~~~~~~~~~~~~~~~~~~~~
  let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
  let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
  let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDAltDelims_java = 1 " Set a language to use its alternate delimiters by default
  let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
  let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
  
  "~~~~~~~~~~~~~~~~~
  "   6.5 Vimtex   ~
  "~~~~~~~~~~~~~~~~~
  
  let g:vimtex_compiler_progname = 'nvr'
  
  "~~~~~~~~~~~~~~~~~
  "   6.6 Tabgar   ~
  "~~~~~~~~~~~~~~~~~
  nmap <F8> :TagbarToggle<CR>
  
  "~~~~~~~~~~~~~~~~~
  "  6.7 Snippets  ~
  "~~~~~~~~~~~~~~~~~
  " Use <C-l> to trigger snippet expand.
  imap <C-l> <Plug>(coc-snippets-expand)
  
  " Use <C-j> to select text for visual placeholder of snippet.
  vmap <C-j> <Plug>(coc-snippets-select)
  
  " Use <C-j> to jump to next placeholder, it's default of coc.nvim
  let g:coc_snippet_next = '<c-j>'
  
  " Use <C-k> to jump to previous placeholder, it's default of coc.nvim
  let g:coc_snippet_prev = '<c-k>'
  
  " Use <C-j> to both expand and jump (make expand higher priority.)
  imap <C-j> <Plug>(coc-snippets-expand-jump)
  
  "####################
  "     7. Coding     #
  "####################
  "~~~~~~~~~~~~~~~
  "   7.1 I3WM   ~
  "~~~~~~~~~~~~~~~
  aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
  aug end
  
  "####################
  "     7.coc.nvim    #
  "####################
  let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json', 
  \ 'coc-cmake',
  \ 'coc-clangd',
  \ 'coc-css',
  \ 'coc-vimtex',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ ]
  
  set hidden
  set nobackup
  set nowritebackup
  
  set cmdheight=2
  
  set updatetime=300
  set shortmess+=c
  
  set signcolumn=yes
  highlight SignColumn guibg=NONE
  
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <silent><expr> <S-TAB>
        \ pumvisible() ? "\<C-p>" :
        \ <SID>check_back_space() ? "\<s-tab>" :
        \ coc#refresh()
  
  inoremap <silent><expr> <c-space> coc#refresh()
  
  function! s:check_back_space() abort
    let col = col('.') -1
    return !col || getline('.')[col - 1] =~# '\s'
  endfunction
  
  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  
  " Use `[g` and `]g` to navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  
  " Remap keys for gotos
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  
  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  
  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <F2> <Plug>(coc-rename)

 let g:coc_disable_startup_warning = 1
