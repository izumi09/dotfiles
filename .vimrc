set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
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
