lua require("init")

"跳出括号
function! SkipPair() 
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}' || getline('.')[col('.') - 1] == ',' || getline('.')[col('.') - 1] == '.' || getline('.')[col('.') - 1] == ';' || getline('.')[col('.') - 1] == '?' || getline('.')[col('.') - 1] == '<' || getline('.')[col('.') - 1] == '>'
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

" 自定义符号自动包裹
function! s:surround()
    let word = expand("<cword>")
    let wrap=input("wrap with: ")
    let command = "s/".word."/".wrap.word.wrap."/"
    execute command
    endfunction
nnoremap <silent>cx :call <SID>surround()<CR>
