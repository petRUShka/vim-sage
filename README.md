# SYNOPSIS

Vim-sage is a vim plugin for support [SageMath](https://www.sagemath.org/) (former Sage) mathematics software system. The vim-sage supports syntax highlighting and indentation for SageMath files in Vim editor.

# Installation

Use your preferred installation method for Vim plugins.

With [vim-plug](https://github.com/junegunn/vim-plug) that would mean to add the following to your `vimrc`:

```vim
Plug 'petRUShka/vim-sage'
```

# Vim plugins to extend SageMath (together with vim-sage)

- [vimcmdline](https://github.com/jalvesaq/vimcmdline): send lines from Vim to interpreter (SageMath and vim-sage are supported)
- [vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent): a nicer Python indentation style for Vim
- [python-syntax](https://github.com/vim-python/python-syntax): extended Python syntax highlighting for Vim (much nicer than default highlight)
- [SimpylFold](https://github.com/tmhedberg/SimpylFold) (together with [FastFold](https://github.com/Konfekt/FastFold)): 
no-BS Python code [folding](https://vim.fandom.com/wiki/Folding) for Vim (it just works with Python code)
- [jedi-vim](https://github.com/davidhalter/jedi-vim): autocompletion, goto assignment/definition/stub, show documentation, renaming, usages and etc for Python. It works only with Python libraries and doesn't see Sage libraries or understand non-python Sage code. But it works well for built-in python instructions or libraries like `numpy` when editing sage code-file.

vim-sage sets `sage.python` filetype for sage-files, so above plugins for Python itself work smoothly with sage-files.

# Tags and code browsing

Whereas it is not clear at the moment how to fully use tools like Language Server or Jedi with SageMath (see discussion and links [here](https://github.com/Konfekt/vim-sage/commit/63ff3d664aa069653032ea49b0f550379832a0bf#commitcomment-38719974)) it is possible to use good old tags with not as good but still usable code navigation (go to definition functionality).

1. Install indexing tool [Universal-ctags](https://ctags.io/). Put following lines in `~/.ctags` (for other other than Linux OS look at [Option file help page](http://docs.ctags.io/en/latest/optlib.html#option-files) to check the right place):

```ctags
# to have ctags skip indexing import statements uncomment following line
# --python-kinds=-i
# SageMath
--langmap=Python:+.sage
```

2. (Optionally) Install vim-plugin [ludovicchabant/vim-gutentags](https://github.com/ludovicchabant/vim-gutentags) for auto(re)generating tag files.

3. Use vim built-in tag browsing and navigating functionality ([:help tagsrch.txt](https://vimhelp.org/tagsrch.txt.html) for details).
