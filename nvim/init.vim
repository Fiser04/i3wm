:set number
:set relativenumber
call plug#begin()
"theme"
Plug 'https://github.com/bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
"game"
Plug 'https://github.com/ThePrimeagen/vim-be-good'
"transparent"
Plug 'https://github.com/tribela/vim-transparent'
"autofill"
Plug 'https://github.com/neoclide/coc.nvim'
"file"
Plug 'https://github.com/preservim/nerdtree'
call plug#end()
"diff"
Plug 'sindrets/diffview.nvim'
"theme"
:colorscheme moonfly

"tab to autofill"
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

"nerdtree"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"nerdtree startup"
"autocmd VimEnter * NERDTree | wincmd p"
