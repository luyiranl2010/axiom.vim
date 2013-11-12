"Vim syntax file
"
" Language   : Axiom
" Maintainer : Fabio Stumbo <f.stumbo@unife.it>
" File type  : *.input (see :help filetype)
" Usage      : See the README file
"
" History
"  20131112 fabio   1.2 Added strict magic control in regexps
"			Added syntax for system commands
"  			Added instructions to create owns 
"			[categories|commands|domains|packages|operations].vim
"  20131111 fabio   1.1 Clean up; redefined hilights as keyword instead
"			that match when possible
"  20131109 fabio   1.0 Added support for pamphlet files and made some
"			cleaning
"  20051116 fabio   0.9 Made some improvements
"  20040107 fabio   0.1 Creation 
"
" Comments, suggestions and remarks are welcome.
"
" The latest version of this file will always be available at
" http://www.vim.org
" 
" for another syntax file for axiom see:
" http://axiom-wiki.newsynthesis.org/AxiomInVim

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
"if version < 600
"  syntax clear
"elseif exists("b:current_syntax")
"  finish
"endif



if version < 600
  set iskeyword=48-57,_,a-z,A-Z,&,!,?
else
  setlocal iskeyword=48-57,_,a-z,A-Z,&,!,?
endif


syn match axComma	"\v[,;]"

" parenthesis/curly/brace sanity checker
syn region axZone	matchgroup=Delimiter start="\V("  end="\V)" transparent contains=ALLBUT,axError,axErrorBrace,axErrorCurly
syn region axZone	matchgroup=Delimiter start="\V{"  end="\V}" transparent contains=ALLBUT,axError,axErrorBrace,axErrorParen
syn region axZone	matchgroup=Delimiter start="\V[" end="\V]" transparent contains=ALLBUT,axError,axErrorCurly,axErrorParen
syn match axError	"\v[)\]}]"
syn match axErrorBrace	"\v[)}]"	contained
syn match axErrorCurly	"\v[)\]]"	contained
syn match axErrorParen	"\v[\]}]"	contained
"syn match axErrorSemi	"\V;"    contained

" builtin categories, domains, packages and operations
" choose which words you want to be highlighted
source $HOME/.vim/syntax/axiom/categories.vim  
source $HOME/.vim/syntax/axiom/domains.vim
source $HOME/.vim/syntax/axiom/packages.vim
source $HOME/.vim/syntax/axiom/operations.vim
source $HOME/.vim/syntax/axiom/commands.vim  

" Builtin constants 
syn match axMacro "\V%e"
syn match axMacro "\V%i"
syn match axMacro "\V%infinity"
syn match axMacro "\V%minusInfinity"
syn match axMacro "\V%pi"
syn match axMacro "\V%plusInfinity"
syn match axMacro "\VSF"

" Statements
syn keyword axCond	for while if 
syn keyword axCondCtrl 	then elif else elseif repeat by in
syn match   axRange 	"\V.."
syn keyword axExit	iterate break return error 
syn match   axExit 	"\V=>"
syn keyword axOutput	print 
syn keyword axOutput	output 
syn match   axAssign	"\V:"  
syn match   axAssign	"\V:="  
syn match   axCall	"\V::"  
syn match   axCall	"\V@"  
syn match   axCall	"\V$"  
syn match   axDefProc	"\V->"  
syn match   axDefProc	"\V+->"  
syn match   axDefProc	"\V==" 
syn match   axDefProc	"\V==>" 

" Comments and tools.
syn region axComment	start="\V++" end="\v$" 	oneline
syn region axComment	start="\V--" end="\v$" 	oneline
syn region axString	start=+\V"+  end=+\V"+	oneline

" Definition of colors
" It would be better to use standard highlight groups... 
" so maybe this section will change/disappear in the future...
" Meanwhile, redefine them to your taste
" IMO, these colors are nice with a black bg. If you need to change the
" bg color, just add "ctermbg=x" to every line, where x is the number
" of the color: 
" 0=black, 1=red, 2=green, 3=yellow, 4=blue, 5=magenta, 6=cyan, 7=white
hi lightblack 		ctermfg=0 cterm=bold term=bold guifg=black
hi lightred 		ctermfg=1 cterm=bold term=bold guifg=lightred 
hi lightgreen 		ctermfg=2 cterm=bold term=bold guifg=lightgreen
hi lightyellow 		ctermfg=3 cterm=bold term=bold guifg=lightyellow 
hi lightblue 		ctermfg=4 cterm=bold term=bold guifg=lightblue
hi lightmagenta 	ctermfg=5 cterm=bold term=bold guifg=lightmagenta 
hi lightcyan 		ctermfg=6 cterm=bold term=bold guifg=lightcyan 
hi lightwhite 		ctermfg=7 cterm=bold term=bold guifg=white 
hi black		ctermfg=0 guifg=black
hi red 			ctermfg=1 guifg=red 
hi green 		ctermfg=2 guifg=green
hi yellow 		ctermfg=3 guifg=yellow 
hi blue 		ctermfg=4 guifg=blue
hi magenta		ctermfg=5 guifg=magenta 
hi cyan 		ctermfg=6 guifg=cyan 
hi white 		ctermfg=7 guifg=white 
hi magentainv 		ctermbg=5 ctermfg=0 guibg=magenta guifg=black
hi redinv 		ctermbg=1 ctermfg=7 guibg=red guifg=white
hi yellowinv 		ctermbg=3 ctermfg=7 cterm=bold term=bold guibg=yellow guifg=white

" Define the default highlighting (type :highlight to see available classes).
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet

if version >= 508 || !exists("did_axiom_syntax_inits")
  if version < 508
    let did_axiom_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

" Choose here your favourite colors for the respective fields

	HiLink	axAssign	lightcyan
	HiLink	axCall 		lightcyan
	HiLink	axChunk 	lightmagenta
	HiLink	axComma 	lightred
	HiLink	axCommand 	magenta
	HiLink	axComment	cyan
	HiLink	axCond		lightgreen
	HiLink	axCondCtrl	green
	HiLink	axDefProc	lightcyan
	HiLink	axError		redinv
	HiLink	axErrorBrace	redinv
	HiLink	axErrorCurly	redinv
	HiLink	axErrorParen	redinv
	HiLink	axErrorSemi	redinv
	HiLink	axExit 		lightblue
	HiLink	axMacro		yellow
	HiLink	axOutput	lightblue
	HiLink	axRange 	green
	HiLink	axString	blue

	HiLink	axCategory	yellow
	HiLink	axDomain	yellow
	HiLink	axOperation	lightyellow
	HiLink	axPackage	yellow
delcommand HiLink
endif

let b:current_syntax = "axiom"

