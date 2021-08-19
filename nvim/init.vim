if !exists('g:vscode')
  " General Settings
  source $HOME/.config/nvim/general/settings.vim
  " Plugins
  source $HOME/.config/nvim/vim-plug/plugins.vim
  " Keyboard mappings
  source $HOME/.config/nvim/keys/mappings.vim
  " Plugin configs
  source $HOME/.config/nvim/plug-config/settings.vim
  " COC Configs
  source $HOME/.config/nvim/plug-config/coc.vim
  " COC-Explorer Settings
  source $HOME/.config/nvim/plug-config/coc-explorer.vim 
  "Startify config
  source $HOME/.config/nvim/plug-config/start-screen.vim
  " Airline config
  source $HOME/.config/nvim/themes/airline.vim
elseif exists('g:vscode')
  " VSCode config
  source $HOME/.config/nvim/vscode/vsc-settings.vim
endif