call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-sensible'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Plug 'sjl/gundo.vim'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'tpope/vim-vividchalk'

Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'ruanyl/vim-fixmyjs'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'leafgarland/typescript-vim'
Plug 'sjl/gundo.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'benjifisher/matchit.zip'
Plug 'ternjs/tern_for_vim'

" Initialize plugin system
call plug#end()

"colorscheme evening
colorscheme vividchalk

" let g:syntastic_javascript_checkers = ['standard']

" autocmd bufwritepost *.js silent !standard --fix %
set autoread
" let g:signify_vcs_list

set go-=m
set go-=T

set expandtab tabstop=2 shiftwidth=2

" map <D-u> :NERDTreeToggle<CR>
silent! nmap <M-S-u> :NERDTreeToggle<CR>
" map <silent> <C-n> :NERDTreeFocus<CR>
silent! nmap <M-S-i> :NERDTreeFind<CR>
" silent! map <F3> :NERDTreeFind<CR>

" let g:NERDTreeMapActivateNode="<F3>"
" let g:NERDTreeMapPreview="<F4>"
" nnoremap <F5> :GundoToggle<CR>
nnoremap <F5> :UndotreeToggle<cr>

set backupcopy=yes

set hlsearch

set pastetoggle=<F10>
se relativenumber
se number
" nnoremap <leader>s :syntax on<CR>
" nnoremap <leader>S :syntax off<CR>

" let g:ackprg = 'ag --vimgrep --smart-case'                                                   
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev ag Ack                                                                           
cnoreabbrev aG Ack                                                                           
cnoreabbrev Ag Ack                                                                           
cnoreabbrev AG Ack 

nnoremap <leader>s :syntax on<CR>
nnoremap <leader>S :syntax off<CR>

if exists(":nohls")
  nnoremap <silent> <C-L> :nohls<CR><C-L>
endif

nnoremap <leader>% :MtaJumpToOtherTag<cr>

set incsearch

set nobackup
set nowritebackup
set noswapfile
let g:fixmyjs_use_local = 1

" ack -l 'pattern' | xargs perl -pi -E 's/pattern/replacement/g'
" need to install  the `ack` with `sudo apt-get install ack-grep`
" npm install -g snazzy && standard --verbose | snazzy
