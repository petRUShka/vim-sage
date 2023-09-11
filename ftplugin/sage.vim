if exists("b:did_ftplugin") | finish | endif

if version > 600
  runtime! ftplugin/python.vim
endif

autocmd Filetype sage set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType sage set makeprg=sage\ -b\ &&\ sage\ -t\ %
autocmd FileType sage nnoremap <buffer> <silent> <S-K> :!sage -c "help(<cword>)" \| less <CR><CR>

let b:did_ftplugin = 1
