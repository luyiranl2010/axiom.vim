"Vim syntax file
"
" Language   : Axiom
" Maintainer : Fabio Stumbo <f.stumbo@unife.it>
" File type  : *.input (see :help filetype)
" Usage      : See the README file
"
" History
"  20131113 fabio   2.0 Colors are defined in term of standard classes
"			customization is possible sourcing and changing
"			axiom/colors.vim
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
" For another syntax file for axiom see:
" http://axiom-wiki.newsynthesis.org/AxiomInVim

if version < 600
  set iskeyword=48-57,_,a-z,A-Z,&,!,?
else
  setlocal iskeyword=48-57,_,a-z,A-Z,&,!,?
endif

syn match axComma	"\v[,;]"

" Parenthesis/bracket sanity checker
syn region axZone	matchgroup=Delimiter start="\V("  end="\V)" transparent contains=ALLBUT,axError,axErrorParen
syn region axZone	matchgroup=Delimiter start="\V[" end="\V]" transparent contains=ALLBUT,axError,axErrorBrack
syn match axError	"\v[)\]]"
syn match axErrorBrack	"\v[\]]"	contained
syn match axErrorParen	"\v[)]"		contained
"syn match axErrorSemi	"\V;"    contained

" Builtin categories, domains, packages and operations
" Choose which words you want to be highlighted
source <sfile>:p:h/../axiom/categories.vim  
source <sfile>:p:h/../axiom/domains.vim
source <sfile>:p:h/../axiom/packages.vim
source <sfile>:p:h/../axiom/operations.vim
source <sfile>:p:h/../axiom/commands.vim  

" A couple of handy shortcuts 
syn match axCommand "\V)sys\m" 
syn match axCommand "\V)abbrev\m" 

" Builtin constants 
syn match axMacro "\V%e"
syn match axMacro "\V%i"
syn match axMacro "\V%infinity"
syn match axMacro "\V%minusInfinity"
syn match axMacro "\V%pi"
syn match axMacro "\V%plusInfinity"
syn match axMacro "\VSF"

" Statements
syn keyword axCond	if then elif else elseif
syn keyword axRepeat	for while repeat by in
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
syn match   axArg	"\V%"  
syn match   axDefProc	"\V->"  
syn match   axDefProc	"\V+->"  
syn match   axDefProc	"\V==" 
syn match   axDefProc	"\V==>" 

" Comments and tools.
syn region axComment	start="\V++" end="\v$" 	oneline
syn region axComment	start="\V--" end="\v$" 	oneline
syn region axString	start=+\V"+  end=+\V"+	oneline

" Define the default highlighting: Axiom keywords are defined in term of
" standard classes
hi link	axArg		Typedef		
hi link	axAssign	Define		
hi link	axCall 		Define		
hi link	axChunk 	SpecialComment	
hi link	axComma 	Label		
hi link	axComment	Comment		
hi link	axCond		Conditional	
hi link	axDefProc	Define		
hi link	axError		Error		
hi link	axErrorBrack	Error		
hi link	axErrorParen	Error		
hi link	axErrorSemi	Error		
hi link	axExit 		StorageClass	
hi link	axMacro		Macro		
hi link	axOutput	StorageClass	
hi link	axRange 	Repeat 		
hi link	axRepeat	Repeat		
hi link	axString	String		
                        
hi link	axCategory	Type		
hi link	axCommand 	Function	
hi link	axDomain	Type		
hi link	axOperation	Operator	
hi link	axPackage	Type		

" Definition of colors for standard classes are predefined in vim
" following the default or a personal color scheme.
" If you want to change them, edit the axiom/colors.vim change
" the definitions after your personal taste and uncomment the following
" line
"source $HOME/.vim/syntax/axiom/colors.vim

let b:current_syntax = "axiom"
