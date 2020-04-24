if exists("b:did_ftplugin") | finish | endif

if version > 600
  runtime! ftplugin/python.vim
endif

" Sage settings (from Franco Saliola)
setlocal tabstop=2 shiftwidth=2 expandtab
compiler sage

let b:undo_ftplugin =  'setlocal tabstop< shiftwidth< expandtab<'
let b:undo_ftplugin .= '| setlocal makeprg< errorformat<'

if executable('sage')
  if !has('gui_running')
    command! -buffer -nargs=1 SageHelp
          \ silent exe '!' . 'sage -c ''help(<args>)''' |
          \ redraw!
  elseif has('terminal')
    command! -buffer -nargs=1 SageHelp
          \ silent exe 'term ' . 'sage -c ''help(<args>)'''
  else
    command! -buffer -nargs=1 SageHelp echo system('sage -c ''<args>'' 2>/dev/null')
  endif
  setlocal keywordprg=:SageHelp
  let b:undo_ftplugin .= '| setlocal keywordprg<'
endif

let b:did_ftplugin = 1
