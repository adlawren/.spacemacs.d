;;; packages.el --- mastodon layer packages file for Spacemacs.
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

(defconst mastodon-packages
  '(
    (mastodon :location (recipe
                          :fetcher github
                          :repo "jdenen/mastodon.el"))
    ))

;; TODO
;; - Use MELPA package instead of Github
;; - Add leader keys for timeline navigation functions
;; - Add major & minor mode keybindings? (Instead of leader keys?)
(defun mastodon/init-mastodon ()
  "Initialize mastodon"
  (use-package mastodon
    :init
    (progn
      (spacemacs/set-leader-keys
        "ams" 'mastodon
        "amtf" 'mastodon-toot--toggle-favourite))))

;;; packages.el ends here
