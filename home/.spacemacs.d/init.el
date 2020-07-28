; -*- mode: emacs-lisp; lexical-binding: t -*-
; This file is loaded by Spacemacs at startup.
; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."

  (setq-default
   ; Base distribution to use. This is a layer contained in the directory
   ; `+distribution'. For now available distributions are `spacemacs-base'
   ; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ; Lazy installation of layers (i.e. layers are installed only when a file
   ; with a supported type is opened). Possible values are `all', `unused'
   ; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ; lazy install any layer that support lazy installation even the layers
   ; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ; installation feature and you have to explicitly list a layer in the
   ; variable `dotspacemacs-configuration-layers' to install it.
   ; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ; If non-nil then Spacemacs will ask for confirmation before installing
   ; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ; List of additional paths where to look for configuration layers.
   ; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ; List of configuration layers to load.
   dotspacemacs-configuration-layers
   ;
   '(
;;     (lsp :variables
;;          lsp-ui-doc-enable nil
;;          lsp-ui-sideline-code-actions-prefix " "
;;          lsp-ui-sideline-show-hover nil
;;          lsp-rust-server 'rust-analyzer
;;          lsp-rust-analyzer-server-display-inlay-hints t
;;          )
     lsp
     (python :variables
             python-backend 'lsp
             python-formatter 'yapf
             python-format-on-save t
             python-sort-imports-on-save t
             python-pipenv-activate t
             python-test-runner 'pytest)
     (rust :variables
           rust-format-on-save t)
     sml
     (c-c++ :variables c-c++-backend 'lsp-clangd)
     haskell
     php
     javascript
     yaml
     shell-scripts
     html
     ivy
     auto-completion
     better-defaults
     emacs-lisp
     git
     markdown
     multiple-cursors
     org
     treemacs
     themes-megapack
     spell-checking
     syntax-checking
     version-control
     (colors :variables
             colors-colorize-identifiers 'all
             colors-default-rainbow-identifiers-sat 42
             colors-default-rainbow-identifiers-light 86)
     ;(haskell :variables haskell-completion-backend 'lsp)
     ;(haskell :variables ; Or optionally just haskell without the variables.
     ;         haskell-completion-backend 'ghci
     ;         haskell-process-type 'stack-ghci)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-term-shell "usr/bin/fish")
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-complete-with-key-sequence-delay 0.2
                      auto-completion-enable-snippets-in-popup t)
    )

   ; List of additional packages that will be installed without being
   ; wrapped in a layer. If you need some configuration for these
   ; packages, then consider creating a layer. You can also put the
   ; configuration in `dotspacemacs/user-config'.
   ; To use a local version of a package, use the `:location' property:
   ; '(your-package :location "~/path/to/your-package/")
   ; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(all-the-icons
                                      all-the-icons-dired
                                      mozc
                                      mozc-im
                                      mozc-popup
                                      (use-package all-the-icons
                                        :custom
                                        (all-the-icons-scale-factor 1.0))
                                      (use-package lsp-haskell
                                        :location
                                        (recipe :fetcher github :repo "emacs-lsp/lsp-haskell")) ;
                                      jedi
                                      )

   ; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ; Defines the behaviour of Spacemacs when installing packages.
   ; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ; `used-only' installs only explicitly used packages and deletes any unused
   ; packages as well as their unused dependencies. `used-but-keep-unused'
   ; installs only the used packages but won't delete unused ones. `all'
   ; installs *all* packages supported by Spacemacs and never uninstalls them.
   ; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ; This setq-default sexp is an exhaustive list of all the supported
  ; spacemacs settings.
  (setq-default
   ; If non-nil then enable support for the portable dumper. You'll need
   ; to compile Emacs 27 from source following the instructions in file
   ; EXPERIMENTAL.org at to root of the git repository.
   ; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ; Name of executable file pointing to emacs 27+. This executable must be
   ; in your PATH.
   ; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ; Name of the Spacemacs dump file. This is the file will be created by the
   ; portable dumper in the cache directory under dumps sub-directory.
   ; To load it when starting Emacs add the parameter `--dump-file'
   ; when invoking Emacs 27.1 executable on the command line, for instance:
   ;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ; possible. Set it to nil if you have no way to use HTTPS in your
   ; environment, otherwise it is strongly recommended to let it set to t.
   ; This variable has no effect if Emacs is launched with the parameter
   ; `--insecure' which forces the value of this variable to nil.
   ; (default t)
   dotspacemacs-elpa-https t

   ; Maximum allowed time in seconds to contact an ELPA repository.
   ; (default 5)
   dotspacemacs-elpa-timeout 5

   ; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ; This is an advanced option and should not be changed unless you suspect
   ; performance issues due to garbage collection operations.
   ; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ; If non-nil then Spacelpa repository is the primary source to install
   ; a locked version of packages. If nil then Spacemacs will install the
   ; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ; If non-nil then verify the signature for downloaded Spacelpa archives.
   ; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ; If non-nil then spacemacs will check for updates at startup
   ; when the current branch is not `develop'. Note that checking for
   ; new versions works via git commands, thus it calls GitHub services
   ; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ; If non-nil, a form that evaluates to a package directory. For example, to
   ; use different package directories for different Emacs versions, set this
   ; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ; One of `vim', `emacs' or `hybrid'.
   ; `hybrid' is like `vim' except that `insert state' is replaced by the
   ; `hybrid state' with `emacs' key bindings. The value can also be a list
   ; with `:variables' keyword (similar to layers). Check the editing styles
   ; section of the documentation for details on available variables.
   ; (default 'vim)
   dotspacemacs-editing-style 'hybrid

   ; Specify the startup banner. Default value is `official', it displays
   ; the official spacemacs logo. An integer value is the index of text
   ; banner, `random' chooses a random text banner in `core/banners'
   ; directory. A string value must be a path to an image format supported
   ; by your Emacs build.
   ; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ; List of items to show in startup buffer or an association list of
   ; the form `(list-type . list-size)`. If nil then it is disabled.
   ; Possible values for list-type are:
   ; `recents' `bookmarks' `projects' `agenda' `todos'.
   ; List sizes may be nil, in which case
   ; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ; Default major mode for a new empty buffer. Possible values are mode
   ; names such as `text-mode'; and `nil' to use Fundamental mode.
   ; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ; (default nil)
   dotspacemacs-initial-scratch-message nil

   ; List of themes, the first of the list is loaded when spacemacs starts.
   ; Press `SPC T n' to cycle to the next theme in the list (works great
   ; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(flatland
                                        ;ample-zen
                                        ;monokai
                                        ;spacemacs-dark
                                        ;spacemacs-light
                        )
   ; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ; refer to the DOCUMENTATION.org for more info on how to create your own
   ; spaceline theme. Value can be a symbol or list with additional properties.
   ; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ; If non-nil the cursor color matches the state color in GUI Emacs.
   ; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ; Default font or prioritized list of fonts.
   dotspacemacs-default-font '(;"Source Code Pro"
                               ;"M+ lmn"
                               "Ricty Diminished"
                               :size 15.0
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ; The leader key accessible in `emacs state' and `insert state'
   ; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ; Major mode leader key is a shortcut key which is the equivalent of
   ; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ; Major mode leader key accessible in `emacs state' and `insert state'.
   ; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ; These variables control whether separate commands are bound in the GUI to
   ; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ; Setting it to a non-nil value, allows for separate commands under `C-i'
   ; and TAB or `C-m' and `RET'.
   ; In the terminal, these pairs are generally indistinguishable, so this only
   ; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ; If non-nil the default layout name is displayed in the mode-line.
   ; (default nil)
   dotspacemacs-display-default-layout nil

   ; If non-nil then the last auto saved layouts are resumed automatically upon
   ; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ; If non-nil, auto-generate layout name when creating new layouts. Only has
   ; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ; Size (in MB) above which spacemacs will prompt to open the large file
   ; literally to avoid performance issues. Opening a file literally means that
   ; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ; Location where to auto-save files. Possible values are `original' to
   ; auto-save the file in-place, `cache' to auto-save the file to another
   ; file stored in the cache directory and `nil' to disable auto-saving.
   ; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ; If non-nil, the paste transient-state is enabled. While enabled, after you
   ; paste something, pressing `C-j' and `C-k' several times cycles through the
   ; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ; Which-key delay in seconds. The which-key buffer is the popup listing
   ; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ; Which-key frame position. Possible values are `right', `bottom' and
   ; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ; right; if there is insufficient space it displays it at the bottom.
   ; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ; Control where `switch-to-buffer' displays the buffer. If nil,
   ; `switch-to-buffer' displays the buffer in the current window even if
   ; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ; displays the buffer in a same-purpose window even if the buffer can be
   ; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ; If non-nil a progress bar is displayed when spacemacs is loading. This
   ; may increase the boot time on some systems and emacs builds, set it to
   ; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ; If non-nil the frame is maximized when Emacs starts up.
   ; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ; A value from the range (0..100), in increasing opacity, which describes
   ; the transparency level of a frame when it's active or selected.
   ; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ; A value from the range (0..100), in increasing opacity, which describes
   ; the transparency level of a frame when it's inactive or deselected.
   ; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ; If non-nil unicode symbols are displayed in the mode line.
   ; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ; scrolling overrides the default behavior of Emacs which recenters point
   ; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ; Control line numbers activation.
   ; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ; numbers are relative. If set to `visual', line numbers are also relative,
   ; but lines are only visual lines are counted. For example, folded lines
   ; will not be counted and wrapped lines are counted as multiple lines.
   ; This variable can also be set to a property list for finer control:
   ; '(:relative nil
   ;   :visual nil
   ;   :disabled-for-modes dired-mode
   ;                       doc-view-mode
   ;                       markdown-mode
   ;                       org-mode
   ;                       pdf-view-mode
   ;                       text-mode
   ;   :size-limit-kb 1000)
   ; When used in a plist, `visual' takes precedence over `relative'.
   ; (default nil)
   dotspacemacs-line-numbers nil

   ; Code folding method. Possible values are `evil' and `origami'.
   ; (default 'evil)
   dotspacemacs-folding-method 'evil

   ; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ; over any automatically added closing parenthesis, bracket, quote, etc...
   ; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ; Select a scope to highlight delimiters. Possible values are `any',
   ; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ; If non-nil, start an Emacs server if one is not already running.
   ; (default nil)
   dotspacemacs-enable-server nil

   ; Set the emacs server socket location.
   ; If nil, uses whatever the Emacs default is, otherwise a directory path
   ; like \"~/.emacs.d/server\". It has no effect if
   ; `dotspacemacs-enable-server' is nil.
   ; (default nil)
   dotspacemacs-server-socket-dir nil

   ; If non-nil, advise quit functions to keep server open when quitting.
   ; (default nil)
   dotspacemacs-persistent-server nil

   ; List of search tool executable names. Spacemacs uses the first installed
   ; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ; Format specification for setting the frame title.
   ; %a - the `abbreviated-file-name', or `buffer-name'
   ; %t - `projectile-project-name'
   ; %I - `invocation-name'
   ; %S - `system-name'
   ; %U - contents of $USER
   ; %b - buffer name
   ; %f - visited file name
   ; %F - frame name
   ; %s - process status
   ; %p - percent of buffer above top of window, or Top, Bot or All
   ; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ; %m - mode name
   ; %n - Narrow if appropriate
   ; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ; %Z - like %z, but including the end-of-line format
   ; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ; Format specification for setting the icon title format
   ; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ; Delete whitespace while saving buffer. Possible values are `all'
   ; to aggressively delete empty line and long sequences of whitespace,
   ; `trailing' to delete only the whitespace at end of lines, `changed' to
   ; delete only whitespace for changed lines or `nil' to disable cleanup.
   ; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ; Either nil or a number of seconds. If non-nil zone out after the specified
   ; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ; Run `spacemacs/prettify-org-buffer' when
   ; visiting README.org files of Spacemacs.
   ; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
this function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
see the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
this function is called immediately after `dotspacemacs/init', before layer
configuration.
it is mostly for variables that should be set before packages are loaded.
if you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
this function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
this function is called at the very end of Spacemacs startup, after layer
configuration.
put your configuration code here, except for variables that should be set

before packages are loaded."

  (require 'package)
  (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)

  (unless package-archive-contents (package-refresh-contents))
  ;Make kill/yank work with the X clipboard
  (cond (window-system
  (setq x-select-enable-clipboard t)
  ))

  ;utf8-read&write
  (prefer-coding-system 'utf-8)
  (setq coding-system-for-read 'utf-8)
  (setq coding-system-for-write 'utf-8)

  ;font設定
  (set-fontset-font
     nil 'japanese-jisx0208
     (font-spec :family "Ricty Diminished"))
  (set-face-font 'default "Ricty Diminished-16")

  ;mozc
  (set-language-environment "Japanese")
  (setq default-input-method "japanese-mozc")
  (setq mozc-candidate-style 'echo-area)

  (defun mozc-start()
    (interactive)
    (set-cursor-color "blue")
    (message "Mozc start")
    (mozc-mode 1))

  (defun mozc-end()
    (interactive)
    (set-cursor-color "gray")
    (message "Mozc end")
    (mozc-mode -1))

  (bind-keys*
   ("<henkan>" . mozc-start)
   ("<muhenkan>". mozc-end)
   )

  ;外部ブラウザ設定
  (setq browse-url-browser-function 'browse-url-generic
        ;browse-url-generic-program "firefox-browser")
        browse-url-generic-program "/usr/bin/firefox")

  ;hie-wrapper使用の設定
  (setq lsp-haskell-process-path-hie "hie-wrapper")
  ;(require 'lsp-haskell)
  ;(add-hook 'haskell-mode-hook #'lsp)

  (add-to-list 'load-path "~/.emacs.d/elisp/lsp-ui")
  (add-to-list 'load-path "~/.emacs.d/elisp/lsp-haskell")

  ;; ----- lsp ----- ;;

  ;;;;;;;;;;;;;;
  ;; lsp-mode ;;
  ;;;;;;;;;;;;;;
  (use-package lsp-mode)

  ;; config
  (setq lsp-prefer-flymake nil)
  (setq lsp-print-io nil)
  (setq lsp-trace nil)
  (setq lsp-print-performance nil)
  (setq lsp-auto-guess-root t)
  (setq lsp-document-sync-method 'incremental)
  (setq lsp-response-timeout 5)


  ;(add-hook 'go-mode-hook #'lsp)
  ;(add-hook 'js2-mode-hook #'lsp)
  ;(add-hook 'web-mode-hook #'lsp)
  (add-hook 'haskell-mode-hook #'lsp)

  ;; func
  (defun lsp-mode-init ()
    (lsp)
    (bind-key* "M-*" 'xref-pop-marker-stack) ;ジャンプ元に戻る
    (bind-key* "M-[" 'xref-find-definitions) ;定義ジャンプ
    (bind-key* "M-]" 'xref-find-references)) ;参照ジャンプ

  (add-hook 'haskell-mode-hook 'lsp-mode-init)

;;;;;;;;;;;;;;
  ;;  lsp-ui  ;;
  ;;;;;;;;;;;;;;
  (use-package lsp-ui)

  ;; config
  (setq lsp-ui-flycheck t)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-header t)
  (setq lsp-ui-doc-include-signature t)
  (setq lsp-ui-doc-max-width 150)
  (setq lsp-ui-doc-max-height 30)
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-peek-peek-height 20)
  (setq lsp-ui-peek-list-width 50)
  (setq lsp-ui-peek-fontify 'on-demand) ;; never, on-demand, or always

  ;; hook
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)

  ;; python-modeで `jediによる自動補完`と `flake8`によるチェックを行う
  (add-hook 'python-mode-hook
            (lambda ()
              #'(flycheck-add-next-checker 'python-flake8)
              'jedi:setup))

  (setq-default tramp-default-method "ssh")



   ;;rust-analyzer
    ;rustic is rust compile
;;  (use-package rustic :ensure t)
;;  (add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
;;  (setq-default rustic-format-trigger 'on-save)
;;  (setq rustic-lsp-server 'rust-analyzer)
;;  (setq lsp-rust-analyzer-server-display-inlay-hints t)
;;  (setq lsp-rust-analyzer-server-command t)
;;
  
  ; Org modeの設定

  ;TODO状態
  (setq org-todo-keywords
        '((sequencep "TODO(t)" "PROG(p)" "WAITING(w)" "NOTE(n)" "|" "DONE(d)" "SOMEDAY(s)")))


  ;ファイルの場所
  (setq org-directory "~/Dropbox/Org")
  (setq org-default-notes-file "notes.org")

  ;Org-captureの設定

  ;Org-captureを呼び出すキーシーケンス
  (define-key global-map "\C-cc" 'org-capture)
  ;Org-captureのテンプレート（メニュー）の設定
  (setq org-capture-templates
        '(
           ("n" "Note" entry (file+headline "~/Dropbox/Org/notes.org" "Notes")
            "* %?\nEntered on %U\n %i\n %a")
           ("t" "Todo" entry (file+headline  "~/Dropbox/Org/gtd.org""INBOX")
            "* TODO %?\n %i\n %a")
           ))

  ;メモをC-M-^一発で見るための設定
  ;https://qiita.com/takaxp/items/0b717ad1d0488b74429d から拝借
  (defun show-org-buffer (file)
    ;"Show an org-file FILE on the current buffer."
    (interactive)
    (if (get-buffer file)
        (let ((buffer (get-buffer file)))
          (switch-to-buffer buffer)
          (message "%s" file))
      (find-file (concat "~/Dropbox/Org/" file))))
  (global-set-key (kbd "C-M-^") '(lambda () (interactive)
                                   (show-org-buffer "notes.org")))

  ;Org-agendaの設定
  (setq org-agenda-files '("~/Dropbox/Org"))

  ;Org-refileの設定
  (setq org-refile-targets '((org-agenda-files : maxlevel . 3)))


  ;ライン行表示
  (require 'linum)
  (setq linum-format "%4d ")
  (set-face-attribute 'linum nil
                      :foreground "#a9a9a9"
                      :background "#404040"
                      )
  (custom-set-variables '(global-linum-mode t))

  ; rainbow-identifiers setting
  ; add per-theme sat&light overrides and refresh values for your current theme
  (colors/add-theme-sat&light 'mytheme '(50 50))
  (colors/add-theme-sat&light 'anothertheme '(90 40))
  (colors/refresh-theme-look)


  ;起動時フルスクリーン
  (set-frame-parameter nil 'fullscreen 'maximized)

  (setq recentf-auto-cleanup 'never)

  ;baffa list color style
  (add-to-list 'load-path "~/.emacs.d/elisp/Buffer-menu-color")
  (require 'buffer-menu-color)

  ;;スペルチェックにaspellを使う
  (setq-default ispell-program-name "aspell")
  ;日本語混じりでもスペルチェック可能にする
  (eval-after-load "ispell"
    '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
  (global-set-key (kbd "C-M-$") 'ispell-complete-word)

  ;スペルチェックのフック
  (mapc
   (lambda (hook)
     (add-hook hook 'flyspell-prog-mode))
   '(
     c-mode-common-hook
     emacs-lisp-mode-hook
     ))
  (mapc
   (lambda (hook)
     (add-hook hook
               '(lambda () (flyspell-mode 1))))
   '(
     ;フック対象のモード
     ;yatex-mode-hook
     org-mode
     ))

  ;window-resize
  (bind-key "M-h" 'shrink-window-horizontally)
  (bind-key "M-j" 'shrink-window)
  (bind-key "M-k" 'enlarge-window)
  (bind-key "M-l" 'enlarge-window-horizontally)

  (setq max-specpdl-size 10000)
  (setq max-lisp-eval-depth 10000)

)

(custom-set-variables
 ; custom-set-variables was added by Custom.
 ; If you edit it by hand, you could mess it up, so be careful.
 ; Your init file should contain only one such instance.
 ; If there is more than one, they won't work right.
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (doom-themes all-the-icons-ivy mozc-popup mozc-im mozc helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-ls-git helm-flx helm-descbinds helm-ag ace-jump-helm-line helm helm-core yasnippet-snippets xterm-color ws-butler writeroom-mode winum which-key wgrep web-mode web-beautify vterm volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-evil toc-org terminal-here tagedit symon symbol-overlay string-inflection spaceline-all-the-icons smex smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs request rainbow-delimiters pug-mode prettier-js popwin pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file nameless multi-term move-text mmm-mode markdown-toc magit-svn magit-section magit-gitflow macrostep lsp-ui lsp-treemacs lorem-ipsum link-hint ivy-yasnippet ivy-xref ivy-purpose ivy-hydra indent-guide impatient-mode hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-make google-translate golden-ratio gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy font-lock+ flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline diminish devdocs define-word counsel-projectile counsel-css company-web company-statistics company-quickhelp company-lsp column-enforce-mode clean-aindent-mode centered-cursor-mode auto-yasnippet auto-highlight-symbol auto-compile ample-zen-theme all-the-icons-dired aggressive-indent ace-link ac-ispell))))
(custom-set-faces
 ; custom-set-faces was added by Custom.
 ; If you edit it by hand, you could mess it up, so be careful.
 ; Your init file should contain only one such instance.
 ; If there is more than one, they won't work right.
)
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
 '(global-linum-mode t)
 '(package-selected-packages
   (quote
    (jedi jedi-core python-environment doom-themes all-the-icons-ivy mozc-popup mozc-im mozc helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-ls-git helm-flx helm-descbinds helm-ag ace-jump-helm-line helm helm-core yasnippet-snippets xterm-color ws-butler writeroom-mode winum which-key wgrep web-mode web-beautify vterm volatile-highlights vi-tilde-fringe uuidgen use-package treemacs-projectile treemacs-persp treemacs-magit treemacs-evil toc-org terminal-here tagedit symon symbol-overlay string-inflection spaceline-all-the-icons smex smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs request rainbow-delimiters pug-mode prettier-js popwin pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file nameless multi-term move-text mmm-mode markdown-toc magit-svn magit-section magit-gitflow macrostep lsp-ui lsp-treemacs lorem-ipsum link-hint ivy-yasnippet ivy-xref ivy-purpose ivy-hydra indent-guide impatient-mode hybrid-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-make google-translate golden-ratio gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy font-lock+ flycheck-pos-tip flycheck-package flycheck-elsa flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline diminish devdocs define-word counsel-projectile counsel-css company-web company-statistics company-quickhelp company-lsp column-enforce-mode clean-aindent-mode centered-cursor-mode auto-yasnippet auto-highlight-symbol auto-compile ample-zen-theme all-the-icons-dired aggressive-indent ace-link ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
