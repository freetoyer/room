"много плагинов на vimawesome.com

call plug#begin('~/.vim/plugged')

"отображение каталогов
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"автодополнение команд
Plug 'Valloric/YouCompleteMe'   
"автозаполнение парных символов
Plug 'jiangmiao/auto-pairs'
"команды git запуск из vim
Plug 'tpope/vim-fugitive'
"автоформат кода
Plug 'Chiel92/vim-autoformat'
"быстрое написание html и css
Plug 'mattn/emmet-vim'

" Initialize plugin system
call plug#end()

"mapping
"вкл. отображение каталогов
map <C-n> :NERDTreeToggle<CR>

"настройка автодополнения команд
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

"отступы
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

"нумерация строк
set number

"подсветка кода
syntax on
colorscheme ron 

"подсветка поиска
set hlsearch
set incsearch


"переключение между окнами
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin ==winnr())
        if(match(a:key, '[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction
