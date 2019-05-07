(require 'package)
(package-initialize) ;; You might already have this line

(require 'org)
(require 'diff-mode)
(require 'ob-shell)
(require 'htmlize)

(setq make-backup-files nil)
(setq debug-on-error nil)
(setq org-html-validation-link nil)
(setq org-confirm-babel-evaluate nil)
(url-handler-mode 1)

;; (load-file "config.el")
;;(setq org-export-babel-evaluate nil)
;; (custom-set-variables
;;   '(org-publish-timestamp-directory
;;      (convert-standard-filename "public/.org-timestamps/")))
;; (setq postamble (with-temp-buffer
;;                   (insert-file-contents "html/postamble.html")
;;                   (buffer-string)))
;; (setq preamble (with-temp-buffer
;;                   (insert-file-contents "html/preamble.html")
;;                   (buffer-string)))
;; (setq header (with-temp-buffer
;;                   (insert-file-contents "html/header.html")
;;                (buffer-string)))

;; (defun my-publish-sitemap (title list)
;;   "Default site map, as a string.
;; TITLE is the the title of the site map.  LIST is an internal
;; representation for the files to include, as returned by
;; `org-list-to-lisp'.  PROJECT is the current project."
;;   (concat "#+TITLE:" config-blog-title "\n" "#+OPTIONS: toc:nil\n\n"
;;             (org-list-to-subtree
;;              (seq-filter
;;               (apply-partially
;;                (lambda (x) (not (string-match-p "theindex\.org" (format "%s" x) )))) list))))

;; (defun my-sitemap-format (entry style project)
;;   "Custom sitemap entry formatting"
;;   (if (not (directory-name-p entry))
;;     (format-spec config-entry-format `((?t . ,(org-publish-find-title entry project))
;;                  (?D . ,(format-time-string "<%Y-%m-%d %a>" (org-publish-find-date entry project)))
;;                  (?c . ,(org-publish-find-property entry :description project 'html))
;;                  (?l . ,(concat "file:" entry))
;;                  (?L . ,(replace-regexp-in-string "\.org" "\.html" entry))
;;                  ))
;;     "---"))

;; (defun set-org-publish-project-alist ()
;;   "Set publishing projects for Orgweb and Worg."
;;   (interactive)
;;   (setq org-publish-project-alist
;;     `(("blog-notes"
;;        ;; Directory for source files in org format
;;         :language "zh"
;;         :base-directory ,blog-path
;;         :base-extension "org"
;;         :html-doctype "html5"
;;         :html-head ,header
;;         :html-html5-fancy t
;;         :html-preamble ,preamble
;;         :html-postamble ,postamble
;;         ;; HTML directory
;;         :publishing-directory "public"
;;         :publishing-function org-html-publish-to-tufte-html
;;         :recursive t
;;         :headline-levels 4
;;         :with-sub-superscript nil
;;         :section-numbers nil
;;         :auto-preamble nil
;;         :auto-sitemap t
;;         :sitemap-style list
;;         :sitemap-sort-folders ignore
;;         :sitemap-sort-files anti-chronologically
;;         :sitemap-format-entry my-sitemap-format
;;         :sitemap-function my-publish-sitemap
;;         :sitemap-filename "index.org"
;;         :exclude "\!.*\.org"
;;         :sitemap-date-format ,config-date-format
;;         :makeindex t
;;         :html-head-include-default-style nil
;;         )

;;        ("blog-static"
;;          :base-directory ,blog-path
;;          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|svg\\|pdf\\|mp3\\|woff2\\|woff"
;;          :publishing-directory "public"
;;          :recursive t
;;          :publishing-function org-publish-attachment
;;          )
;;        ("assets"
;;          :base-directory ,assets-path
;;          :base-extension "css\\|js\\|png\\|jpg\\|gif\\|svg\\|pdf\\|mp3\\|woff2\\|woff\\|html\\|md\\|ico"
;;          :publishing-directory "public"
;;          :recursive t
;;          :publishing-function org-publish-attachment
;;          )
;;        ("rss"
;;          :base-directory ,blog-path
;;          :base-extension "org"
;;          :html-link-home ,config-base-url
;;          :html-link-use-abs-url t
;;          :rss-extension "xml"
;;          :publishing-directory "public"
;;          :publishing-function (org-rss-publish-to-rss)
;;          :section-numbers nil
;;          :exclude ".*"            ;; To exclude all files...
;;          :include ("index.org")   ;; ... except index.org.
;;          :table-of-contents nil)
;;        ("blog" :components ("blog-notes" "assets" "blog-static" "rss"))
;;        )))
;; (set-org-publish-project-alist)
(with-eval-after-load 'ox-latex (+org-private|init-latex))

(defun +org-private|init-latex ()
  (setq-default org-latex-prefer-user-labels t)

  (add-to-list 'org-latex-classes '("ctexart"
                                    "\\documentclass{ctexart}
                                        [NO-DEFAULT-PACKAGES]
                                        \\usepackage[utf8]{inputenc}
                                        \\usepackage[T1]{fontenc}
                                        \\usepackage{fixltx2e}
                                        \\usepackage[a4paper,hmargin=1.25in,vmargin=1in]{geometry}
                                        \\usepackage{graphicx}
                                        \\usepackage{longtable}
                                        \\usepackage{pdflscape}
                                        \\usepackage{float}
                                        \\usepackage{wrapfig}
                                        \\usepackage{rotating}
                                        \\usepackage[normalem]{ulem}
                                        \\usepackage{amsmath}
                                        \\usepackage{textcomp}
                                        \\usepackage{marvosym}
                                        \\usepackage{wasysym}
                                        \\usepackage{amssymb}
                                        \\usepackage{booktabs}
                                        \\usepackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black]{hyperref}
                                        \\tolerance=1000
                                        \\usepackage{listings}
                                        \\usepackage{xcolor}
%\\definecolor{foreground}{RGB}{220,220,204}%浅灰
%\\definecolor{background}{RGB}{62,62,62}%浅黑
\\definecolor{background}{RGB}{250,250,250}%
\\definecolor{preprocess}{RGB}{250,187,249}%浅紫
%\\definecolor{var}{RGB}{239,224,174}%浅肉色
%\\definecolor{string}{RGB}{154,150,230}%浅紫色
%\\definecolor{type}{RGB}{225,225,116}%浅黄
%\\definecolor{function}{RGB}{140,206,211}%浅天蓝
%\\definecolor{keyword}{RGB}{239,224,174}%浅肉色
%\\definecolor{comment}{RGB}{180,98,4}%深褐色
%\\definecolor{doc}{RGB}{175,215,175}%浅铅绿
\\definecolor{comdil}{RGB}{111,128,111}%深灰
%\\definecolor{constant}{RGB}{220,162,170}%粉红
%\\definecolor{buildin}{RGB}{127,159,127}%深铅绿
\\lstset{
% 源代码字体样式
%basicstyle=\\color{foreground}\\small\\mono,
% 关键词字体样式
%keywordstyle=\\color{function}\\bfseries\\small\\mono,
%identifierstyle=\\color{doc}\\small\\mono,
% 批注样式
%commentstyle=\\color{comment}\\small\\itshape,
% 字符串样式
%stringstyle=\\color{string}\\small,
% 字符串空格显示
%showstringspaces=false,
% 行号显示
numbers=left,
numbersep=5pt,
% 行号样式
%numberstyle=\\color{preprocess},
%numberstyle=\\color{black},
% 行号递增
%stepnumber=1,
% 代码框背景色
%backgroundcolor=\\color{background},
% TAB等效空格数
%tabsize=4,
% 标题位置 top or buttom(t|b)
%captionpos=t,
% 自动断行
%breaklines=true,
% 只在空格分行
breakatwhitespace=true,
% 显示空格
%showspaces=false,
% 列样式
columns=flexible,
% 代码框：阴影盒
%frame=single,
frame=shadowbox,
% 代码框： 圆角
%frameround=tttt,
%framesep=0pt,
%framerule=8pt,
%rulecolor=\\color{background},
%rulecolor=\\color{comdil},
%fillcolor=\\color{white},
%rulesepcolor=\\color{comdil},
framexleftmargin=10mm

            }
                                        "
                                    ("\\section{%s}" . "\\section*{%s}")
                                    ("\\subsection{%s}" . "\\subsection*{%s}")
                                    ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                    ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                    ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'org-latex-classes
               '("hw"
                 "\\documentclass{hw}
               [NO-DEFAULT-PACKAGES]
               [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'org-latex-classes
               '("elnote"
                 "\\documentclass{elegantnote}
               [NO-DEFAULT-PACKAGES]
               [EXTRA]"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
               '("progart"
                 "\\documentclass{progartcn}
                    [NO-DEFAULT-PACKAGES]
                    [NO-PACKAGES]
                    [EXTRA]

                  \\usepackage{graphicx}
                  \\usepackage[dvipsnames]{xcolor}
                  \\usepackage{wrapfig}
                  \\usepackage{enumerate}
                  \\usepackage{amsmath,mathrsfs,amsfonts}
                  \\usepackage{booktabs}
                  \\usepackage{tabularx}
                  \\usepackage{colortbl}
                  \\usepackage{multirow,makecell}
                  \\usepackage{multicol}
                  \\usepackage{ulem}  %% \\line
                  \\usepackage{listings}
                  \\usepackage{tikz}
                  \\usepackage{tcolorbox}
                  \\usepackage{fontawesome}
                  \\usepackage{longtable}
                  \\usepackage{pdflscape}
                  \\usepackage{float}
                  \\usepackage{rotating}
                  \\usepackage{imakeidx}

                  \\usepackage{pdfpages}
                  \\usepackage{array}
                  \\newcolumntype{H}{>{\\setbox0=\\hbox\\bgroup}c<{\\egroup}@{}}
"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
               '("progbook"
                 "\\documentclass{progbookcn}
                  [NO-DEFAULT-PACKAGES]
                  [NO-PACKAGES]

                  \\usepackage{wrapfig}
                  \\usepackage{enumerate}
                  \\usepackage{amsmath,mathrsfs,amsfonts}
                  \\usepackage{booktabs}
                  \\usepackage{tabularx}
                  \\usepackage{colortbl}
                  \\usepackage{multirow,makecell}
                  \\usepackage{multicol}
                  \\usepackage{ulem}  %% \\line
                  \\usepackage{listings}
                  \\usepackage{tikz}
                  \\usepackage{tcolorbox}
                  \\usepackage{fontawesome}
                  \\usepackage[open,openlevel=0,atend]{bookmark}

                  \\usepackage{longtable}
                  \\usepackage{pdflscape}
                  \\usepackage{float}
                  \\usepackage{rotating}
                  \\usepackage{imakeidx}

                  \\usepackage{pdfpages}
                  \\usepackage{array}
                  \\newcolumntype{H}{>{\\setbox0=\\hbox\\bgroup}c<{\\egroup}@{}}

                  [EXTRA]
\\makeindex[%
  intoc=true,
  columns=2,
  columnsep=1cm,
  columnseprule=true
]

"
                 ("\\part{%s}" . "\\part*{%s}")
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
               '("dndbook"
                 "\\documentclass[onecolumn]{progbookcn}
                  [NO-DEFAULT-PACKAGES]
                  [NO-PACKAGES]

                  \\usepackage{wrapfig}
                  \\usepackage{enumerate}
                  \\usepackage{amsmath,mathrsfs,amsfonts}
                  \\usepackage{booktabs}
                  \\usepackage{tabularx}
                  \\usepackage{colortbl}
                  \\usepackage{multirow,makecell}
                  \\usepackage{multicol}
                  \\usepackage{ulem}  %% \\line
                  \\usepackage{listings}
                  \\usepackage{tikz}
                  \\usepackage{tcolorbox}
                  \\usepackage{fontawesome}
                  \\usepackage[open,openlevel=0,atend]{bookmark}

                  \\usepackage{longtable}
                  \\usepackage{pdflscape}
                  \\usepackage{float}
                  \\usepackage{rotating}
                  \\usepackage{imakeidx}

                  \\usepackage{pdfpages}
                  \\usepackage{array}
                  \\newcolumntype{H}{>{\\setbox0=\\hbox\\bgroup}c<{\\egroup}@{}}

                  \\usepackage[layout=true]{dnd}

                  [EXTRA]
\\makeindex[%
  intoc=true,
  columns=2,
  columnsep=1cm,
  columnseprule=true
]

"
                 ("\\part{%s}" . "\\part*{%s}")
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'org-latex-classes
               '("elbook"
                 "\\documentclass{elegantbook}
               [NO-DEFAULT-PACKAGES]
               [EXTRA]

                                        \\usepackage[utf8]{inputenc}
                                        \\usepackage[T1]{fontenc}
                                        \\usepackage{fixltx2e}
                                        \\usepackage[a4paper,hmargin=1.25in,vmargin=1in]{geometry}
                                        \\usepackage{graphicx}
                                        \\usepackage{longtable}
                                        \\usepackage{pdflscape}
                                        \\usepackage{float}
                                        \\usepackage{wrapfig}
                                        \\usepackage{rotating}
                                        \\usepackage[normalem]{ulem}
                                        \\usepackage{amsmath}
                                        \\usepackage{textcomp}
                                        \\usepackage{marvosym}
                                        \\usepackage{wasysym}
                                        \\usepackage{amssymb}
                                        \\usepackage{booktabs}
                                        \\usepackage[colorlinks,linkcolor=black,anchorcolor=black,citecolor=black]{hyperref}
                                        \\tolerance=1000
                                        \\usepackage{listings}
                                        \\usepackage{xcolor}
"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("my-report"
               "\\documentclass[11pt]{ctexrep}"
               ("\\chapter{%s}" .
                "{\\ctexset{chapter={numbering=false}}\\chapter{%s}}")
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")))

(add-to-list 'org-latex-classes
             '("cn-article"
               "\\documentclass[14pt,a4paper]{article}
\\usepackage{graphicx}
\\usepackage{xcolor}
\\usepackage{xeCJK}
\\usepackage{lmodern}
\\usepackage{verbatim}
\\usepackage{fixltx2e}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{tikz}
\\usepackage{wrapfig}
\\usepackage{soul}
\\usepackage{textcomp}
\\usepackage{listings}
\\usepackage{geometry}
\\usepackage{algorithm}
\\usepackage{algorithmic}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{latexsym}
\\usepackage{natbib}
\\usepackage{fancyhdr}
\\usepackage[xetex,colorlinks=true,CJKbookmarks=true,
linkcolor=blue,
urlcolor=blue,
menucolor=blue]{hyperref}
;; \\usepackage{fontspec,xunicode,xltxtra}
;; \\setmainfont[BoldFont=Adobe Heiti Std]{Adobe Song Std}
;; \\setsansfont[BoldFont=Adobe Heiti Std]{AR PL UKai CN}
;; \\setmonofont{Bitstream Vera Sans Mono}
;; \\newcommand\\fontnamemono{AR PL UKai CN}%等宽字体
;; \\newfontinstance\\MONO{\\fontnamemono}
;; \\newcommand{\\mono}[1]{{\\MONO #1}}
;; \\setCJKmainfont[Scale=0.9]{Adobe Heiti Std}%中文字体
;; \\setCJKmonofont[Scale=0.9]{Adobe Heiti Std}
\\hypersetup{unicode=true}
\\geometry{a4paper, textwidth=6.5in, textheight=10in,
marginparsep=7pt, marginparwidth=.6in}
\\definecolor{foreground}{RGB}{220,220,204}%浅灰
\\definecolor{background}{RGB}{62,62,62}%浅黑
\\definecolor{preprocess}{RGB}{250,187,249}%浅紫
\\definecolor{var}{RGB}{239,224,174}%浅肉色
\\definecolor{string}{RGB}{154,150,230}%浅紫色
\\definecolor{type}{RGB}{225,225,116}%浅黄
\\definecolor{function}{RGB}{140,206,211}%浅天蓝
\\definecolor{keyword}{RGB}{239,224,174}%浅肉色
\\definecolor{comment}{RGB}{180,98,4}%深褐色
\\definecolor{doc}{RGB}{175,215,175}%浅铅绿
\\definecolor{comdil}{RGB}{111,128,111}%深灰
\\definecolor{constant}{RGB}{220,162,170}%粉红
\\definecolor{buildin}{RGB}{127,159,127}%深铅绿
\\punctstyle{kaiming}
\\title{}
\\fancyfoot[C]{\\bfseries\\thepage}
\\chead{\\MakeUppercase\\sectionmark}
\\pagestyle{fancy}
\\tolerance=1000
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; 使用Listings宏包格式化源代码(只是把代码框用listing环境框起来，还需要额外的设置)
(setq org-latex-listings t)
;; Options for \lset command（reference to listing Manual)
;; (setq org-latex-listings-options
;;       '(
;;         ("basicstyle" "\\color{foreground}\\small\\mono")           ; 源代码字体样式
;;         ("keywordstyle" "\\color{function}\\bfseries\\small\\mono") ; 关键词字体样式
;;         ("identifierstyle" "\\color{doc}\\small\\mono")
;;         ("commentstyle" "\\color{comment}\\small\\itshape")         ; 批注样式
;;         ("stringstyle" "\\color{string}\\small")                    ; 字符串样式
;;         ("showstringspaces" "false")                                ; 字符串空格显示
;;         ("numbers" "left")                                          ; 行号显示
;;         ("numberstyle" "\\color{preprocess}")                       ; 行号样式
;;         ("stepnumber" "1")                                          ; 行号递增
;;         ;; ("backgroundcolor" "\\color{background}")                   ; 代码框背景色
;;         ("tabsize" "4")                                             ; TAB等效空格数
;;         ("captionpos" "t")                                          ; 标题位置 top or buttom(t|b)
;;         ("breaklines" "true")                                       ; 自动断行
;;         ("breakatwhitespace" "true")                                ; 只在空格分行
;;         ("showspaces" "false")                                      ; 显示空格
;;         ("columns" "flexible")                                      ; 列样式
;;         ("frame" "single")                                          ; 代码框：阴影盒
;;         ("frameround" "tttt")                                       ; 代码框： 圆角
;;         ("framesep" "0pt")
;;         ("framerule" "8pt")
;;         ("rulecolor" "\\color{background}")
;;         ("fillcolor" "\\color{white}")
;;         ("rulesepcolor" "\\color{comdil}")
;;         ("framexleftmargin" "10mm")
;;         ))
  ;; {{ export org-mode in Chinese into PDF
  ;; @see http://freizl.github.io/posts/tech/2012-04-06-export-orgmode-file-in-Chinese.html
  ;; and you need install texlive-xetex on different platforms
  ;; To install texlive-xetex:
  ;;    `sudo USE="cjk" emerge texlive-xetex` on Gentoo Linux
  ;; }}
  ;; (setq org-latex-default-class "cn-article")
  (setq org-latex-default-class "progart")
  (setq org-latex-pdf-process
        '(
          "xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"
          "rm -fr %b.out %b.log %b.tex auto"))

 ;; (setq org-latex-listings t)

  (setq org-latex-caption-above nil)
  ;;ref from https://emacs.stackexchange.com/questions/33549/org-mode-logtable-latex-export-how-to-change-the-continued-on-next-page-text
  (defun my-latex-filter-continue-string1 (text backend info)
    "Ensure \"_\" are properly handled in LaTeX export."
    (when (org-export-derived-backend-p backend 'latex)
      ;; (replace-regexp-in-string "Continued from previous page" "" text)
      (replace-regexp-in-string "Continued on " "" text)
      ))
  (defun my-latex-filter-continue-string2 (text backend info)
    "Ensure \"_\" are properly handled in LaTeX export."
    (when (org-export-derived-backend-p backend 'latex)
      ;; (replace-regexp-in-string "Continued on next page" "" text)
      (replace-regexp-in-string "Continued on " "" text)
      ))

  (add-to-list 'org-export-filter-table-functions
               'my-latex-filter-continue-string1)

  (add-to-list 'org-export-filter-table-functions
               'my-latex-filter-continue-string2)

  )
