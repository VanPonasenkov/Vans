filetype plugin on
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
colorscheme gruvbox-material
set background=dark
function! CustomRustFmt()
    let file = expand('%') 
    silent execute "!rustfmt " . file
    edit!
    set filetype=rust
endfunction

command! CustomRustFmt call CustomRustFmt()
autocmd BufWritePost *.rs CustomRustFmt

call plug#begin()

Plug 'ollykel/v-vim'

call plug#end()
