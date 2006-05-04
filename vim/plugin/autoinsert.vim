if has("autocmd")
augroup autoinsert
  au!
  autocmd BufNewFile *.c 0r ~/.vim/skeletons/template.c
  autocmd BufNewFile *.h 0r ~/.vim/skeletons/template.h
  autocmd BufNewFile *.hh 0r ~/.vim/skeletons/template.hh
  autocmd BufNewFile *.cpp,*.cc,*.cxx 0r ~/.vim/skeletons/template.cpp
  autocmd BufNewFile *.tex 0r ~/.vim/skeletons/template.tex
  autocmd BufNewFile *-brief.tex %delete
  autocmd BufNewFile *-brief.tex 0r ~/.vim/skeletons/template-brief.tex
  autocmd BufNewFile *.java 0r ~/.vim/skeletons/template.java
  autocmd BufNewFile *.pl 0r ~/.vim/skeletons/template.pl
  autocmd BufNewFile *.pm 0r ~/.vim/skeletons/template.pm
  autocmd BufNewFile *.pike 0r ~/.vim/skeletons/template.pike
  autocmd BufNewFile *.html 0r ~/.vim/skeletons/template.html
  autocmd BufNewFile Makefile 0r ~/.vim/skeletons/template.make
  autocmd BufNewFile makefile 0r ~/.vim/skeletons/template.make_simple
  autocmd BufNewFile *.cs 0r ~/.vim/skeletons/template.cs
  autocmd BufNewFile *.sql 0r ~/.vim/skeletons/template.sql
  autocmd BufNewFile *.plsql 0r ~/.vim/skeletons/template.plsql
  autocmd BufNewFile *.lua 0r ~/.vim/skeletons/template.lua
  autocmd BufNewFile *.m 0r ~/.vim/skeletons/template.m
  autocmd BufNewFile *.mm 0r ~/.vim/skeletons/template.mm
  autocmd BufNewFile * silent %!~/.vim/do_header %
augroup END
endif
