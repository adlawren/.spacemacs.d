;;; packages.el --- evernote-mode layer packages file for Spacemacs.
;;
;; Copyright (c) 2018 Andrew Lawrence
;;
;; Author: Andrew Lawrence <adlawren010@gmail.com>
;; URL: https://github.com/adlawren/.spacemacs.d/
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst evernote-mode-packages
  '(
    (evernote-mode :location (recipe
                              :fetcher github
                              :repo "pymander/evernote-mode"))
    ))

(defun evernote-mode/init-evernote-mode ()
  "Initialize Evernote"
  (use-package evernote-mode
    :commands (evernote-login)
    :defer t
    :init
    (progn
      (spacemacs/set-leader-keys
        "ael" 'evernote-login
        "aec" 'evernote-create-note
        "aeo" 'evernote-open-note
        "aes" 'evernote-search-notes
        "aeS" 'evernote-do-saved-search
        "aew" 'evernote-write-note
        "aep" 'evernote-post-region
        "aeb" 'evernote-browser))
    :config
    (progn
      (evilified-state-evilify evernote-browsing-mode evernote-browsing-mode-map)
      (evilified-state-evilify evernote-mode evernote-mode-map)
      (evilified-state-evilify evernote-search-mode evernote-search-mode-map))))

;;; packages.el ends here
