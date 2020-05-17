if !exists('g:test#sage#pytest#file_pattern')
  let g:test#sage#pytest#file_pattern = '\v(test_[^/]+|[^/]+_test)\.sage$'
endif

function! test#sage#pytest#test_file(file) abort
  if fnamemodify(a:file, ':t') =~# g:test#sage#pytest#file_pattern
    if exists('g:test#sage#runner')
      return g:test#sage#runner ==# 'pytest'
    else
      return executable('sage_preparse_and_run.sh')
    endif
  endif
endfunction

function! test#sage#pytest#build_position(type, position) abort
  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      let py_fname = fnamemodify(a:position['file'], ":p:r").'.py'
      return [a:position['file'].' '.py_fname.'::'.name]
    else
      return [a:position['file']]
    endif
  elseif a:type ==# 'file'
    return [a:position['file']]
  else
    return []
  endif
endfunction

function! test#sage#pytest#build_args(args) abort
  let args = a:args

  if test#base#no_colors()
    let args = ['--color=no'] + args
  endif

  "let args = ['--disable-warnings'] + args

  return args
endfunction

function! test#sage#pytest#executable() abort
  "let pipenv_prefix = ""
  "
  "if filereadable("Pipfile")
  "  let pipenv_prefix = "pipenv run "
  "elseif filereadable("poetry.lock")
  "  let pipenv_prefix = "poetry run "
  "endif
  "
  "if executable("py.test") && !executable("pytest")
  "  return pipenv_prefix . "py.test"
  "else
  "  return pipenv_prefix . "pytest"
  "endif
  if executable("py.test") && !executable("pytest")
    return 'sage_preparse_and_run.sh py.test'
  else
    return 'sage_preparse_and_run.sh pytest'
  end
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#python#patterns)
  let namespace_str = join(name['namespace'], '::')
  let test_id = []

  if !empty(name['namespace'])
      let test_id = test_id + name['namespace']
  endif
  if !empty(name['test'])
      let test_id = test_id + name['test']
  endif

  " ex:
  "   /path/to/file.py::TestClass
  "   /path/to/file.py::TestClass::method
  "   /path/to/file.py::TestClass::NestedClass::method
  let dtest_str = join(test_id, '::')
  return dtest_str
endfunction
