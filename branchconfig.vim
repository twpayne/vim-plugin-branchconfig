" Vim global plugin for loading directory-specific configuration files
" Last Change:  2014 Mar 23
" Maintainer:   Tom Payne <vim@tompayne.org>
" License:      This file is placed in the public domain.

if exists("loaded_branchconfig")
	finish
endif
let loaded_branchconfig = 1

let s:dir = getcwd()
while stridx(s:dir, $HOME) != -1
	let s:fn = s:dir . "/vimrc"
	if filereadable(s:fn)
		execute "source " . s:fn
		break
	endif
	let s:dir = strpart(s:dir, 0, strridx(s:dir, "/"))
endwhile
