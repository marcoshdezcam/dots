" 
let g:sneak#label = 1
set tabstop=2                   " Insert 2 spaces with a tab

" -------------------------------- Plugin Installers --------------------------------
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/autoload/plugged')
Plug 'RRethy/vim-illuminate'              " Highlight other uses of the current word
Plug 'justinmk/vim-sneak'                 " Better text navigation
Plug 'tpope/vim-surround'                 " Change sorrounding tags easily
Plug 'tpope/vim-commentary'               " Comment/Uncomment code 
call plug#end()
