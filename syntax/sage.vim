if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the Python syntax to start with
if version < 600
  source <sfile>:p:h/python.vim
else
  runtime! syntax/python.vim
endif

let b:current_syntax = "sage"
