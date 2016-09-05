imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv
nmap <buffer> <F5>   <Plug>LatexChangeEnv
vmap <buffer> <F7>   <Plug>LatexWrapSelection
vmap <buffer> <S-F7> <Plug>LatexEnvWrapSelection
imap <buffer> (( \eqref{

map <silent> <Leader>ls :silent
    \ !/Applications/Skim.app/Contents/SharedSupport/displayline
    \ <C-R>=line('.')<CR> "<C-R>=LatexBox_GetOutputFile()<CR>"
    \ "%:p" <CR>
