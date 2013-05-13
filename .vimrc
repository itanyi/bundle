execute pathogen#infect()
"开启语法高亮
syntax on
"依文件类型设置自动缩进
filetype indent plugin on
 
"显示当前的行号列号：
set ruler
"在状态栏显示正在输入的命令
set showcmd
 
"关闭/打开配对括号高亮
"NoMatchParen
"DoMatchParen
"显示行号：
set number
""为方便复制，用<F2>开启/关闭行号显示:
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set modeline
"为深色背景调整配色
set background=dark
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt+=longest
" 
" "离开插入模式后自动关闭预览窗口
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"  
"  "回车即选中当前项
  inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"   
"   "上下左右键的行为
   inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
   inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
   inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :"\<PageDown>"
   inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
   let g:acp_completeoptPreview = 1
" 自动检测文件类型并加载相应的设置
filetype plugin indent on
autocmd FileType python setlocal et sta sw=4 sts=4
autocmd FileType python setlocal foldmethod=indent
set tabstop=4
"默认展开所有代码
set foldlevel=99
"autocmd VimEnter * NERDTree
se cul
set mouse=a
set hlsearch
set incsearch
map <F8> :NERDTree<CR>
let mapleader = "\\"
map <leader>f :FufFile<CR>
map <leader>ft :FufTaggedFile<CR>
map <leader>fg :FufTag<CR>
map <leader>b :FufBuffer<CR>
set shiftwidth=4 
set tabstop=4 
set expandtab 
set softtabstop=4 
""定义函数SetTitle，自动插入文件头 
autocmd BufNewFile *.py,*.cpp,*.sh,*.java exec ":call SetTitle()"
func SetTitle()
    "如果文件类型为.sh文件 
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "# Author: tanyi@wandoujia.com")
        call append(line(".")+1, "# Created Time:" .strftime("%m/%d/%y %H:%M:%S"))
        call append(line(".")+2, "")
    elseif &filetype == 'cpp'
        call setline(1,"// File Name: ".expand("%"))
        call append(line("."), "// Author: tanyi@wandoujia.com")
        call append(line(".")+1, "// Created Time: ".strftime("%m/%d/%y %H:%M:%S"))
        call append(line(".")+2, "")
        call append(line(".")+3, "#include<iostream>")
        call append(line(".")+4, "#include<string>")
        call append(line(".")+5, "#include<algorithm>")
        call append(line(".")+6, "#include<cstdlib>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "int main(){")
        call append(line(".")+9, "")
        call append(line(".")+10, "    return 0")
        call append(line(".")+11,"}")
    elseif &filetype == 'python'
        call setline(1,"#-*-coding:GB18030-*-")
        call append(line("."),"\#!/usr/bin/env python")
        call append(line(".")+1, "# Author: tanyi@wandoujia.com")
        call append(line(".")+2, "# Created Time: ".strftime("%m/%d/%y %H:%M:%S"))
        call append(line(".")+3, "# about:")
    else
        call setline(1,"/*")
        call append(line("."), "* Author: tanyi@wandoujia.com")
        call append(line(".")+1, "* Created Time: ".strftime("%m/%d/%y %H:%M:%S"))
        call append(line(".")+2, "*/")
        call append(line(".")+3, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc
