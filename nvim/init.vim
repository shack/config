" Get abolsute path without symlinks to vim configuration directory
" see: http://stackoverflow.com/questions/4976776/how-to-get-path-to-the-current-vimscript-being-executed
let $VIMHOME=fnamemodify(resolve(expand('<sfile>:p')), ':h')

call plug#begin("$VIMHOME/plugged")

Plug 'jonathanfilip/vim-lucius'
Plug 'chrisbra/Recover.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'joom/latex-unicoder.vim'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'chrisbra/unicode.vim'
Plug 'adelarsq/vim-matchit'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'Valloric/YouCompleteMe'

call plug#end()

set spell
set vb " no sound effects
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
set wrap
set noincsearch
set laststatus=2
set colorcolumn=80
set virtualedit=block

" open split window on the right
set splitright

syntax enable

" if has("gui_running")
colorscheme lucius
" LuciusLightLowContrast
LuciusDarkLowContrast
" endif

if exists("neovim_dot_app") || has("gui_macvim")
	set guifont=Source\ Code\ Pro\ for\ Powerline:h12
end

" longer history
set history=100

" set shell like completion
set wildmenu
set wildmode=list:longest

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

filetype plugin on
set grepprg=grep\ -nH\ $*

function InsertCHeader ()
  normal gg
  r $VIMHOME/skel/c_skel.txt
  % s@$file@\=matchstr(bufname('%'),'[^/]*$')@g
  % s/$year/\=strftime("%Y")/g
  % s/$date/\=strftime("%d.%m.%Y")/g
  normal gg
  normal dd
  normal G
endfunction

function InsertTexHeader ()
  normal gg
  r $VIMHOME/skel/tex_skel.txt
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

" Insert c_skel.txt into c and h files
autocmd BufNewFile *.cpp call InsertCHeader()
autocmd BufNewFile *.c call InsertCHeader()
autocmd BufNewFile *.h call InsertHHeader()
autocmd BufNewFile *.tex call InsertTexHeader()

" remove trailing spaces whenever we save a C/C++ file
autocmd FileType c,cpp,h,hpp,tex,java autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" see tabs and trailing spaces
set listchars=tab:>-,eol:$,trail:.,extends:#

" ignore textfiles fir trailing whitespace
let g:extra_whitespace_ignored_filetypes = ['mkd', 'text']

" syntax highlighting for coq
au BufRead,BufNewFile *.v set filetype=coq

" C indent options (:help cinoptions-values)
set cinoptions=l1,g0,t0,(0,w1,W4,:0

" make snipmate recognize tex snippets by also setting the file type tex
" au BufRead,BufNewFile *.text set ft=plaintex.tex

if has("autocmd")
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event
" handler (happens when dropping a file on gvim).
	autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
endif

inoremap <Nul> <C-x><C-o>

" :highlight clear SpellBad
" :highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline gui=underline guifg=Orange
" :highlight clear SpellCap
" :highlight SpellCap term=underline cterm=underline gui=underline guifg=Orange
" :highlight clear SpellRare
" :highlight SpellRare term=underline cterm=underline gui=underline guifg=Orange
" :highlight clear SpellLocal
" :highlight SpellLocal term=underline cterm=underline gui=underline guifg=Orange

" search for version control markers
map <Leader>d /^\(<<<<<<<\\|=======\\|>>>>>>>\)

" no preview window in omnicomplte
set completeopt-=preview

" latex unicode input
let g:unicoder_cancel_normal = 1
let g:unicoder_cancel_insert = 1
let g:unicoder_cancel_visual = 1
nnoremap <C-l> :call unicoder#start(0)<CR>
inoremap <C-l> <Esc>:call unicoder#start(1)<CR>
vnoremap <C-l> :<C-u>call unicoder#selection()<CR>

" vimtex stuff
let g:vimtex_quickfix_mode = 2
let g:vimtex_indent_enabled = 1
let g:vimtex_indent_on_ampersands = 0
let g:vimtex_motion_matchparen = 0
let g:vimtex_indent_delims = {
          \ 'open' : ['{'],
          \ 'close' : ['}'],
          \ 'close_indented' : 0,
          \ 'include_modified_math' : 0,
          \}

" Quickfix for neovim < 0.2.0, see https://github.com/lervag/vimtex/issues/750
if has('nvim')
    let g:vimtex_quickfix_latexlog = {'fix_paths':0}
endif

" vimtex platform specific stuff
if has("mac")
    let g:vimtex_view_method = 'skim'
elseif has("unix")
    let g:vimtex_view_general_viewer = 'okular'
    let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
    let g:vimtex_view_general_options_latexmk = '--unique'
endif

" make .tex file latex by default
let g:tex_flavor = "latex"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <Leader>a <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <Leader>a <Plug>(EasyAlign)

" Disable folding in markdown
let g:vim_markdown_folding_disabled=1

" enable powerline fonts
let g:airline_powerline_fonts = 1

" Increase threshold for diff signs left
let g:gitgutter_max_signs = 2000

" Rust stuff
set hidden
let g:racer_cmd = $HOME."/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let $RUST_SRC_PATH = $HOME."/tmp/rust/src"

" You Complete Me config
nnoremap <leader>jd :YcmCompleter GoTo<CR>
let g:ycm_filetype_blacklist = {
      \ 'tex': 1,
      \}

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

nmap <Leader>ha <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)
nmap <Leader>hv <Plug>(GitGutterPreviewHunk)

let vim_markdown_preview_github=1
