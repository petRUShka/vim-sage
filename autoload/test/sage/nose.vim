if !exists('g:test#sage#nose#file_pattern')
  let g:test#sage#nose#file_pattern = '\v(^|[\b_\.-])[Tt]est.*\.sage$'
endif

" Returns true if the given file belongs to your test runner
function! test#sage#nose#test_file(file) abort
  if fnamemodify(a:file, ':t') =~# g:test#sage#nose#file_pattern
    if exists('g:test#sage#runner')
      return g:test#sage#runner ==# 'nose'
    else
      return executable('sage_preparse_and_run.sh')
    endif
  endif
endfunction

" Returns test runner's arguments which will run the current file and/or line
function! test#sage#nose#build_position(type, position) abort

  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      let py_fname = fnamemodify(a:position['file'], ":p:r").'.py'
      return [a:position['file'].' '.py_fname.':'.name]
    else
      return [a:position['file']]
    endif
  elseif a:type ==# 'file'
    return [a:position['file']]
  else
    return []
  endif
endfunction

" Returns processed args (if you need to do any processing)
function! test#sage#nose#build_args(args) abort
  return a:args + ['--doctest-tests']
endfunction

" Returns the executable of your test runner
function! test#sage#nose#executable() abort
  return 'sage_preparse_and_run.sh nosetests'
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#python#patterns)

  return join(name['namespace'] + name['test'], '.')
endfunction
