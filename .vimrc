set nobackup
set noswapfile

set number
autocmd ColorScheme * highlight LineNr ctermfg=gray

set showmatch
set cindent
set virtualedit=onemore	" 行末まで移動可能
syntax on
colorscheme elflord

set hlsearch		" 検索文字をハイライト
set incsearch		" 検索ワードの最初の文字を入力した時点で検索を開始

set mouse=a

set hidden		"バッファ切り替えの時にファイルを保存しなくてもよい"

"バッファ切り替えのキーバインド"
nnoremap <silent>bp :bprevious<CR>
nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bb :b#<CR>

"括弧の補完"
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

function! IndentBraces()
	let nowletter = getline(".")[col(".")-1]	" 今いるカーソルの位置
	let beforeletter = getline(".")[col(".")-2]	" １つ前の文字
	
	if nowletter == "}" && beforeletter == "{"
		return "\n\t\n\<up>\<RIGHT>"
	else
		return "\n"
	endif
endfunction

inoremap <silent> <expr> <CR> IndentBraces()
