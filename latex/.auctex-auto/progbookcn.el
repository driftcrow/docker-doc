(TeX-add-style-hook
 "progbookcn"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ctexbook" "a4paper" "twoside" "zihao=-4")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("titlesec" "clearempty") ("tcolorbox" "many")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "ctexbook"
    "ctexbook10"
    "xunicode"
    "color"
    "xcolor"
    "hyperref"
    "graphicx"
    "graphbox"
    "wrapfig"
    "geometry"
    "fontspec"
    "titlesec"
    "zhnumber"
    "fancyhdr"
    "listings"
    "verbatim"
    "caption"
    "tcolorbox"
    "fontawesome"
    "indentfirst")
   (TeX-add-symbols
    "fzss"
    "fzxbs"
    "fzhei"
    "fzkai"
    "fzfs"
    "fzzdx"
    "HUGE"
    "footrule"
    "maketitle")
   (LaTeX-add-xcolor-definecolors
    "codecolorkeywords"
    "codecolorcomments"
    "codecolorxmlcomments"
    "codecolorstrings"
    "codecolortypes")
   (LaTeX-add-listings-lstdefinestyles
    "mystyle"
    "shellstyle")
   (LaTeX-add-tcolorbox-newtcolorboxes
    '("titledbox" "1" "" "")
    '("information" "" "" "")
    '("keypoint" "" "" "")
    '("exclamation" "" "" "")
    '("question" "" "" ""))
   (LaTeX-add-caption-DeclareCaptions
    '("\\DeclareCaptionFormat{codecaptionformat}" "Format" "codecaptionformat")))
 :latex)

