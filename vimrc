" This is a small fix for some xterms
if &term =~ "xterm-debian" || &term =~ "xterm"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif


" globaler kram
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing
set autoindent		" always set autoindenting on
set textwidth=0		" Don't wrap lines by default 
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search


" sicherstellen das syntax highlighting an ist
syntax on

" plugins und automatisches indentieren (cindent, etc) anschalten
filetype plugin indent on

autocmd FileType zsh call SetFtForZsh()

" html commands
autocmd FileType html source ~/.vim/macros/htmlcmd.vim

" vim's cindent nach gnu-coding-style einstellen (genau wie das programm
" 'indent')
autocmd FileType c set cindent tabstop=8 shiftwidth=2 cinoptions={1s,>2s,^-1s,n-1s
autocmd FileType cpp set cindent tabstop=8 shiftwidth=2 cinoptions={1s,>2s,^-1s,n-1s

" maus einschalten, funktioniert nur bei TERM=xterm
set mouse=a

" das automatische wrappen (umbrechen) abschalten
set nowrap

" modelines anschalten, nun kann man ala:
" vim:set ts=8:
" vim 'set' befehle direkt in die jeweilige datei schreiben.
set ml
set modelines=8

set bg=dark

" eine sch�ne farbe ausw�hlen
colors dreamind

" einen sch�nen font (mit euro zeichen)  f�r gvim (oder :gui) ausw�hlen
set guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-140-*-*-m-*-iso8859-15

" europ�isches encoding einschalten
set encoding=iso-8859-15

" automatisches generieren eines html files entsprechend vim's syntax
" highlighting und farben. einfach 2html im kommandomodus eingeben (ohne :)
nmap 2html :runtime! syntax/2html.vim<CR>

" den eingegebenen befehl anzeigen
set showcmd

" sicherstellen das mouse=a auch bei rxvt funktiniert
if &term == "rxvt"
set term=xterm
endif

fun! Switch_list()
if &list
	set nolist
else
	set list
endif
endfunction

fun! SetFtForZsh()
if &indentexpr != "GetShIndent()"
	set ft=sh
	set ft=zsh
endif
endfunction


set nolist
set listchars=tab:��,trail:�
map <F4> :call Switch_list()<cr>

map <F5> :set nonu<cr>
