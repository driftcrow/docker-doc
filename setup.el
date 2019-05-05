(setq exec-path (split-string (getenv "PATH") ":"))
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://stable.melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpastable" url) t))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize) ;; You might already have this line
(package-refresh-contents)

(package-install 'org-plus-contrib)
(package-install 'ox-tufte)
(package-install 'htmlize)
(package-install 'color-theme-modern)
