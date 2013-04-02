set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

set softtabstop=2
set expandtab
set tabstop=2
set shiftwidth=2

set list
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

if has("syntax")
  syntax on

  " PODバグ対策
  syn sync fromstart

  function! ActivateInvisibleIndicator()
    " 下の行の"　"は全角スペース
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
    "syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
    "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
    "syntax match InvisibleTab "\t" display containedin=ALL
    "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
  endfunction

  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'

NeoBundle 'tpope/vim-endwise.git'
NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/dbext.vim'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet.git'
NeoBundle 'taichouchou2/vim-rsense'

NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'taichouchou2/surround.vim'

NeoBundle 'taichouchou2/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'

NeoBundle 'thinca/vim-ref'
NeoBundle 'taichouchou2/vim-ref-ri'
NeoBundle 'tag/vim-rspec'

NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
""NeoBundle 'http://bitbucket.org/kovisoft/slimv'

"Rsense
let g:rsenseUseOmniFunc = 1
let g:rsenseHome = expand('~/.vim/ref/rsense-0.3')

function! SetUpRubySetting()
	setlocal completefunc=RSenseCompleteFunction
	nmap <buffer>tj :RSenseJumpToDefinition<CR>
	nmap <buffer>tk :RSenseWhereIs<CR>
	nmap <buffer>td :RSenseTypeHelp<CR>
endfunction

autocmd FileType ruby,eruby,ruby.rspec call SetUpRubySetting()

filetype plugin indent on
filetype indent on
syntax on

set number
