vim.cmd([[
  if exists("b:current_syntax")
    finish
  endif
  
  " Shebang line.
  syntax match amberShebang "\v^#!.+$"
  highlight link amberShebang Special
  
  " Compiler flags.
  syntax match amberFlags "\v#\[.+\]"
  highlight link amberFlags Special
  
  " Keywords.
  syntax keyword amberKeyword and
  syntax keyword amberKeyword as
  syntax keyword amberKeyword break
  syntax keyword amberKeyword cd
  syntax keyword amberKeyword const
  syntax keyword amberKeyword continue
  syntax keyword amberKeyword echo
  syntax keyword amberKeyword else
  syntax keyword amberKeyword exit
  syntax keyword amberKeyword exited
  syntax keyword amberKeyword fail
  syntax keyword amberKeyword failed
  syntax keyword amberKeyword for
  syntax keyword amberKeyword from
  syntax keyword amberKeyword fun
  syntax keyword amberKeyword if
  syntax keyword amberKeyword import
  syntax keyword amberKeyword in
  syntax keyword amberKeyword is
  syntax keyword amberKeyword len
  syntax keyword amberKeyword let
  syntax keyword amberKeyword lines
  syntax keyword amberKeyword loop
  syntax keyword amberKeyword main
  syntax keyword amberKeyword mv
  syntax keyword amberKeyword nameof
  syntax keyword amberKeyword not
  syntax keyword amberKeyword or
  syntax keyword amberKeyword pub
  syntax keyword amberKeyword ref
  syntax keyword amberKeyword return
  syntax keyword amberKeyword silent
  syntax keyword amberKeyword status
  syntax keyword amberKeyword succeeded
  syntax keyword amberKeyword sudo
  syntax keyword amberKeyword then
  syntax keyword amberKeyword trust
  syntax keyword amberKeyword unsafe
  syntax keyword amberKeyword while
  syntax match amberKeyword "\v\?"
  syntax match amberKeyword "\v__\w+"
  highlight link amberKeyword Keyword
  
  " Functions; use positive lookahead to match `glob` in `glob(`.
  syntax match amberFunction "\v\w+(\()@="
  highlight link amberFunction Function
  
  " Data types.
  syntax keyword amberType Bool
  syntax keyword amberType Int
  syntax keyword amberType Null
  syntax keyword amberType Num
  syntax keyword amberType Text
  syntax match amberType "\vBool\?"
  syntax match amberType "\vInt\?"
  syntax match amberType "\vNull\?"
  syntax match amberType "\vNum\?"
  syntax match amberType "\vText\?"
  syntax match amberType "\v\[Bool\]"
  syntax match amberType "\v\[Int\]"
  syntax match amberType "\v\[Null\]"
  syntax match amberType "\v\[Num\]"
  syntax match amberType "\v\[Text\]"
  syntax match amberType "\v\[Bool\]\?"
  syntax match amberType "\v\[Int\]\?"
  syntax match amberType "\v\[Null\]\?"
  syntax match amberType "\v\[Num\]\?"
  syntax match amberType "\v\[Text\]\?"
  highlight link amberType Type
  
  " Operators.
  syntax match amberOperator "\v\+"
  syntax match amberOperator "\v\-"
  syntax match amberOperator "\v\*"
  syntax match amberOperator "\v\/"
  syntax match amberOperator "\v\%"
  syntax match amberOperator "\v\="
  syntax match amberOperator "\v\+\="
  syntax match amberOperator "\v\-\="
  syntax match amberOperator "\v\*\="
  syntax match amberOperator "\v\/\="
  syntax match amberOperator "\v\%\="
  syntax match amberOperator "\v\+\+"
  syntax match amberOperator "\v\-\-"
  syntax match amberOperator "\v\=\="
  syntax match amberOperator "\v\!\="
  syntax match amberOperator "\v\<"
  syntax match amberOperator "\v\>"
  syntax match amberOperator "\v\<\="
  syntax match amberOperator "\v\>\="
  syntax match amberOperator "\v\.\."
  syntax match amberOperator "\v\-\-\="
  syntax keyword amberOperator and
  syntax keyword amberOperator or
  syntax keyword amberOperator not
  highlight link amberOperator Operator
  
  " Integers, decimals and booleans (must be defined after the operators,
  " so the syntax match for negative number `-42` takes precedence over
  " the one for subtraction operator `-`).
  syntax match amberNumber "\v\d+"
  syntax match amberNumber "\v\d+\.\d+"
  syntax match amberNumber "\v\-\d+"
  syntax match amberNumber "\v\-\d+\.\d+"
  syntax keyword amberNumber true
  syntax keyword amberNumber false
  syntax keyword amberNumber null
  highlight link amberNumber Number
  
  " Strings and commands, with interpolation.
  syntax region amberInterp start=/\v\{/ end=/\v\}/ contained
  syntax region amberString start=/\v"/ skip=/\v\\"/ end=/\v"/ contains=amberInterp keepend
  syntax region amberCommand start=/\v\$/ skip=/\v\\\$/ end=/\v\$/ contains=amberInterp keepend
  highlight link amberString String
  highlight link amberCommand Special
  
  " Inline and documentation comments.
  syntax match amberComment "\v//.*$"
  highlight link amberComment Comment
  
  let b:current_syntax = "amber"
]])
