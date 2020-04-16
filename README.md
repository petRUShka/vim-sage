https://github.com/tmhedberg/SimpylFold# SYNOPSIS

Vim-sage is a vim plugin for support [SageMath](https://www.sagemath.org/) (former Sage) mathematics software system. The vim-sage supports syntax highlighting and indentation for SageMath files in Vim editor.

# Installation

Use your preferred installation method for Vim plugins.

With [vim-plug](https://github.com/junegunn/vim-plug) that would mean to add the following to your `vimrc`:

```vim
Plug 'petRUShka/vim-sage'
```

# Vim plugins to extend SageMath (together with vim-sage)

- [vimcmdline](https://github.com/jalvesaq/vimcmdline): send lines from Vim to interpreter (SageMath is supported)
- [vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent): a nicer Python indentation style for Vim
- [python-syntax](https://github.com/vim-python/python-syntax): extended Python syntax highlighting for Vim (much nicer than default highlight)
- [SimpylFold](https://github.com/tmhedberg/SimpylFold) (together with [FastFold](https://github.com/Konfekt/FastFold)): 
no-BS Python code [folding](https://vim.fandom.com/wiki/Folding) for Vim (it just works with Python code)


vim-sage sets `sage.python` filetype for sage-files, so above plugins for Python itself work smoothly with sage-files.
