let g:mapleader = ','

" Vim-javascript
" let g:javascript_plugin_jsdoc = 1
" set conceallevel=1

" Ctrl + y Copying whole file into clipboard
nnoremap <C-y> :%y+<CR>
" Ctrl + y  Copying lines selected in visual mode
vnoremap <C-y> :y+<CR>
" Ctrl + p Pasting texts from clipboard to vim
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Ctrl + n to toggle NerdTree
" function! g:NerdTree_Open()
"   if exists("g:NERDTree") && g:NERDTree.IsOpen() == 1
"     :silent exec ":NERDTreeClose"
"   else
"     :silent exec ":NERDTree ."
"   endif
" endfunction

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Fuzzy Files config map
" f : FZF finds files at your current dir
" nmap <Space>f :Files ../<CR>
" Shift + f : FZF finds files at home dir
" nmap <Space>F :Files ~/Documents/Code<CR> 

" Leader + r for rg, Leader + g for git
" nmap <Leader>r :Rg<CR>

nmap <Leader>f <Plug>(coc-format-selected)

nmap <Leader>h :nohls<CR>
" jk for escape
" imap jk <ESC>

" Mapping with split
" :nnoremap <Space>w <C-w>


noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
