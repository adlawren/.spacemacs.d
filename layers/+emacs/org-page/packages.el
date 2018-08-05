;;; packages.el --- org-page layer packages file for Spacemacs.
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

(defconst org-page-packages
  '(
    org-page
    ))

(defun org-page/init-org-page ()
  "Initialize org-page"
  (use-package org-page
    :init
    (progn
      ;; Note: leader-keys keybindings created using the following for reference: https://github.com/venmos/org-page-layer/blob/master/packages.el
      (spacemacs/set-leader-keys
        "aogn" 'op/new-post
        "aogr" 'op/new-repository
        "aogp" 'op/do-publication
        "aogv" 'op/do-publication-and-preview-site
        "aogt" 'op/insert-options-template))))

;;; packages.el ends here
