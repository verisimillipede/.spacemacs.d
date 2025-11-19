;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
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

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. "~/.mycontribs/")
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers '
   (lua
    yaml
    html
    python
    csv
    javascript
    ;; ----------------------------------------------------------------
    ;; Example of useful layers you may want to use right away.
    ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
    ;; `M-m f e R' (Emacs style) to install them.
    ;; ----------------------------------------------------------------
    (markdown :variables markdown-live-preview-engine 'vmd)
    auto-completion
    templates
    better-defaults
    emacs-lisp
    nixos
    compleseus
    themes-megapack
    shell
    (latex :variables latex-backend 'lsp)
    ;; pdf
    ;; spacemacs-org

    git
    helm
    ;; nixos-packages
    markdown
    multiple-cursors
    pandoc
    pdf
    lsp
    (python :variables
            python-backend 'lsp
            python-lsp-server 'pyright
            ;; python-test-runner 'pytest
            python-formatter 'ruff
            python-format-on-save t
            python-fill-column 88
            ;; python-auto-set-local-pyvenv-virtualenv nil
            )
    ranger
    neotree
    xkcd

    (org :variables
         ;; org-enable-modern-support t
         org-enable-roam-support t
         org-enable-roam-ui t
         org-enable-roam-protocol t
         org-startup-indented t
         org-indent-mode t
         org-hide-emphasis-markers t
         org-link-descriptive t
         org-pretty-entities t
         org-enable-roam-protocol t
         org-enable-valign t
         org-enable-transclusion-support t
         org-enable-org-journal-support t)
    ;; (shell :variables
    ;;        shell-default-height 30
    ;;        shell-default-position 'bottom)
    ;; spell-checking
    syntax-checking
    treemacs)


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '
   (simpleclip
    uniline
    zotero
    org-download
    nerd-icons
    zotra
    org-fragtog
    org-latex-impatient
    djangonaut
    web-mode
    yasnippet-snippets
    yasnippet
    ligature
    direnv
    wiki-summary
    (use-package org-noter
      :straight
      (:repo "org-noter/org-noter"
             :host github
             :type git
             :files ("*.el" "modules/*.el")))
    names
    org-super-agenda
    eat
    consult)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "nerd-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light). A theme from external
   ;; package can be defined with `:package', or a theme can be defined with
   ;; `:location' to download the theme package, refer the themes section in
   ;; DOCUMENTATION.org for the full theme specifications.
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. This setting has no effect when
   ;; running Emacs in terminal. The font set here will be used for default and
   ;; fixed-pitch faces. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent.
   dotspacemacs-default-font '("JetBrainsMono Nerd Font"
                               :size 20.0
                               :weight normal
                               :width normal)

   ;; Default icons font, it can be `all-the-icons' or `nerd-icons'.
   dotspacemacs-default-icons-font 'nerd-icons

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; (default "C-M-m" for terminal mode, "M-<return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "M-<return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Make consecutive tab key presses after commands such as
   ;; `spacemacs/alternate-buffer' (SPC TAB) cycle through previous
   ;; buffers/windows/etc. Please see the option's docstring for more information.
   ;; Set the option to t in order to enable cycling for all current and
   ;; future cycling commands. Alternatively, choose a subset of the currently
   ;; supported commands: '(alternate-buffer alternate-window). (default nil)
   dotspacemacs-enable-cycling nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; It is also possible to use a posframe with the following cons cell
   ;; `(posframe . position)' where position can be one of `center',
   ;; `top-center', `bottom-center', `top-left-corner', `top-right-corner',
   ;; `top-right-corner', `bottom-left-corner' or `bottom-right-corner'
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; Whether side windows (such as those created by treemacs or neotree)
   ;; are kept or minimized by `spacemacs/toggle-maximize-window' (SPC w m).
   ;; (default t)
   dotspacemacs-maximize-window-keep-side-windows t

   ;; If nil, no load-hints enabled. If t, enable the `load-hints' which will
   ;; put the most likely path on the top of `load-path' to reduce walking
   ;; through the whole `load-path'. It's an experimental feature to speedup
   ;; Spacemacs on Windows. Refer the FAQ.org "load-hints" session for details.
   dotspacemacs-enable-load-hints nil

   ;; If t, enable the `package-quickstart' feature to avoid full package
   ;; loading, otherwise no `package-quickstart' attemption (default nil).
   ;; Refer the FAQ.org "package-quickstart" section for details.
   dotspacemacs-enable-package-quickstart nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default t) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' to obtain fullscreen
   ;; without external boxes. Also disables the internal border. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; `(:relative t)

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "ack" "grep")

   ;; The backend used for undo/redo functionality. Possible values are
   ;; `undo-fu', `undo-redo' and `undo-tree' see also `evil-undo-system'.
   ;; Note that saved undo history does not get transferred when changing
   ;; your undo system. The default is currently `undo-fu' as `undo-tree'
   ;; is not maintained anymore and `undo-redo' is very basic."
   dotspacemacs-undo-system 'undo-fu

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Color highlight trailing whitespace in all prog-mode and text-mode derived
   ;; modes such as c++-mode, python-mode, emacs-lisp, html-mode, rst-mode etc.
   ;; (default t)
   dotspacemacs-show-trailing-whitespace nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; The variable `global-spacemacs-whitespace-cleanup-modes' controls
   ;; which major modes have whitespace cleanup enabled or disabled
   ;; by default.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup `nil


   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs t

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (setq org-superstar-headline-bullets-list '("\u25c9" "\u25cb" "\u25cf" "\u25ce" "\u25c8" "\u25c7" "\u25c6"))
  (add-hook 'org-mode-hook #'visual-line-mode)

  (require 'nerd-icons)


  (use-package org-fragtog
    :hook (org-mode . org-fragtog-mode))
  (use-package org-latex-impatient
    :defer t
    :hook (org-mode . org-latex-impatient-mode)
    :init
    (setq org-latex-impatient-tex2svg-bin
          ;; location of tex2svg executable
          "/etc/profiles/per-user/mike/bin/tex2svg")
    (setq org-latex-impatient-scale 1.0))
  (use-package
    direnv
    :ensure t
    :config
    (direnv-mode)
    )

  (use-package org-grapher
    :load-path "~/Library/Emacs-Packages/"
    :ensure nil
    :config
    )

  ;; Enable automatic pairing of delimiters
  (electric-pair-mode 1)

  (defun my/prettify-symbols-setup ()
    ;; checkboxes
    (push '("[ ]" . "") prettify-symbols-alist)
    (push '("[X]" . "") prettify-symbols-alist)
    (push '("[-]" . "󱋭" ) prettify-symbols-alist)

    ;; org-abel
    (push '("#+begin_src" . ?\u226b) prettify-symbols-alist)
    (push '("#+end_src" . ?\u226b) prettify-symbols-alist)
    (push '("#+begin_src" . ?\u226b) prettify-symbols-alist)
    (push '("#+end_src" . ?\u226b) prettify-symbols-alist)

    (push '("#+begin_quote" . ?\u275d) prettify-symbols-alist)
    (push '("#+end_quote" . ?\u275e) prettify-symbols-alist)

    ;; drawers
    (push '(":properties:" . "\ueb52") prettify-symbols-alist)

    ;; tags
    (push '(":projects:" . "\uf02d") prettify-symbols-alist)
    (push '(":work:"     . "\uf02d") prettify-symbols-alist)
    (push '(":inbox:"    . "\uf42f") prettify-symbols-alist)
    (push '(":task:"     . "\uf01c") prettify-symbols-alist)
    (push '(":thesis:"   . "\uf448") prettify-symbols-alist)
    (push '(":uio:"      . "\uf448") prettify-symbols-alist)
    (push '(":emacs:"    . "\ue632") prettify-symbols-alist)
    (push '(":learn:"    . "\ue22f") prettify-symbols-alist)
    (push '(":code:"     . "\uf489") prettify-symbols-alist)

    (prettify-symbols-mode))

  (add-hook 'org-mode-hook        #'my/prettify-symbols-setup)
  (add-hook 'org-agenda-mode-hook #'my/prettify-symbols-setup)


  ;; (setq font-use-system-font t)

  (setq org-grapher-notes-directory "~/Documents/Org/")

  (setq select-enable-clipboard nil)
  (setq simpleclip-unmark-on-copy t)
  (setq auto-save-visited-mode t)
  (setq auto-save-visited-interval 20)
  (setq auto-save-interval 20)
  (use-package fira-code-mode)
  (require 'simpleclip)
  (simpleclip-mode 1)
  (add-hook 'org-capture-mode-hook 'evil-insert-state)

  (setq org-capture-templates
        '(("e" "Emacs")
          ("et" "Tasks" entry (file+olp "~/Documents/Org/20251104104130-emacs.org" "Tasks")
           "* %? :emacs:\n:Created: %T" :prepend t)
          ("eq" "Questions" entry (file+olp "~/Documents/Org/20251104104130-emacs.org" "Questions")
           "* %? :emacs:\n:Created: %T" :prepend t)
          ("d" "Django")
          ("dq" "Questions" entry (file+olp "~/Documents/Org/Notes.org" "Tech" "Django" "Questions About Tools and Concepts")
           "* %? :django:\n:Created: %T" :prepend t)
          ("dt" "Tasks" entry (file+olp "~/Documents/Org/Notes.org" "Tech" "Django" "Tasks")
           "* TODO %? :django:\n:Created: %T" :prepend t)
          ("i" "Inbox" entry (file+olp "~/Documents/Org/Notes.org" "Inbox")
           "* %?\n:Created: %T" :prepend t)
          ("s" "Stuff")
          ("sw" "Stuff I Want" item (file+olp "~/Documents/Org/Notes.org" "Life" "Stuff I Want")
           "+ %?\n:Created: %T" :prepend t)
          ("sb" "Stuff to Buy" item (file+olp "~/Documents/Org/Notes.org" "Life" "Stuff to Buy")
           "+ %?\n:Created: %T" :prepend t)
          ("b" "Birds" entry (file+olp "~/Documents/Org/Notes.org" "Life" "Photography" "Birds")
           "* %?" :prepend t)
          ("j" "Journal" entry (file+olp+datetree "~/Documents/Org/journal.org")
           "*  %?\nEntered on %U\n\n")))

  (define-key evil-normal-state-map (kbd ", h c") 'highlight-changes-mode)
  (define-key evil-normal-state-map (kbd ", h p") 'highlight-phrase)
  (define-key evil-normal-state-map (kbd ", h l") 'highlight-lines-matching-regexp)
  (define-key evil-normal-state-map (kbd ", h u") 'unhighlight-regexp)

  (define-key evil-insert-state-map (kbd "M-i") 'org-roam-node-insert)
  (define-key evil-insert-state-map (kbd "M-f") 'org-roam-node-find)
  (define-key evil-insert-state-map (kbd "M-c") 'insert-char)
  (define-key evil-insert-state-map (kbd "M-w") 'forward-word)
  (define-key evil-insert-state-map (kbd "M-d") 'downcase-dwim)

  (define-key evil-normal-state-map (kbd "M-d") 'downcase-dwim)

  ;; j and k should behave like gj and gk
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "gh") 'evil-previous-visual-line)
  ;; Also in visual mode
  (define-key evil-visual-state-map "j" 'evil-next-visual-line)
  (define-key evil-visual-state-map "k" 'evil-previous-visual-line)

  ;; H and L will bring you to the beginning or end of the line
  (define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank-of-visual-line)
  (define-key evil-normal-state-map (kbd "L") 'evil-last-non-blank)

  ;; Better copy/paste
  (define-key evil-visual-state-map (kbd "SPC y") 'simpleclip-copy)
  (global-set-key (kbd "C-S-v") 'simpleclip-paste)
  (with-eval-after-load 'yasnippet
    (keymap-set yas-minor-mode-map "TAB" #'yas-maybe-expand)
    (keymap-set yas-minor-mode-map "<tab>" #'yas-maybe-expand))

  (setq org-agenda-files (quote("~/Documents/Org")))
  (setq org-agenda-include-diary t)

  (use-package web-mode
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("\\.djhtml?\\'" . web-mode))
    (setq web-mode-enable-auto-pairing t)
    (setq web-mode-engines-alist
          '(("django" . "\\.html\\'")))
    (setq web-mode-ac-sources-alist
          '(("css" . (ac-source-css-property))
            ("html" . (ac-source-words-in-buffer ac-source-abbrev)))))
  (setq org-todo-keywords
        `((sequence "TODO(t!)" "PLANNING" "IN-PROGRESS" "WAITING" "HOLD" "NO-TIME" "|" "DONE(!)" "CANCELED@/!)" )))
  (setq org-use-fast-todo-selection t)

  (setq org-roam-directory (file-truename "~/Documents/Org/"))

  (setq org-priority-highest ?A
        org-priority-default ?C
        org-priority-lowest ?D)
  (setq org-priority-faces '((?A :foreground "SteelBlue" :weight bold)
                             (?B :foreground "SteelBlue" :weight bold)
                             (?C :foreground "SteelBlue" :weight bold)
                             (?D :foreground "SteelBlue" :weight bold)))
  (setq org-todo-keyword-faces
        '(
          ("TODO" . (:foreground "Gold" :weight bold))
          ("PLANNING" . (:foreground "PaleGreen" :weight bold))
          ("IN-PROGRESS" . (:foreground "MediumPurple2" :weight bold))
          ("WAITING" . (:foreground "DarkOrange" :weight bold))
          ("HOLD" . (:foreground "Red" :weight bold))
          ("NO-TIME" . (:foreground "Pink" :weight bold))
          ("DONE" . (:foreground "LimeGreen" :weight bold))
          ("CANCELED" . (:foreground "LimeGreen" :weight bold))
          ))
  ;; The rest has been taken from nick anderson.
  ;; https://github.com/nickanderson/Level-up-your-notes-with-Org/blob/8539fe3119d5345631dc99fe180b6b83090312bf/dot-spacemacs#L269


  ;; When hitting alt-return on a header, please create a new one without
  ;; messing up the one I'm standing on.
  (setq org-insert-heading-respect-content t)

  ;; Resolve open-clocks if idle more than 30 minutes
  (setq org-clock-idle-time 30)

  (setq org-format-latex-options (plist-put org-format-latex-options :scale 3))
  (setq org-startup-with-inline-images t)
  (setq projectile-project-search-path '("~/Code/", "~/Documents/Zettlekasten/", "~/.config/nvim/"))
  (spacemacs/set-leader-keys
    "oc" 'org-capture
    "oa" 'org-agenda
    "osl" 'org-store-link
    "ol" 'org-insert-last-stored-link
    "on" 'bookmark-jump
    "oh" 'consult-org-heading
    "oi" 'org-roam-node-insert
    "of" 'org-roam-node-find
    "od" 'org-roam-db-sync
    )

  ;; Enable ligatures in programming modes
  (ligature-set-ligatures 'org-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                      ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                      "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                      "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                      "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                      "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                      "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                      "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                      "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                      "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

  (global-ligature-mode 't)

  (setq org-export-with-broken-links t)

  (custom-set-faces
   '(org-code ((t (:foreground "medium sea green"))))
   '(org-link ((t (:foreground "medium aquamarine" :underline t))))
   '(org-verbatim ((t (:foreground "indian red")))))

  ;; (add-hook 'org-capture-prepare-finalize-hook 'org-id-get-create)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     ;; (sh . t)
     (python . t)
     (calc . t)
     ))
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
   '(blink-cursor-mode nil)
   '(company-minimum-prefix-length 5)
   '(custom-safe-themes
     '("4d5d11bfef87416d85673947e3ca3d3d5d985ad57b02a7bb2e32beaf785a100e"
       "720838034f1dd3b3da66f6bd4d053ee67c93a747b219d1c546c41c4e425daf93"
       "cffbae32e5e3859f671c4b1dc2a0d95a4a6f2d071f7d9b9adbe66aaf1a865008"
       "b9c3cad81999816c55bad4904db1c955702cac2de1c8042f8c998455134bcdd6"
       "fdaf036ac62069f9b785ad2486b8106fb704b7c898d73ff7f66dc657523349d3"
       "24fba8d15d029ca2ed94dc4722459e9b64d679d7ae14b77b61412e2c85b3b641"
       "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1"
       "236b9b9af6ebae43d98b934d27566ddaf9e47bdcb101d945435aeac0e4e9a73d"
       "ade194273a74776a3043049bdab532587813493ec9530d9ec7bb19c29c3ee8bd"
       "ebdf1a86b77a768fb43e4b3e39766326b53974479b040eb0da5324431a7bf2be"
       "74e27bf8147ee1bc825fdd819f9d3e85869979dec40c5105f18149bedb4bd881" default))
   '(flycheck-checkers
     '(lsp emacs-lisp-elsa ada-gnat asciidoctor asciidoc awk-gawk
           bazel-build-buildifier bazel-module-buildifier
           bazel-starlark-buildifier bazel-workspace-buildifier c/c++-clang
           c/c++-gcc c/c++-cppcheck cfengine coffee coffee-coffeelint css-csslint
           css-stylelint cuda-nvcc cwl d-dmd dockerfile-hadolint elixir-credo
           emacs-lisp emacs-lisp-checkdoc ember-template erlang-rebar3 erlang
           eruby-erubis eruby-ruumba fortran-gfortran go-gofmt go-vet go-build
           go-test go-errcheck go-unconvert go-staticcheck groovy haml haml-lint
           handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy
           javascript-eslint javascript-jshint javascript-standard json-jsonlint
           json-python-json json-jq jsonnet less less-stylelint llvm-llc
           lua-luacheck lua markdown-markdownlint-cli markdown-markdownlint-cli2
           markdown-mdl markdown-pymarkdown nix nix-linter opam perl
           perl-perlcritic perl-perlimports php php-phpmd php-phpcs
           php-phpcs-changed processing proselint protobuf-protoc
           protobuf-prototool pug puppet-parser puppet-lint python-flake8
           python-pylint python-pycompile python-pyright python-mypy r-lintr r
           racket rpm-rpmlint rst-sphinx rst ruby-rubocop ruby-chef-cookstyle
           ruby-standard ruby-reek ruby ruby-jruby rust-cargo rust rust-clippy
           salt-lint scala scala-scalastyle scheme-chicken scss-lint
           sass-stylelint scss-stylelint sass/scss-sass-lint sass scss sh-bash
           sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint
           sql-sqlint statix systemd-analyze tcl-nagelfar terraform
           terraform-tflint tex-chktex tex-lacheck texinfo textlint
           typescript-tslint verilog-verilator vhdl-ghdl xml-xmlstarlet
           xml-xmllint yaml-actionlint yaml-jsyaml yaml-ruby yaml-yamllint
           emacs-lisp-package))
   '(markdown-fontify-code-blocks-natively t)
   '(org-agenda-block-separator 61)
   '(org-agenda-files
     '("~/Documents/Org/" "~/Documents/Org/Notes.org" "~/Documents/Org/daily/"))
   '(org-link-translation-function 'toc-org-unhrefify)
   '(org-num-face nil)
   '(org-pretty-entities nil)
   '(package-selected-packages
     '(ace-jump-helm-line ace-link afternoon-theme aggressive-indent alect-themes
                          all-the-icons ample-theme ample-zen-theme amsreftex
                          anti-zenburn-theme apropospriate-theme auctex
                          auto-compile auto-highlight-symbol auto-yasnippet
                          autothemer badwolf-theme birds-of-paradise-plus-theme
                          blacken bubbleberry-theme busybee-theme cdlatex
                          centered-cursor-mode cherry-blossom-theme
                          chocolate-theme clean-aindent-mode clues-theme
                          code-cells code-review color-theme-sanityinc-solarized
                          color-theme-sanityinc-tomorrow column-enforce-mode
                          company-auctex company-lua company-math
                          company-nixos-options company-reftex company-web
                          consult-lsp csv-mode cyberpunk-theme cython-mode
                          dakrone-theme dap-mode darkmine-theme darkokai-theme
                          darktooth-theme define-word devdocs diminish
                          dired-quick-sort direnv disable-mouse django-theme
                          djangonaut doom-themes dotenv-mode dracula-theme
                          drag-stuff dumb-jump eat edit-indirect ef-themes
                          elisp-def elisp-demos elisp-slime-nav emmet-mode emr
                          espresso-theme eval-sexp-fu evil-anzu evil-args
                          evil-cleverparens evil-collection evil-easymotion
                          evil-escape evil-evilified-state evil-exchange
                          evil-goggles evil-iedit-state evil-indent-plus evil-lion
                          evil-numbers evil-org evil-surround evil-tex
                          evil-textobj-line evil-tutor evil-unimpaired
                          evil-visual-mark-mode evil-visualstar exotica-theme
                          expand-region eyebrowse eziam-themes fancy-battery
                          farmhouse-themes fira-code-mode flatland-theme
                          flatui-theme flycheck-elsa flycheck-package
                          flycheck-pos-tip flyspell-correct-helm gandalf-theme
                          ggtags gh-md git-link git-messenger git-modes
                          git-timemachine gitignore-templates gnuplot golden-ratio
                          google-translate gotham-theme grandshell-theme
                          gruber-darker-theme gruvbox-theme hc-zenburn-theme
                          helm-ag helm-c-yasnippet helm-comint helm-company
                          helm-css-scss helm-descbinds helm-git-grep helm-ls-git
                          helm-lsp helm-make helm-mode-manager helm-nixos-options
                          helm-org helm-org-rifle helm-projectile helm-purpose
                          helm-pydoc helm-swoop helm-themes helm-xref hemisu-theme
                          heroku-theme hide-comnt highlight-indentation
                          highlight-numbers highlight-parentheses hl-todo
                          holy-mode hungry-delete hybrid-mode impatient-mode
                          indent-guide info+ inkpot-theme inspector ir-black-theme
                          jazz-theme jbeans-theme js-doc js2-refactor json-mode
                          json-navigator json-reformat kaolin-themes ligature
                          light-soap-theme link-hint live-py-mode livid-mode
                          lorem-ipsum lsp-latex lsp-mode lsp-origami lsp-pyright
                          lsp-treemacs lsp-ui lua-mode lush-theme macrostep
                          madhat2r-theme magit-popup markdown-toc material-theme
                          math-symbol-lists minimal-theme modus-themes moe-theme
                          molokai-theme monochrome-theme monokai-theme multi-line
                          mustang-theme mwim nameless names naquadah-theme
                          nerd-icons nix-mode noctilux-theme nodejs-repl npm-mode
                          oauth obsidian-theme occidental-theme oldlace-theme
                          omtose-phellack-themes open-junk-file org-cliplink
                          org-contrib org-download org-fragtog org-journal
                          org-latex-impatient org-mime org-modern org-noter
                          org-pomodoro org-present org-projectile org-rich-yank
                          org-roam org-roam-ui org-super-agenda org-superstar
                          org-transclusion organic-green-theme orgit-forge origami
                          overseer ox-pandoc page-break-lines pandoc-mode paradox
                          password-generator pcre2el pdf-continuous-scroll-mode
                          pdf-tools pdf-view-restore pet phoenix-dark-mono-theme
                          phoenix-dark-pink-theme pip-requirements pipenv pippel
                          planet-theme poetry popwin prettier-js
                          professional-theme pug-mode purple-haze-theme py-isort
                          pydoc pyenv-mode pylookup pytest quickrun
                          railscasts-theme rainbow-delimiters ranger rebecca-theme
                          reformatter restart-emacs reverse-theme ruff-format
                          sass-mode scss-mode seti-theme simpleclip slim-mode
                          smeargle smyx-theme soft-charcoal-theme
                          soft-morning-theme soft-stone-theme solarized-theme
                          soothe-theme space-doc spacegray-theme spaceline
                          spacemacs-purpose-popwin spacemacs-whitespace-cleanup
                          sphinx-doc string-edit-at-point string-inflection
                          subatomic-theme subatomic256-theme sublime-themes
                          sunny-day-theme symbol-overlay symon system-packages
                          tablist tagedit tango-2-theme tango-plus-theme
                          tangotango-theme tao-theme term-cursor tern toc-org
                          toxi-theme treemacs-evil treemacs-icons-dired
                          treemacs-magit treemacs-persp treemacs-projectile
                          twilight-anti-bright-theme twilight-bright-theme
                          twilight-theme ujelly-theme ultra-scroll
                          underwater-theme undo-fu undo-fu-session unfill uniline
                          valign vi-tilde-fringe vmd-mode volatile-highlights
                          vundo web-beautify web-mode websocket wgrep
                          white-sand-theme wiki-summary winum yasnippet-snippets
                          yatemplate zen-and-art-theme zenburn-theme zonokai-emacs
                          zotero zotra))
   '(zotero-auth-token #s(zotero-auth-token "" "" nil nil) t))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:background nil))))
   '(org-code ((t (:foreground "medium sea green"))))
   '(org-level-1 ((t (:inherit bold :extend nil :foreground "goldenrod" :height 1.3))))
   '(org-level-3 ((t (:extend nil :foreground "medium sea green" :weight normal :height 1.1))))
   '(org-level-4 ((t (:extend nil :foreground "medium purple" :weight normal))))
   '(org-link ((t (:foreground "medium aquamarine" :underline t))))
   '(org-verbatim ((t (:foreground "indian red")))))
  )
