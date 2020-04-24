if exists("b:did_ftplugin") | finish | endif

if version > 600
  runtime! ftplugin/python.vim
endif

" Sage settings (from Franco Saliola)
setlocal tabstop=2 shiftwidth=2 expandtab
compiler sage

let b:undo_ftplugin =  'setlocal tabstop< shiftwidth< expandtab<'
let b:undo_ftplugin .= '| setlocal makeprg< errorformat<'
let b:did_ftplugin = 1
