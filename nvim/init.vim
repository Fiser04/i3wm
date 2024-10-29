:set number
:set relativenumber
set updatetime=300
:set tabstop=4  
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
"c#"
Plug 'OmniSharp/omnisharp-vim'
"error check"
Plug 'dense-analysis/ale'
"debug"
Plug 'mfussenegger/nvim-dap'
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


lua << EOF
local dap = require('dap')

dap.adapters.coreclr = {
  type = 'executable',
  command = '/usr/bin/netcoredbg/netcoredbg',
  args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
  },
}
EOF

nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
