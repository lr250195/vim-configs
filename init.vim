call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'artanikin/vim-synthwave84'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

syntax on
set rnu 
set nu
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set hlsearch
set smartcase
set title
set showmatch
set guifont=Fira\ Code:h10

""" Plugin remaps
let mapleader=","
noremap <leader>fs :Files<cr>
map <C-b> :NERDTreeToggle<CR>

"" Coc-nvim customs
map <C-p> :CocCommand prettier.formatFile<CR>
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


""" Remaps
map <C-t> :vsplit<CR>
inoremap jk <Esc>
tnoremap <Esc> <C-\><C-n>

""" Auto complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


""" Theme
" colorscheme synthwave84
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast='hard'
let g:airline_powerline_fonts = 1

""" Terminal
" open new split panes to right and below
set splitright
set splitbelow
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
