;; -*- mode: emacs-lisp -*-
;; This files is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     (shell :variables
            shell-default-shell 'eshell)
     clojure
     colemak-evil
     ;;common-lisp
     csv
     emacs-lisp
     ;; evernote-mode
     git
     ;; github
     ;; gnus
     (go :variables
         go-format-before-save t
         gofmt-command "goimports")
     go-tmp
     ;; haskell
     helm
     html
     javascript
     markdown
     org
     ;; org-page
     ;; pandoc
     ;; php
     python
     (ruby :variables
           ruby-version-manager 'rbenv
           ruby-test-runner 'rspec)
     ;; rust
     ;; scheme
     ;; search-engine
     semantic
     shell-scripts
     ;; slack
     spell-checking
     ;; syntax-checking
     ;; version-control
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     chatgpt
     clang-format
     (copilot :location (recipe
                         :fetcher github
                         :repo "adlawren/copilot.el"
                         :branch "main-fork"
                         :files ("*.el" "dist")))
     ;; ergoemacs-mode
     ;; eww
     writegood-mode
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only
   package-archives '(("melpa" . "https://melpa.org/packages/")
                      ("org" . "https://orgmode.org/elpa/")
                      ("gnu" . "https://elpa.gnu.org/packages/")
                      ("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/"))))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   ;; dotspacemacs-default-font '("Source Code Pro"
   ;;                             :size 13
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)

   ;; Set theme
   dotspacemacs-themes '(manoj-dark)

   ;; Configure ergoemacs
   ;; ergoemacs-theme nil
   ;; ergoemacs-keyboard-layout "colemak"

   ;; Configure search engine
   dotspacemacs-whitespace-cleanup nil

   ;; Open all URLs in eww
   ;; browse-url-browser-function 'eww-browse-url
   ;; engine/browser-function 'eww-browse-url
   browse-url-browser-function 'browse-url-default-browser
   engine/browser-function 'browse-url-default-browser

   ;; Configure gnus

   ;; Get email, and store in nnml
   gnus-secondary-select-methods '(
                                   (nnimap "gmail"
                                           (nnimap-address
                                            "imap.gmail.com")
                                           (nnimap-server-port 993)
                                           (nnimap-stream ssl))
                                   )

   ;; Send email via Gmail:
   message-send-mail-function 'smtpmail-send-it
   smtpmail-default-smtp-server "smtp.gmail.com"

   ;; Archive outgoing email in Sent folder on imap.gmail.com:
   gnus-message-archive-method '(nnimap "imap.gmail.com")
   gnus-message-archive-group "[Gmail]/Sent Mail"

   ;; Set return email address based on incoming email address
   gnus-posting-styles '(((header "to" "address@outlook.com")
                          (address "address@outlook.com"))
                         ((header "to" "address@gmail.com")
                          (address "address@gmail.com")))

   ;; Store email in ~/gmail directory
   nnml-directory "~/gmail"
   message-directory "~/gmail"

   ;; Indicate the port on the smtp server to use
   smtpmail-smtp-service 587
   )
  )

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
  (setq openai-key (getenv "OPENAI_API_KEY"))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Set ergoemacs mode
  ;; (ergoemacs-mode 1)

  ;; -------------------------
  ;; Note the following code was taken from this source: http://spacemacs.org/doc/VIMUSERS.html (!)

  ;; This snippet allows you to run clang-format before saving
  ;; given the current file as the correct filetype.
  ;; This relies on the c-c++ layer being enabled.
  (defun clang-format-for-filetype ()
      "Run clang-format if the current file has a file extensions
in the filetypes list."
      (let ((filetypes '("c" "cpp" "hpp")))
        (when (member (file-name-extension (buffer-file-name)) filetypes)
          (clang-format-buffer))))

  ;; See http://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html for
  ;; what this line means
  (add-hook 'before-save-hook 'clang-format-for-filetype)
  ;; -------------------------

  ;; Create a new search engine using the proper DuckDuckGo url
  ;; Note: this is a workaround: https://github.com/syl20bnr/spacemacs/issues/7999#issuecomment-384022842
  ;; (let ((custom-search-engine '(custom1 :name "Custom Search Engine 1" :url "https://duckduckgo.com/html/?q=%s")))
  ;;   (progn
  ;;     (push custom-search-engine search-engine-alist)
  ;;     (autoload (intern (format "engine/search-%S" (car custom-search-engine))) "engine-mode" nil 'interactive)
  ;;     )
  ;;   )

  ;; Load external encrypted accounts configuration file - TODO: fix
  ;;(load "/home/andrewl/.spacemacs.d/accounts-config.el.gpg")

  ;; Configure org-page
  ;; Note: this code was implemented using the following for reference: http://codys.club/blog/2015/07/05/blogging-with-emacs-and-org-mode/
  ;; (require 'org-page)
  ;; (setq op/repository-directory "/home/andrewl/Git-Repos/adlawren.github.io")
  ;; (setq op/site-domain "http://adlawren.github.io")
  ;; (setq op/personal-github-link "https://github.com/adlawren")
  ;; (setq op/site-main-title "Bits and Bytes")
  ;; (setq op/site-sub-title "Notes from the deviant pursuits of a technical vagrant")
  ;; (setq op/personal-disqus-shortname "adlawren")

  ;; TODO: Configure semantic mode
  (semantic-mode 1)

  ;; Use Chicken in Scheme layer
  ;; (setq geiser-active-implementations '(chicken))
  ;; (setq geiser-chicken-binary "chicken-csi")

  ;; Source-ish: https://develop.spacemacs.org/doc/DOCUMENTATION.html#binding-keys
  (define-key evil-normal-state-map (kbd "k") 'evil-ex-search-next)
  (define-key evil-normal-state-map (kbd "K") 'evil-ex-search-previous)

  (setq helm-locate-command "locate %s --regex %s")

  (setq exec-path (append exec-path '("~/.nvm/versions/node/v16.13.0/bin")))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(tern geiser clj-refactor inflections edn multiple-cursors paredit cider sesman queue parseedn peg parseclj clojure-mode lv cider-eval-sexp-fu a slime-company slime go-guru go-eldoc go-mode toml-mode racer pos-tip cargo rust-mode yaml-mode csv-mode intero company-ghci company-ghc ghc flycheck hlint-refactor hindent helm-hoogle haskell-snippets company haskell-mode cmm-mode web-mode tagedit powerline slim-mode scss-mode sass-mode pug-mode pcre2el spinner ht markdown-mode hydra dash-functional parent-mode projectile pkg-info epl helm-css-scss haml-mode flyspell-correct flx treepy graphql smartparens iedit anzu highlight emmet-mode evil goto-chg undo-tree inf-ruby bind-map bind-key packed pythonic f dash s alert log4e gntp helm avy helm-core popup async phpunit phpcbf php-extras php-auto-yasnippets yasnippet drupal-mode php-mode stickyfunc-enhance srefactor smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit ghub with-editor evernote-mode org-category-capture org-plus-contrib org-page git mustache simple-httpd slack yapfify xterm-color ws-butler winum which-key websocket volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline shell-pop rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs request rbenv rake rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode paradox pandoc-mode ox-pandoc org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file oauth2 neotree multi-term move-text mmm-mode minitest markdown-toc macrostep lorem-ipsum live-py-mode linum-relative link-hint indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio gnuplot gh-md geeknote flyspell-correct-helm flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help ergoemacs-mode engine-mode emojify elisp-slime-nav dumb-jump disaster diminish define-word cython-mode column-enforce-mode colemak-evil cmake-mode clean-aindent-mode clang-format cl-generic circe chruby bundler auto-highlight-symbol auto-dictionary auto-compile anaconda-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(geiser clj-refactor inflections edn multiple-cursors paredit cider sesman queue parseedn peg parseclj clojure-mode lv cider-eval-sexp-fu a slime-company slime go-guru go-eldoc go-mode toml-mode racer pos-tip cargo rust-mode yaml-mode csv-mode intero company-ghci company-ghc ghc flycheck hlint-refactor hindent helm-hoogle haskell-snippets company haskell-mode cmm-mode web-mode tagedit powerline slim-mode scss-mode sass-mode pug-mode pcre2el spinner ht markdown-mode hydra dash-functional parent-mode projectile pkg-info epl helm-css-scss haml-mode flyspell-correct flx treepy graphql smartparens iedit anzu highlight emmet-mode evil goto-chg undo-tree inf-ruby bind-map bind-key packed pythonic f dash s alert log4e gntp helm avy helm-core popup async phpunit phpcbf php-extras php-auto-yasnippets yasnippet drupal-mode php-mode stickyfunc-enhance srefactor smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit ghub with-editor evernote-mode org-category-capture org-plus-contrib org-page git mustache simple-httpd slack yapfify xterm-color ws-butler winum which-key websocket volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline shell-pop rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs request rbenv rake rainbow-delimiters pyvenv pytest pyenv-mode py-isort popwin pip-requirements persp-mode paradox pandoc-mode ox-pandoc org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file oauth2 neotree multi-term move-text mmm-mode minitest markdown-toc macrostep lorem-ipsum live-py-mode linum-relative link-hint indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio gnuplot gh-md geeknote flyspell-correct-helm flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help ergoemacs-mode engine-mode emojify elisp-slime-nav dumb-jump disaster diminish define-word cython-mode column-enforce-mode colemak-evil cmake-mode clean-aindent-mode clang-format cl-generic circe chruby bundler auto-highlight-symbol auto-dictionary auto-compile anaconda-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
