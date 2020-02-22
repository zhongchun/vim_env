" 设置语言
" 帮助文档语言 en英文 cn中文
set helplang=cn
" 文件默认编码
set encoding=utf-8
" 文件保存时使用的编码
set fileencoding=utf-8
" 打开文件进行解码的猜测列表，优先以utf-8打开
set fileencodings=utf-8,gbk

" 显示行号
set number
" 显示相对行号
set relativenumber

" highlight current column
set cursorcolumn
" highlight current line
set cursorline
" cterm 表示原生vim设置样式, 设置为NONE表示可以自定义设置
" red（红），white（白），black（黑），green（绿），yellow（黄），blue（蓝），purple（紫），
" gray（灰），brown（棕），tan(褐色)，syan(青色)
" 更多高亮颜色设置, 可以:h highlight 查看manual
highlight CursorLine   cterm=NONE ctermbg=blue ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=blue ctermfg=NONE guibg=NONE guifg=NONE

" 鼠标捕捉
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 显示括号匹配
set showmatch

" 缩进为4个空格宽度
set tabstop=2
" 自动缩进使用的空格数
set shiftwidth=2
" 编辑插入tab时，把tab算作的空格数
set softtabstop=2
" 缩进使用空格
set expandtab
" 自动缩进
set autoindent
" 自动折行，即太长的行分成几行显示
set wrap
" 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。也就是说，不会在单词内部折行
set linebreak
" 指定折行处与编辑窗口的右边缘之间空出的字符数
set wrapmargin=2

" 显示空格和tab键
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→
" set listchars=tab:>>,trail:·
" set listchars=tab:>-,trail:·
" set listchars=tab:>>,trail:·,eol:¬
" set listchars=tab:»■,trail:■
set list

"非可见字符 eol extends precedes 是由 NonText 高亮组来控制显示颜色的
hi NonText ctermfg=239
"nbsp tab trail 是由 SpecialKey 高亮组来定义颜色的
hi SpecialKey ctermfg=239

" 总是显示状态栏
set laststatus=2
" ruler, show the cursor position all the time
set ruler

" 设置行宽
set textwidth=80
let &colorcolumn="100"

" 打开英语单词拼写检查
" set spell spelllang=en_us

" allow backspacing over everything in insert mode
set bs=indent,eol,start		
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
" keep 1000 lines of command line history
set history=1000

let mapleader=";"
" 非兼容模式, 关闭 vi 兼容模式
set nocompatible
" 搜索时高亮显示结果
set hlsearch
" 输入搜索命令时，显示目前输入的模式的匹配位置
set incsearch
"使用:e命令的时候 可选项预览
set wildmenu
set showcmd
"设置命令行高度
set cmdheight=1

"打开语法高亮
syntax on
syntax enable

"设置字典
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict

"Color Scheme
set background=dark
set t_Co=256
" colorscheme solarized
colorscheme molokai
" let g:solarized_termcolors=256

"显示标签栏 0: 从不 1: 大于1个时显示 2: 总是
set showtabline=1
"使查找替换忽略大小写的选项
"set ic
"gvim下设置无菜单栏工具栏
set go= "无菜单、工具栏
" 字体设置
set guifont=monaco:h17
" tab键自动补全
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 打开php折叠
let php_folding = 1 
" 打开javascript折叠
let b:javaScript_fold=1
" 打开javascript对dom、html和css的支持
let javaScript_enable_domhtmlcss=1

" 定义快捷键
" nmap LB 0
" nmap LE $

"映射F12键为行号的开关
map <F12> :set number!<CR>
"映射tab键
nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>
"映射vimgrep匹配的cn,cp
nmap <C-M> :cn<CR>
"nmap <C-B> :cp<CR>
inoremap jj <ESC>
"ctags设置
"set tags=~/work/mapv/src/tags
"Tlist配置
map <F3> :Tlist<CR>
" let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_Auto_Open=1
" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1
let Tlist_Display_Prototype=1
let Tlist_Exit_OnlyWindow=1
let g:tlist_javascript_settings='javascript;f:function;c:class;o:object;m:method;s:string;a:array;n:constant'
" 终端显示
set termencoding=utf-8

"开发时候编译
"map <F5> <Esc>:!cd ~/work/mapv; git add .; git commit -m 'update'; git push<CR>

"""""""""""""""""""""""""""""""""""
" vundle plugin
"""""""""""""""""""""""""""""""""""
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" My Bundle here:

" Plugin 'c.vim'

Plugin 'The-NERD-tree'
"NERDTree shortkey
map <F2> :NERDTreeToggle<CR>

Plugin 'majutsushi/tagbar'
nmap <silent> <F9> :TagbarToggle<CR>
" let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:tagbar_width = 30

"Color Scheme
Plugin 'altercation/vim-colors-solarized'

" Plugin 'sjl/badwolf'

" vim comment plugin
" Plugin 'scrooloose/nerdcommenter'
" let NERDSpaceDelims=1
" let NERDRemoveExtraSpaces=1

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" vim-airline theme
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='molokai'
" let g:airline_theme='solarized'

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled     = 1
let g:airline#extensions#syntastic#enabled  = 1
" vim-powerline symbols
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_symbols.branch     = '⭠'
let g:airline_symbols.readonly   = '⭤'

let g:airline_symbols.linenr = '⭡'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'       "配置全局路径
"log"
"let g:ycm_server_keep_logfiles=1
"let g:ycm_sever_log_level='debug'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
"let g:ycm_confirm_extra_conf=0
"set completeopt=longest,menu
"python解释器路径"
let g:ycm_path_to_python_interpreter='/usr/local/bin/python3'
"let g:ycm_python_binary_path = '/usr/local/bin/python3'   "python 环境
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings=0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_min_num_identifier_candidate_chars=2
"补全后自动关机预览窗口"
"let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings=1
let g:ycm_seed_identifiers_with_syntax=1 
"补全关键字
let g:ycm_key_invoke_completion='<c-z>'
let g:ycm_semantic_triggers={
  \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
  \ 'cs,lua,javascript': ['re!\w{2}'],
  \ }

"离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项"
"inoremap <expr> <CR>       pumvisible() ? '<C-y>' : '\<CR>'
"上下左右键行为"
"inoremap <expr> <Down>     pumvisible() ? '\<C-n>' : '\<Down>'
"inoremap <expr> <Up>       pumvisible() ? '\<C-p>' : '\<Up>'
"inoremap <expr> <PageDown> pumvisible() ? '\<PageDown>\<C-p>\<C-n>' : '\<PageDown>'
"inoremap <expr> <PageUp>   pumvisible() ? '\<PageUp>\<C-p>\<C-n>' : '\<PageUp>'\

call vundle#end()

filetype plugin indent on
filetype plugin on

let g:C_UseTool_cmake='yes'
let g:C_UseTool_doxygen='yes'

