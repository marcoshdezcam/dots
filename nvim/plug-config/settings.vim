" -------------------------------------------------------------------
" ---------------------- PLUGIN CONFIGURATION -----------------------
" ------------------------------------------------------------------- {
  
" ============================================= Seeing is believing {
augroup seeingIsBelievingSettings
  autocmd!

  autocmd FileType ruby nmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby xmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)

  autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

  autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
  autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)
augroup END
" ================== }

" ========================================== KITE - AI Autocomplete {
let g:kite_supported_languages = ['*']
set completeopt+=menuone
set completeopt+=noinsert
set completeopt+=preview
autocmd CompleteDone * if !pumvisible() | pclose | endif
"let g:kite_log=1
"set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
" ================== }
 
" ============================================ ALE - Linting engine {
let g:ale_fix_on_save = 1  
let g:ale_linters = {'ruby': ['rubocop'], 'eruby': ['erubi']}
let g:ale_fixers = {'ruby': ['rubocop'], 'scss': ['prettier'], 'html': ['prettier'], 'css': ['prettier'], 'cpp': ['clang-format'] }
let g:airline#extensions#ale#enabled = 1
" ================== }

" ============================================== FZF - Fuzzy Search {
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }
" ================== }

" ====================================================== TrueColors {
if (has("termguicolors"))
  set termguicolors
endif
" ================== }
 
" ========================================== Transparent background {
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" ================== }


" ============================================ CCLS Language Server {
let s:ccls_settings = {
         \ 'highlight': { 'lsRanges' : v:true },
         \ }
let s:ccls_command = ['ccls', '-init=' . json_encode(s:ccls_settings)]
let g:LanguageClient_serverCommands = {
      \ 'c': s:ccls_command,
      \ 'cpp': s:ccls_command,
      \ 'objc': s:ccls_command,
      \ }
" ================== }
 
" ================================================ C++ Highlighting {
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" ================== }
 
" ----------------------------------------------------------------- 
" ---------------------- PLUGIN CONFIGURATION ---------------------
" ----------------------------------------------------------------- }

" ----------------------------------------------------------------- 
" ----------------------------- APPEREANCE ------------------------ 
" ----------------------------------------------------------------- { 
" OceanicNext tweaks
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" let g:oceanic_italic_comments = 1
" let g:oceanic_for_polyglot = 1
" let g:oceanic_transparent_bg = 1

" Palenight tweaks
" let g:palenight_terminal_italics=1

" Gruvbox tweaks
let g:gruvbox_italic=1
let g:gruvbox_bold=1
let g:gruvbox_transparent_bg=1

" Theme
colorscheme gruvbox
let g:airline_theme = 'gruvbox'

" One theme tweaks
" set background=dark
" let g:one_allow_italics = 1

" Ayu theme tweaks
"let ayucolor="dark"
" IndentLine for Ayu {
"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
"let g:indentLine_showFirstIndentLevel = 1
"let g:indentLine_setColors = 0
" ================== }

" ----------------------------------------------------------------- 
" ----------------------------- Appereance ------------------------ 
" ----------------------------------------------------------------- }

let g:ruby_recommender_style = 1          " Ruby-settings
let g:mkdp_path_to_chrome = "/usr/bin/firefox" " Markddown preview
