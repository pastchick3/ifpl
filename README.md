# [Simon L. Peyton Jones] The Implementation of Functional Programming Languages

``` ebnf
<prog> ::= <def>+
<def> ::= <data> | <func>
<data> ::= "data" <Var> "=" <Var> <Var>* ("|" <Var> <Var>*)*
<func> ::= <var> <pat>* (("|" <expr>)? "=" <expr>)+

<Var> ::= <upper> (<upper> | <lower> | <digit>)*
<var> ::= <lower> (<upper> | <lower> | <digit>)*
<pat> ::= <var> | <int> | <float> | <str> | <Var> <pat>* | "_"

<expr> :== <or-expr>
    | "(" <expr> ")"
    | "let" (<pat> = <expr>)+ "in" <expr>
    | "case" <expr> "of" (<pat>+ (("|" <expr>)? "->" <expr>)+)+
<or-expr> ::= <and-expr>
    | <or-expr> "||" <and-expr>
<and-expr> ::= <eq-expr>
    | <and-expr> "&&" <eq-expr>
<eq-expr> ::= <rel-expr>
    | <eq-expr> "==" <rel-expr>
    | <eq-expr> "/=" <rel-expr>
<rel-expr> ::= <add-expr>
    | <rel-expr> "<" <add-expr>
    | <rel-expr> ">" <add-expr>
    | <rel-expr> "<=" <add-expr>
    | <rel-expr> ">=" <add-expr>
<add-expr> ::= <mul-expr>
    | <add-expr> "+" <mul-expr>
    | <add-expr> "-" <mul-expr>
<mul-expr> ::= <pre-expr>
    | <mul-expr> "*" <pre-expr>
    | <mul-expr> "/" <pre-expr>
<pre-expr> ::= <app-expr>
    | ["-" | "!"] <app-expr>
<app-expr> ::= <prim-expr>
    | <prim-expr> <prim-expr>
<prim-expr> ::= <var> | <int> | <float> | <str> | <Var> <expr>*
    | "[" "]" | "[" <expr> ("," <expr>)* "]"
    | "(" <expr> "," <expr> ("," <expr>)* ")"

<int> ::= ["+" | "-"] <digit>+
<float> ::= ["+" | "-"] <digit>+ "." <digit>+
<str> ::= "\"" (<upper> | <lower> | <digit> | " ")* "\""

<upper> ::= "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J"
    | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U"
    | "V" | "W" | "X" | "Y" | "Z"
<lower> ::= "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j"
    | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" | "t" | "u"
    | "v" | "w" | "x" | "y" | "z"
<digit> ::= "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
```
