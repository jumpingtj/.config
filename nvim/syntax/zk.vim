scriptencoding utf-8

if exists("b:current_syntax")
  finish
endif

syntax clear

syntax region zkItalic  start="*"    end="*"
syntax match zkHeading /^#\s.*$/

highlight default link zkItalic Italic
highlight default link zkHeading @markup.heading

let b:current_syntax = "zk"
