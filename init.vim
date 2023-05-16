lua require("init")

"跳出括号
function! SkipPair() 
    let char = getline('.')[col('.') - 1]

    if char == ')' || char == ']' || char == '"' || char == "'" || char == '}' || char == ',' || char == '.' || char == ';' || char == '?' || char == '<' || char == '>' || char == '('
        return "\<ESC>la"
    else
        return "\t"
    endif
endfunction
inoremap <silent><tab> <C-R>=SkipPair()<CR>

"多窗口编辑时, 临时放大某个窗口, 编辑完再切回原来的布局
function! ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
nnoremap <silent><Leader>z :call ZoomToggle()<CR>

" 自定义符号自动包裹单词
function! s:surroundword()
    let word = expand("<cword>")
    let wrap=input("wrap with: ")
    let command = "s/".word."/".wrap.word.wrap."/"
    execute command
    endfunction
nnoremap <silent>cx :call <SID>surroundword()<CR>

" 自定义符号自动包裹字符串
function! s:surround()
    let word = expand("<cWORD>")
    let wrap=input("wrap with: ")
    let command = "s/".word."/".wrap.word.wrap."/"
    execute command
endfunction
nnoremap <silent><leader>cx :call <SID>surround()<CR>

" 自动转换bool
" function! Switchbool()
"     let word = expand("<cword>")
"     let str = ""
"     let pos = getpos('.')
"
"     if word ==# "true"
"         let str = "false"
"     elseif word ==# "True"
"         let str = "False"
"     elseif word ==# "TRUE"
"         let str = "FALSE"
"     elseif word ==# "false"
"         let str = "true"
"     elseif word ==# "False"
"         let str = "True"
"     elseif word ==# "FALSE"
"         let str = "TRUE"
"     endif
"
"     let command = "s/".word."/".str."/"
"     execute command
"     call setpos('.', pos)
" endfunction
" nnoremap <silent><leader>= :call Switchbool()<CR>

