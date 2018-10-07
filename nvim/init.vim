" Author            : FenixLin
" Date              : 2018-10-05
" Last Modified Date: 2018-10-07
""""""""""
" normal vim setting
""""""""""

set encoding=utf-8

" 未保存确认
set confirm

" 禁止备份和交换文件
set nobackup
set noswapfile

" 粘贴模式
set paste

" 显示行号
set number

" tab设置
set expandtab  " 禁止在代码中使用tab
set smarttab  " 使用shiftwidth，不考虑tabstop
set shiftwidth=4  " 自动缩进的长度
set tabstop=4  " tab等同的空格长度
set softtabstop=4  " 参考此宽度，决定按tab时插入的制表符数量(避免shiftwidth与tabstop不一致)

" 为当前行添加下划线
set cursorline

" 允许关键字高亮
syntax on

" 为配色方案开启256色支持
set t_Co=256

" 配色方案(改用gruvbox)
"color torte

""""""""""
" vim-plug settings (插件的设置在plug#end后才生效)
""""""""""

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

" auto completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" auto code check
Plug 'w0rp/ale'

" color scheme
Plug 'morhetz/gruvbox'

" appearance
Plug 'luochen1990/rainbow'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

" git / svn status
Plug 'mhinz/vim-signify'

" file header
Plug 'alpertuna/vim-header'

" Initialize plugin system
call plug#end()

""""""""""
" colorscheme setting
""""""""""

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

""""""""""
" deoplete setting
""""""""""

" help deoplete
" 自动启用
let g:deoplete#enable_at_startup = 1
" 基本设定：
call deoplete#custom#option({
\ 'ignore_case': v:true,
\ })

""""""""""
" airline setting
""""""""""

" help airline

" Ubuntu: 必须右键设置字体 ( "Right Menu" -> "Profile" -> "General" )
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 15

" airline主题
let g:airline_theme='wombat'

" 标签页(buffer)相关。使用``:enew :bn :bp :b 数字``来切换buffer
" 默认显示标签页
let g:airline#extensions#tabline#enabled = 1
" 显示标签页序号
let g:airline#extensions#tabline#buffer_idx_mode = 1
" 显示buffer编号，方便切换
let g:airline#extensions#tabline#buffer_nr_show = 1

" 禁用行首空白符/Tab混合问题检测（需要的话交给其他插件吧）
let g:airline#extensions#whitespace#enabled = 0

" 关闭空状态栏(主要是warning和error部分)
"let g:airline_skip_empty_sections = 1

" 关闭paste状态
let g:airline_detect_paste = 0

" 自定义airline状态栏(不知道为啥branch部分无法create，只能用默认了)
" 关闭修改数字统计
let g:airline#extensions#hunks#enabled = 0
" 开启branch显示
let g:airline#extensions#branch#enabled = 1
" 限制branch名字长度
let g:airline#extensions#branch#displayed_head_limit = 10
" 限制显示的commit sha1长度
let g:airline#extensions#branch#sha1_len = 5

" 自定义不同位置的状态
let g:airline_section_c = airline#section#create(['linenr','maxlinenr',':%c',' 0x%B'])
let g:airline_section_y = airline#section#create_right(['%{strftime("%H:%M")}'])
"let g:airline_section_y = airline#section#create_right(['%{strftime("%H:%M\ %a")}'])
let g:airline_section_z = airline#section#create_right(['ffenc'])

" 自定义删减section与width的关系
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 30,
  \ 'x': 80,
  \ 'y': 60,
  \ 'z': 50,
  \ 'warning': 40,
  \ 'error': 30,
  \ }

" filename mod
let g:airline#extensions#tabline#fnamemod = ':p:t'

" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

""""""""""
" ale setting
""""""""""

"use :ALEInfo to check status

call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')

let g:airline_section_error = airline#section#create_right(['ALE'])

"keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#ale#enabled = 1

""""""""""
" vim-header setting
""""""""""

" 自动启用
let g:header_auto_add_header = 1
" 创建者注释
let g:header_field_author = 'FenixLin'
" 日期格式
let g:header_field_timestamp_format = '%Y-%m-%d'
" 不添加Filename行
let g:header_field_filename = 0
" 不添加最后修改者行
let g:header_field_modified_by = 0

""""""""""
" rainbow setting
""""""""""

" 自动启用
let g:rainbow_active = 1
