(TeX-add-style-hook
 "elegantnote"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("book" "12pt" "a4paper" "openany")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("titlesec" "center" "pagestyles") ("fontspec" "no-math" "cm-default")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "color"
    "xcolor"
    "times"
    "mtpro2"
    "book"
    "bk12"
    "graphicx"
    "enumerate"
    "amsmath"
    "mathrsfs"
    "amsfonts"
    "booktabs"
    "hyperref"
    "geometry"
    "wallpaper"
    "titlesec"
    "fontenc"
    "fontspec"
    "xunicode"
    "xltxtra"
    "xeCJK"
    "environ"
    "tikz"
    "pifont"
    "manfnt"
    "fancyhdr"
    "lastpage")
   (TeX-add-symbols
    '("cover" 1)
    '("logo" 1)
    '("myquote" 1)
    '("base" 1)
    "CJKsetfontspace"
    "Eindent"
    "Enoindent"
    "maketitle")
   (LaTeX-add-environments
    '("newdef" LaTeX-env-args ["argument"] 0)
    '("newprop" LaTeX-env-args ["argument"] 0)
    '("newcorol" LaTeX-env-args ["argument"] 0)
    '("newlemma" LaTeX-env-args ["argument"] 0)
    '("newthem" LaTeX-env-args ["argument"] 0)
    "note"
    "example"
    "assumption"
    "conclusion"
    "newproof")
   (LaTeX-add-counters
    "Newthem"
    "Newlemma"
    "Newcorol"
    "Newprop"
    "Newdefinition")
   (LaTeX-add-xcolor-definecolors
    "main"
    "seco"
    "thid"
    "bule"
    "bablue"))
 :latex)

