execute pathogen#infect()

let live=0

set nu
set ml
set mls=5
set showcmd
set ruler
set ts=4
set sw=4
set softtabstop=4
set expandtab
set copyindent
set autoindent
set hlsearch
set showcmd
set guioptions-=T
set guioptions-=m
set guioptions-=r
set scrolloff=5
set dictionary=/usr/share/dict/words
set nofoldenable

" nice status line
" set statusline=%F%m%r%h%w%=%{&fenc}\ %{&ff}\ %Y\ 0x\%02.2B\ %4l/%4L\ %4v
" set statusline=%F%m%r%h%w%=%{strftime(\"%H:%M\")}\ %{&fenc}\ %{&ff}\ %Y\ 0x\%02.2B\ %4l/%4L\ %4v
set laststatus=2

syntax enable

if live == 0
    if has("gui_running") 
        colorscheme lucius
        LuciusDarkLowContrast
    endif
endif

if has("gui_macvim")
	set guifont=Monaco\ for\ Powerline:h12
end

" more sphisticated % matching
runtime macros/matchit.vim

" longer history
set history=100

" set shell like completion
set wildmenu
set wildmode=list:longest

" easy buffer switching
map  <S-Right> :bnext<CR>
imap <S-Right> <ESC>:bnext<CR>
map  <S-Left> :bprev<CR>
imap <S-Left> <ESC>:bprev<CR>
map  <S-Del> :bd<CR>

" set background=dark
" let g:solarized_termcolors=16
" colorscheme solarized

function! ToggleBackground()
	echo &background
	if &background =~"dark"
		set background=light
	else
		set background=dark
	endif
endfunction
command! Togbg call ToggleBackground()
nnoremap <F12> :call ToggleBackground()<CR>
inoremap <F12> <ESC>:call ToggleBackground()<CR>a
vnoremap <F12> <ESC>:call ToggleBackground()<CR>
map  <F10> :Latexmk<CR>

filetype plugin on
filetype indent on
set grepprg=grep\ -nH\ $*

function SetTexMakePrg ()
	if filereadable('Makefile')
		set makeprg=make
	else
		set makeprg=rubber\ -d\ %
	endif
endfunction

if has("autocmd")
	autocmd FileType tex call SetTexMakePrg()
endif

function InsertCHeader ()
  normal gg
  r ~/.vim/skel/c_skel.txt
  % s@$file@\=matchstr(bufname('%'),'[^/]*$')@g
  % s/$year/\=strftime("%Y")/g
  % s/$date/\=strftime("%d.%m.%Y")/g
  normal gg
  normal dd
  normal G
endfunction

function InsertTexHeader ()
  normal gg
  r ~/.vim/skel/tex_skel.txt
  normal gg
  normal dd
  normal G
  normal k
endfunction

function InsertHHeader ()
  call InsertCHeader()
  let fname = toupper(matchstr(bufname('%'),'[^/]*$'))
  let fname = substitute(fname, "[-.]", "_", "g")
  call append(line('$'), "#ifndef " . fname)
  call append(line('$'), "#define " . fname)
  call append(line('$'), "")
  call append(line('$'), "#endif /* " . fname . " */")
endfunction

function! DisableIndent()
        set autoindent&
        set cindent&
        set smartindent&
        set indentexpr&
endfunction

" Insert c_skel.txt into c and h files
autocmd BufNewFile *.cpp call InsertCHeader()
autocmd BufNewFile *.c call InsertCHeader()
autocmd BufNewFile *.h call InsertHHeader()
autocmd BufNewFile *.tex call InsertTexHeader()

" disable standard indenting on tex files
" autocmd FileType tex call DisableIndent()

" remove trailing spaces whenever we save a C/C++ file
autocmd FileType c,cpp,h,hpp,tex autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" make snipmate recognize tex snippets by also setting the file type tex
" au BufRead,BufNewFile *.text set ft=plaintex.tex

if has("autocmd")
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event
" handler (happens when dropping a file on gvim).
	autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
endif

inoremap <Nul> <C-x><C-o>

:highlight clear SpellBad
:highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline gui=underline guifg=Orange
:highlight clear SpellCap
:highlight SpellCap term=underline cterm=underline gui=underline guifg=Orange
:highlight clear SpellRare
:highlight SpellRare term=underline cterm=underline gui=underline guifg=Orange
:highlight clear SpellLocal
:highlight SpellLocal term=underline cterm=underline gui=underline guifg=Orange

" highlight special keys and line endings
highlight NonText ctermfg=8 guifg=#808080
highlight SpecialKeys ctermfg=8 guifg=#808080

" highlight CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" highlight CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" set cursorline

" search for version control markers
map <Leader>d /^\(<<<<<<<\\|=======\\|>>>>>>>\)

" syntax highlighting for coq
au BufRead,BufNewFile *.v set filetype=coq

" see tabs and trailing spaces
set listchars=tab:>-,eol:$,trail:.,extends:#

" clang complete
let g:clang_auto_select=1
let g:clang_complete_auto=1
let g:clang_complete_copen=1
let g:clang_close_preview = 1
let g:clang_hl_errors=1
let g:clang_periodic_quickfix=0
let g:clang_snippets=1
let g:clang_snippets_engine="clang_complete"
let g:clang_conceal_snippets=0
let g:clang_exec="clang"
let g:clang_auto_user_options="path, .clang_complete"
let g:clang_use_library=1
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
let g:clang_sort_algo="priority"
let g:clang_complete_macros=1
let g:clang_complete_patterns=0
nnoremap <Leader>q :call g:ClangUpdateQuickFix()<CR>

" no preview window in omnicomplte
set completeopt-=preview

" make cases indent properly
set cinoptions=:0

" make latex-box treat autoref properly
let g:LatexBox_ref_pattern= '\m\C\\v\?\(eq\|page\|auto\|short\|[cC]\)\?ref\*\?\_\s*{'
let g:LatexBox_viewer = 'open -a skim'
let g:LatexBox_quickfix = 2
let g:LatexBox_latexmk_async = 1
let g:LatexBox_personal_latexmkrc = 1

" make .tex file latex by default
let g:tex_flavor = "latex"

" Disable folding in markdown
let g:vim_markdown_folding_disabled=1

" enable powerline fonts
let g:airline_powerline_fonts = 1

let g:gitgutter_max_signs = 2000
