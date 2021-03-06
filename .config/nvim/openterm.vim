" Enables UI styles suitable for terminals etc
function! EnableCleanUI() abort
  setlocal listchars=
    \ nonumber
    \ norelativenumber
    \ nowrap
    \ winfixwidth
    \ laststatus=0
    \ noshowmode
    \ noruler
    \ scl=no
    \ colorcolumn=
  autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endfunction

" Open autoclosing terminal, with optional size and dir
function! openterm#run(cmd) abort
  setf openterm
  if has('nvim')
    call termopen(a:cmd, {'on_exit': {_,c -> openterm#close(c)}})
  else
    call term_start(a:cmd, {'exit_cb': {_,c -> openterm#close(c)}})
  endif
endfunction

" Open split with animation
function! openterm#horizontal(cmd, percent) abort
  if has('nvim') | new | endif
  call openterm#run(a:cmd)
  wincmd J | resize 1
  if exists('g:animate#loaded') && g:animate#loaded
    call animate#window_percent_height(a:percent)
  endif
endfunction

" Open vsplit with animation
function! openterm#vertical(cmd, percent) abort
  if has('nvim') | vnew | endif
  call openterm#run(a:cmd)
  wincmd L | vertical resize 1
  if exists('g:animate#loaded') && g:animate#loaded
    call animate#window_percent_width(a:percent)
  endif
endfunction

" Handles closing in cases where you would be the last window
function! openterm#close(code) abort
  if a:code == 0
    let current_window = winnr()
    bdelete!
    " Handles special case where window remains due startify
    if winnr() == current_window
      close
    endif
  endif
endfunction

function! openterm#open() abort
  call EnableCleanUI()
  tnoremap <Esc> <c-c>
  startinsert
endfunction

augroup openterm
  autocmd!
  autocmd! FileType openterm call openterm#open()
augroup END
