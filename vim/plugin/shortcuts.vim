" auf dem deutschen keyboard ist strg-] etwas schwer zu erreichen drum benutze
" ich strg-c
nmap  <C-C> <C-]>

" ein paar shortcuts für latex files, f9 'compiliert' den file und f10 öffnet
" selbigen in tkdvi.
augroup latex
	au!
	au FileType tex map <F7> :w<CR>: :call BibTex()<CR>
	au FileType tex map <F8> :w<CR>:!pdflatex '%'<CR>
	au FileType tex map <F9> :w<CR>:!latex '%'<CR>
	au FileType tex map <F10> :w<CR> :call Xdvi()<CR>
	au FileType tex map <F11> :w<CR> :call Xpdf()<CR>
augroup END

" ein paar shortcuts für java, f9 compiliert den file und f10 führt den
" aktuellen file aus (die class-datei davon)
augroup java
	au!
	au FileType java map <F9> :w<CR>:!javac '%'<CR>
	au FileType java map <F10> :w<CR>:call Java()<CR>
augroup END

" ein paar einstellungen für den 'functions' file den exuberant-ctags
" generieren kann. (siehe beligegendes Makefile)
au BufRead functions nmap <buffer> <CR> 0ye<C-W>w:tag <C-R>"<CR>
au BufRead functions setl ts=99

" eine funktion für Xdvi
function Xdvi()
	call CommandRun("xdvi",".dvi")
endfunction

" eine funktion für Xpdf
function Xpdf()
	call CommandRun("xpdf",".pdf")
endfunction

" eine funktion für die java vm
function Java()
	call CommandRun("java","")
endfunction

" eine funktion für bibtex
function BibTex()
	call CommandRun("bibtex","")
endfunction

" ruft das programm das im ersten parameter steht mit dem aktuellen file auf,
" allerdings wird die dateierweiterung durch das was in extension steht
" ersetzt.
function CommandRun(command, extension)
	let file = substitute(expand("%"),'\..*',a:extension,"")
	let output = system(a:command." ".file)
	echo output
endfunction

" EOF	vim: tw=78 ts=8 sw=4 sts=4 noet ai
