if exists("b:did_ftplugin") | finish | endif

if version > 600
  runtime! ftplugin/python.vim
endif

" Sage settings (from Franco Saliola)
autocmd Filetype sage set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType sage set makeprg=sage\ -b\ &&\ sage\ -t\ %

let b:did_ftplugin = 1
