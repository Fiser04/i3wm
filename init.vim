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
"latex"
Plug 'lervag/vimtex'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }
call plug#end()

"theme"
:colorscheme moonfly

"tab to autofill"
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

"nerdtree"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:coc_filetype_map = {'tex': 'latex'}

"nerdtree startup"
"latex conf"
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexrun'

"autocmd VimEnter * NERDTree | wincmd p"
