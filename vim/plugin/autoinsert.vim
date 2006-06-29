if has("autocmd")
augroup autoinsert
  au!
  autocmd BufNewFile *.c call s:Template("c")
  autocmd BufNewFile *.h call s:Template("h")
  autocmd BufNewFile *.hpp,*.hh,*.hxx call s:Template("hpp")
  autocmd BufNewFile *.cpp,*.cc,*.cxx call s:Template("cpp")
  autocmd BufNewFile *.tex call s:Template("tex")
  autocmd BufNewFile *-brief.tex call s:Template("tex-dinbrief")
  autocmd BufNewFile *.java call s:Template("java")
  autocmd BufNewFile *.pl call s:Template("pl")
  autocmd BufNewFile *.pm call s:Template("pm")
  autocmd BufNewFile *.pike call s:Template("pike")
  autocmd BufNewFile *.html call s:Template("html")
  autocmd BufNewFile Makefile call s:Template("make")
  autocmd BufNewFile makefile call s:Template("make-simple")
  autocmd BufNewFile *.cs call s:Template("cs")
  autocmd BufNewFile *.sql call s:Template("sql")
  autocmd BufNewFile *.plsql call s:Template("plsql")
  autocmd BufNewFile *.lua call s:Template("lua")
  autocmd BufNewFile *.m call s:Template("objc")
  autocmd BufNewFile *.mm call s:Template("objcpp")
augroup END
endif

function s:Template(argument)
	if (a:argument == "help")
		echo "Currently availible templates:"
		echo " c		- Plain C Template"
		echo " c-getopt		- Plain C Template (with getopt example)"
		echo " c-linux		- Plain C Template (Linux CodingStyle)"
		echo " c-linux-kmod	- Plain C Template (Linux CodingStyle, kernel module)"
		echo " h		- Header File for C"
		echo " h-linux		- Header File for C (Linux CodingStyle)"
		echo " cpp		- C++ Template"
		echo " cpp-getopt	- C++ Template (with getopt example)"
		echo " cpp-class	- C++ Class Template"
		echo " hpp		- Header File for C++"
		echo " tex		- LaTeX Template"
		echo " tex-dinbrief	- LaTeX Letter (german) Template"
		echo " java		- Java Template"
		echo " pl		- Perl Template"
		echo " pm		- Perl Module Template"
		echo " pike		- Pike Template"
		echo " html		- HTML Template"
		echo " make		- Makefile Template"
		echo " make-simple	- Simple Variant of the Makefile Template"
		echo " cs		- C# Template"
		echo " sql 		- SQL Template"
		echo " plsql		- PLPGSQL Template"
		echo " lua		- Lua Template"
		echo " ojbc		- Objective C Template"
		echo " objcpp		- Objective C++ Template"
	else
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
		elseif (a:argument == "c-getopt")
			0r ~/.vim/skeletons/template.c_getopt
			set ft=c
		elseif (a:argument == "c-linux")
			0r ~/.vim/skeletons/template.c_linux
			set ft=c
		elseif (a:argument == "c-linux-kmod")
			0r ~/.vim/skeletons/template.c_linux_kmod
			set ft=c
		elseif (a:argument == "h")
			0r ~/.vim/skeletons/template.h
			set ft=c
		elseif (a:argument == "h-linux")
			0r ~/.vim/skeletons/template.h_linux
			set ft=c

		" Stuff for C++
		elseif (a:argument == "hpp")
			0r ~/.vim/skeletons/template.hpp
			set ft=cpp
		elseif (a:argument == "cpp")
			0r ~/.vim/skeletons/template.cpp
			set ft=cpp
		elseif (a:argument == "cpp-getopt")
			0r ~/.vim/skeletons/template.cpp_getopt
			set ft=cpp
		elseif (a:argument == "cpp-class")
			0r ~/.vim/skeletons/template.cpp_class
			set ft=cpp
		
		" My LaTeX Templates
		elseif (a:argument == "tex")
			0r ~/.vim/skeletons/template.tex
			set ft=latex
		elseif (a:argument == "tex-dinbrief")
			0r ~/.vim/skeletons/template.tex_dinbrief
			set ft=latex
		
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

		" C# Template
		elseif (a:argument == "cs")
			0r ~/.vim/skeletons/template.cs
			set ft=cs

		" SQL Template
		elseif (a:argument == "sql")
			0r ~/.vim/skeletons/template.sql
			set ft=sql

		" PL-SQL Template
		elseif (a:argument == "plsql")
			0r ~/.vim/skeletons/template.plsql
			set ft=plsql

		" LUA Template (http://www.lua.org)
		elseif (a:argument == "lua")
			0r ~/.vim/skeletons/template.lua
			set ft=lua

		" Objective C Template
		elseif (a:argument == "objc")
			0r ~/.vim/skeletons/template.m
			set ft=objc

		" Objective C++ Template
		elseif (a:argument == "objcpp")
			0r ~/.vim/skeletons/template.mm
			set ft=objcpp
		
		endif
		
		silent %!~/.vim/do_header %
	endif
endfunction

command! -nargs=1 Template call s:Template(<f-args>)
