(TeX-add-style-hook
 "progartcn"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ctexart" "a4paper" "zihao=-4")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("xcolor" "dvipsnames") ("bookmark" "open" "openlevel=0" "atend") ("tcolorbox" "many")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimOut")
   (add-to-list 'LaTeX-verbatim-environments-local "SaveVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "ctexart"
    "ctexart10"
    "xunicode"
    "xcolor"
    "hyperref"
    "bookmark"
    "graphicx"
    "graphbox"
    "wrapfig"
    "geometry"
    "fontspec"
    "titlesec"
    "zhnumber"
    "tcolorbox"
    "fontawesome"
    "fancyvrb"
    "fancyhdr"
    "listings"
    "verbatim"
    "caption"
    "indentfirst")
   (TeX-add-symbols
    "fzss"
    "fzxbs"
    "fzhei"
    "fzkai"
    "fzfs"
    "fzzdx")
   (LaTeX-add-environments
    "shellBox"
    "invertedShellBox")
   (LaTeX-add-xcolor-definecolors
    "colorPrimary"
    "colorPrimaryBorder"
    "colorPrimaryBackground"
    "colorPrimaryText"
    "colorSecondary"
    "colorSecondaryBorder"
    "colorSecondaryBackground"
    "colorSecondaryText"
    "colorSuccess"
    "colorSuccessBorder"
    "colorSuccessBackground"
    "colorSuccessText"
    "colorInfo"
    "colorInfoBorder"
    "colorInfoBackground"
    "colorInfoText"
    "colorDanger"
    "colorDangerBorder"
    "colorDangerBackground"
    "colorDangerText"
    "colorWarning"
    "colorWarningBorder"
    "colorWarningBackground"
    "colorWarningText"
    "colorLight"
    "colorLightBorder"
    "colorLightBackground"
    "colorLightText"
    "colorDark"
    "colorDarkBorder"
    "colorDarkBackground"
    "colorDarkText")
   (LaTeX-add-listings-lstdefinestyles
    "mystyle"
    "bashInputStyle"
    "bashOutputStyle")
   (LaTeX-add-tcolorbox-newtcolorboxes
    '("titledBox" "1" "" "")
    '("noteBox" "" "" "")
    '("importantBox" "" "" "")
    '("tipBox" "" "" "")
    '("warningBox" "" "" ""))
   (LaTeX-add-caption-DeclareCaptions
    '("\\DeclareCaptionFormat{codecaptionformat}" "Format" "codecaptionformat")))
 :latex)

