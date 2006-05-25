if has("autocmd")
augroup autoinsert
  au!
  autocmd BufNewFile *.c call s:Template("c")
  autocmd BufNewFile *.h call s:Template("h")
  autocmd BufNewFile *.hh call s:Template("hh")
  autocmd BufNewFile *.cpp,*.cc,*.cxx call s:Template("cpp")
  autocmd BufNewFile *.tex call s:Template("tex")
  autocmd BufNewFile *-brief.tex call s:Template("tex-brief")
  autocmd BufNewFile *.java call s:Template("java"
  autocmd BufNewFile *.pl call s:Template("pl")
  autocmd BufNewFile *.pm call s:Template("pm")
  autocmd BufNewFile *.pike call s:Template("pike")
  autocmd BufNewFile *.html call s:Template("html")
  autocmd BufNewFile Makefile call s:Template("make")
  autocmd BufNewFile makefile call s:Template("make-simple")
augroup END
endif

function s:Template(argument)
	" First delete all in the current buffer
	%d

	" The Makefile variants
	if (a:argument == "make")
		0r ~/.vim/skeletons/template.make
		set ft=make
	elseif (a:argument == "make-simple")
		0r ~/.vim/skeletons/template.make_simple
		set ft=make

	" Stuff for plain C
	elseif (a:argument == "c")
		0r ~/.vim/skeletons/template.c
		set ft=c
	elseif (a:argument == "h")
		0r ~/.vim/skeletons/template.h
		set ft=c

	" Stuff for C++
	elseif (a:argument == "hh")
		0r ~/.vim/skeletons/template.hh
		set ft=cpp
	elseif (a:argument == "cpp")
		0r ~/.vim/skeletons/template.cpp
		set ft=cpp
	elseif (a:argument == "cpp-class")
		0r ~/.vim/skeletons/template.cpp_class
		set ft=cpp
	
	" My LaTeX Templates
	elseif (a:argument == "tex")
		0r ~/.vim/skeletons/template.tex
		set ft=latex
	elseif (a:argument == "tex-brief")
		0r ~/.vim/skeletons/template-brief.tex
		set ft=
	
	" A Java Template
	elseif (a:argument == "java")
		0r ~/.vim/skeletons/template.java
		set ft=java

	" Perl Templates
	elseif (a:argument == "pl")
		0r ~/.vim/skeletons/template.pl
		set ft=perl
	elseif (a:argument == "pm")
		0r ~/.vim/skeletons/template.pm
		set ft=perl

	" Pike Templates
	elseif (a:argument == "pike")
		0r ~/.vim/skeletons/template.pike
		set ft=pike

	" HTML Templates
	elseif (a:argument == "html")
		0r ~/.vim/skeletons/template.html
		set ft=html

	endif
	
	silent %!~/.vim/do_header %
endfunction

command! -nargs=1 Template call s:Template(<f-args>)
