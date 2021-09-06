;;; packages.el --- colemak-evil layer packages file for Spacemacs.
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

(defconst colemak-evil-packages
  '(
    (colemak-evil :location (recipe
                             :fetcher github
                             :repo "adlawren/colemak-evil"))))

(defun colemak-evil/init-colemak-evil ()
  (use-package colemak-evil))

;;; packages.el ends here
