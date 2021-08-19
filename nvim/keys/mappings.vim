" Change leader key to ,
let mapleader=","

" Change between buffers
nnoremap <Tab> :b<Space>

" Save
nnoremap <Leader>s :w<CR> 
" Save and quit
nnoremap <Leader>q :q<CR> 

" Change between scrolloff
nnoremap <Leader>z :let &scrolloff=999-&scrolloff<CR>

" Undotree 
nnoremap <Leader>u :UndotreeToggle<CR>

" Git-Messenger
nnoremap <Leader>g :GitMessenger<CR>
												
" Fuzzy Search
nnoremap <Leader><Space> :Files<CR>
nnoremap <Leader>/ :BLines<CR>
nnoremap <Leader><Tab> :Buffers<CR>
