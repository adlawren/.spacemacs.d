;;; packages.el --- go-tmp layer packages file for Spacemacs.
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

(defconst go-tmp-packages
  '(
    (go-tmp :location (recipe
                       :fetcher github
                       :repo "adlawren/go-tmp.el"))))

(defun go-tmp/init-go-tmp ()
  "Initialize go-tmp"
  (use-package go-tmp
    :init
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'go-mode
        "xr" 'go-tmp-region
        "xR" 'go-tmp-region-focus))))

;;; packages.el ends here
