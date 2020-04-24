if exists("current_compiler") | finish | endif
let current_compiler = "sage"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

setlocal makeprg=sage\ -b\ &&\ sage\ -t\ %:S
setlocal errorformat<

silent CompilerSet makeprg
silent CompilerSet errorformat

let &cpo = s:cpo_save
unlet s:cpo_save
