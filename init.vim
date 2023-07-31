set number

call plug#begin('~/.vim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'folke/tokyonight.nvim'
Plug 'xiyaowong/transparent.nvim'
Plug 'preservim/nerdtree'
Plug 'nvim-lua/popup.nvim'  " Required dependency
Plug 'nvim-lua/plenary.nvim'  " Required dependency
Plug 'nvim-telescope/telescope.nvim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Enable auto-pairs plugin
let g:AutoPairsMapCR = 0
let g:AutoPairsFlyMode = 1

" Enable nerdfonts (devicons)
let g:webdevicons_enable = 1

" Show the buffer list as a persistent bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffers = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%d'


set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'],
      \            ['readonly', 'filename', 'modified', 'lineinfo'],
      \            ['percent'],
      \           ],
      \   'right': [['fileformat', 'fileencoding', 'filetype'],
      \             ['gitbranch'],
      \            ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component': {
      \   'lineinfo': '%3l/%L',
      \   'percent': '%3p%%',
      \ }
      \ }


" Define pairs to be autoclosed
let g:AutoPairs = {
    \ '(' : ')',
    \ '[' : ']',
    \ '{' : '}',
    \ "'" : "'",
    \ '"' : '"',
    \ '`' : '`',
    \ }

let g:rainbow_conf = {
    \ 'guifgs': ['gold', 'Springgreen3', 'MediumPurple1', 'Cyan', 'DarkOrange1', 'HotPink1', 'chartreuse3'],
    \ 'ctermfgs': [3, 2, 5, 6, 9, 13, 10],
    \ 'guibgs': ['none', 'none', 'none', 'none', 'none', 'none', 'none'],
    \ 'ctermbgs': ['none', 'none', 'none', 'none', 'none', 'none', 'none'],
    \ 'matchparen': 1,
    \ 'matchparen_fold': 1,
    \ 'html': 1,
    \ 'css': 1,
    \ 'javascript': 1,
    \ 'javascriptreact': 1,
    \ 'typescript': 1,
    \ 'typescriptreact': 1,
    \ }

let g:go_auto_sameids = 1
lua << EOF
local lspconfig = require('lspconfig')
lspconfig.gopls.setup{}
EOF

lua << EOF
local compe = require('compe')
compe.setup {
    enabled = true,
    autocomplete = true,
    preselect = 'disable',
    source = {
        path = true,
        buffer = true,
        nvim_lsp = true,  -- Use nvim-compe's LSP source
        nvim_lua = true,  -- Optional, enable if you use Lua plugins
    },
}
EOF

colorscheme tokyonight

nnoremap ff :Telescope find_files<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-s> :w<CR>

