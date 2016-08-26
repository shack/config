call plug#begin('~/.config/nvim/plugged')

Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
" Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'jonathanfilip/vim-lucius'
Plug 'Valloric/YouCompleteMe', {  
     \ 'build'      : {
        \ 'mac'     : './install.sh --clang-completer --system-libclang --omnisharp-completer',
        \ }
     \ }

call plug#end()


