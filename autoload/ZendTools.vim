" ZendTools: Various useful functions for working in PHP with Zend.
"   Author:	 Brandur Leach <brandur@mutelight.org>
"   Date:    Apr 06, 2011

" This file contains the implementations for the plugin's functions. It is not
" loaded when Vim starts, but rather the first time its functions are needed.

" ----------------------------------------------------------------------------
" Load Once: {{{1

if exists("g:loaded_ZendTools") || &cp
  finish
endif
let g:loaded_ZendTools = "v1"
let s:keepcpo          = &cpo
set cpo&vim

" ----------------------------------------------------------------------------
" Function Implementations: {{{1

fun! ZendTools#PrependClassRequireOnce()
  let word= substitute(expand('<cword>'), '_', '/', 'g')
  " Word should be a valid PHP class name. Conveniently, the PHP manual
  " provides a regex to match one.
  if word =~ '[a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*'
    let indent= substitute(getline('.'), '^\(\s*\).*$', '\1', '')
    call append(line('.') - 1, indent . "require_once '" . word . ".php';")
  endif
endfun

" ----------------------------------------------------------------------------
"  Restore: {{{1

let &cpo= s:keepcpo
unlet s:keepcpo
