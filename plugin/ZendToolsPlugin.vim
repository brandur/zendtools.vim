" ZendTools: Various useful functions for working in PHP with Zend.
"   Author:	 Brandur Leach <brandur@mutelight.org>
"   Date:    Apr 06, 2011

" This file contains the public interface for the plugin. It's always loaded 
" when Vim starts, but only makes reference to the actual implementations of
" its functions. When those implementations are needed, Vim will find them in 
" the `autoload` directory.

" ----------------------------------------------------------------------------
" Load Once: {{{1

if &cp || exists("g:loaded_ZendToolsPlugin")
  finish
endif
let g:loaded_ZendToolsPlugin = "v1"
let s:keepcpo                = &cpo
set cpo&vim

" ----------------------------------------------------------------------------
" Public Interface: {{{1

if !hasmapto('<Plug>PrependClassRequireOnce')
  map <unique> <Leader>zo <Plug>PrependClassRequireOnce
endif

map <silent> <unique> <script> <Plug>PrependClassRequireOnce 
  \ :set lz<CR>:call ZendTools#PrependClassRequireOnce()<CR>:set nolz<CR>

" ----------------------------------------------------------------------------
"  Restore: {{{1

let &cpo= s:keepcpo
unlet s:keepcpo
