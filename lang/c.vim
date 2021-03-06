let s:projections = {
      \ '*.c': {'type': 'c', 'alternate': ['{}.h']},
      \ '*.h': {'type': 'c', 'alternate': ['{}.c']},
      \ '*.cpp': {'type': 'cpp', 'alternate': ['{}.hpp']},
      \ '*.hpp': {'type': 'cpp', 'alternate': ['{}.cpp']},
      \ '*': {}
      \ }

function! s:ProjectionistDetect() abort
  if &filetype ==# 'c' || &filetype ==# 'cpp'
    let l:projections = deepcopy(s:projections)
    call projectionist#append(getcwd(), l:projections)
  endif
endfunction

augroup config#c
  autocmd!
  autocmd User ProjectionistDetect call s:ProjectionistDetect()
  au FileType cpp setlocal foldmethod=syntax
augroup END

if executable('clangd')
  call lspex#add_server('c', ['clangd'])
  call lspex#add_server('cpp', ['clangd'])
endif
