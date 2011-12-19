if exists("b:did_indent")
    finish
endif

" Read the Python syntax to start with
if version > 600
  runtime! indent/python.vim
endif

let b:did_indent = 1
