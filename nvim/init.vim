:set number
:set relativenumber
set updatetime=300

call plug#begin()
"theme"
Plug 'https://github.com/bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
"game"
Plug 'https://github.com/ThePrimeagen/vim-be-good'
"transparent"
Plug 'https://github.com/tribela/vim-transparent'
"autofill"
Plug 'https://github.com/neoclide/coc.nvim'
"filesearch"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
"file"
Plug 'https://github.com/preservim/nerdtree'
"differ"
Plug 'airblade/vim-gitgutter'
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
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
"nerdtree startup"
"autocmd VimEnter * NERDTree | wincmd p"
" For vim
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'

" Then set transparent sign column
highlight SignColumn guibg=NONE


