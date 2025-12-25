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
    theming

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
   dotspacemacs-themes '(zenburn
                         spacemacs-dark
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
                               :size 12.0
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
  (require 'simpleclip)
  (simpleclip-mode 1)
  (add-hook 'org-capture-mode-hook 'evil-insert-state)

  (setq org-capture-templates
        '(("e" "Emacs")
          ("et" "Tasks" entry (file+olp "~/Documents/Org/20251104104130-emacs.org" "Tasks")
           "* %? :emacs:\n:Created: %T" :prepend t)
          ("eq" "Questions" entry (file+olp "~/Documents/Org/20251104104130-emacs.org" "Questions")
           "* %? :emacs:\n:Created: %T" :prepend t)
          ;; ("d" "Django")
          ;; ("dq" "Questions" entry (file+olp "~/Documents/Org/Notes.org" "Tech" "Django" "Questions About Tools and Concepts")
          ;;  "* %? :django:\n:Created: %T" :prepend t)
          ;; ("dt" "Tasks" entry (file+olp "~/Documents/Org/Notes.org" "Tech" "Django" "Tasks")
          ;;  "* TODO %? :django:\n:Created: %T" :prepend t)
          ;; ("i" "Inbox" entry (file+olp "~/Documents/Org/Notes.org" "Inbox")
          ;;  "* %?\n:Created: %T" :prepend t)
          ;; ("s" "Stuff")
          ;; ("sw" "Stuff I Want" item (file+olp "~/Documents/Org/Notes.org" "Life" "Stuff I Want")
          ;;  "+ %?\n:Created: %T" :prepend t)
          ;; ("sb" "Stuff to Buy" item (file+olp "~/Documents/Org/Notes.org" "Life" "Stuff to Buy")
          ;;  "+ %?\n:Created: %T" :prepend t)
          ;; ("b" "Birds" entry (file+olp "~/Documents/Org/Notes.org" "Life" "Photography" "Birds")
          ;;  "* %?" :prepend t)
          ;; ("j" "Journal" entry (file+olp+datetree "~/Documents/Org/journal.org")
          ;;  "*  %?\nEntered on %U\n\n")
          ("j" "journal" entry (file "~/Documents/Org/20251211203914-journal.org")
           "* %?\nEntered on %T\n\n" :empty-lines 1 :prepend t)))

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
  ;; (define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank-of-visual-line)
  (define-key evil-normal-state-map (kbd "H") 'evil-beginning-of-visual-line)
  (define-key evil-normal-state-map (kbd "L") 'evil-end-of-visual-line)
  ;; (define-key evil-normal-state-map (kbd "L") (kbd "g $"))


  ;; Better copy/paste
  (define-key evil-visual-state-map (kbd "SPC y") 'simpleclip-copy)
  (global-set-key (kbd "C-S-v") 'simpleclip-paste)
                                        ; (with-eval-after-load 'yasnippet
                                        ;   (keymap-set yas-minor-mode-map "TAB" #'yas-maybe-expand)
                                        ;   (keymap-set yas-minor-mode-map "<tab>" #'yas-maybe-expand))

  (define-key yas-minor-mode-map (kbd "<tab>") yas-maybe-expand)
  (define-key yas-minor-mode-map (kbd "TAB") yas-maybe-expand)

  (setq company-minimum-prefix-length 5)

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

  (add-hook 'emacs-startup-hook
            (lambda ()
              (org-roam-node-open
               (org-roam-node-from-title-or-alias "journal"))))

  (defun mike/org-roam-open-journal ()
    "Open my Org-roam Journal node."
    (interactive)
    (org-roam-node-open
     (org-roam-node-from-title-or-alias "journal")))


  (setq org-format-latex-options (plist-put org-format-latex-options :scale 2.25))
  (setq org-startup-with-inline-images t)
  (setq projectile-project-search-path '("~/Code/", "~/Documents/Zettlekasten/", "~/.config/nvim/"))
  (spacemacs/set-leader-keys
    "oc" 'org-capture
    "oa" 'org-agenda
    ;; "osl" 'org-store-link
    "ol" 'org-insert-last-stored-link
    "on" 'bookmark-jump
    "oh" 'consult-org-heading
    "oi" 'org-roam-node-insert
    "of" 'org-roam-node-find
    "os" 'org-roam-db-sync
    "ob" 'org-roam-buffer-toggle
    "od" 'org-roam-dailies-goto-today
    "ot" 'org-roam-dailies-goto-tomorrow
    "oj" #'mike/org-roam-open-journal
    "oy" 'org-roam-dailies-goto-yesterday
    )

  (use-package ligature
    :config
    (ligature-set-ligatures 'org-mode '("--" "---" "==" "===" "!=" "!==" "=!="
                                        "=:=" "=/=" "<=" ">=" "&&" "&&&" "&=" "++" "+++" "***" ";;" "!!"
                                        "??" "???" "?:" "?." "?=" "<:" ":<" ":>" ">:" "<:<" "<>" "<<<" ">>>"
                                        "<<" ">>" "||" "-|" "_|_" "|-" "||-" "|=" "||=" "##" "###" "####"
                                        "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#=" "^=" "<$>" "<$"
                                        "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</" "</>" "/>" "<!--" "<#--"
                                        "-->" "->" "->>" "<<-" "<-" "<=<" "=<<" "<<=" "<==" "<=>" "<==>"
                                        "==>" "=>" "=>>" ">=>" ">>=" ">>-" ">-" "-<" "-<<" ">->" "<-<" "<-|"
                                        "<=|" "|=>" "|->" "<->" "<~~" "<~" "<~>" "~~" "~~>" "~>" "~-" "-~"
                                        "~@" "[||]" "|]" "[|" "|}" "{|" "[<" ">]" "|>" "<|" "||>" "<||"
                                        "|||>" "<|||" "<|>" "..." ".." ".=" "..<" ".?" "::" ":::" ":=" "::="
                                        ":?" ":?>" "//" "///" "/*" "*/" "/=" "//=" "/==" "@_" "__" "???"
                                        "<:<" ";;;"))
    (global-ligature-mode t))

  (setq org-export-with-broken-links t)

  ;; (add-hook 'org-capture-prepare-finalize-hook 'org-id-get-create)
  (setq org-babel-sh-shell "bash")


  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (shell . t)
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
   '(custom-enabled-themes '(zenburn))
   '(custom-safe-themes
     '("972f792651d32b0506481b9e87b2fbc9b732ae9da2527562668c6e7d149fefda"
       "4d5d11bfef87416d85673947e3ca3d3d5d985ad57b02a7bb2e32beaf785a100e"
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
     '("/home/mike/Documents/Org/20251028201323-the_scientific_method.org"
       "/home/mike/Documents/Org/20251028202250-plasma.org"
       "/home/mike/Documents/Org/20251028203908-atomic_theory.org"
       "/home/mike/Documents/Org/20251028204048-democritus.org"
       "/home/mike/Documents/Org/20251028204433-john_dalton.org"
       "/home/mike/Documents/Org/20251028204650-atoms.org"
       "/home/mike/Documents/Org/20251028204744-hantaro_nagaoka.org"
       "/home/mike/Documents/Org/20251028204831-nucleus.org"
       "/home/mike/Documents/Org/20251028204851-electrons.org"
       "/home/mike/Documents/Org/20251028205219-ernest_rutherford.org"
       "/home/mike/Documents/Org/20251028205249-cathode_ray_tube_experiment.org"
       "/home/mike/Documents/Org/20251028210047-how_did_scientists_first_determine_molecular_structure.org"
       "/home/mike/Documents/Org/20251028210405-what_order_do_we_write_elements_within_molecules_compounds.org"
       "/home/mike/Documents/Org/20251028210441-what_s_the_benefit_of_empirical_formulas.org"
       "/home/mike/Documents/Org/20251028213655-protons.org"
       "/home/mike/Documents/Org/20251028213712-neutrons.org"
       "/home/mike/Documents/Org/20251029054341-chemistry.org"
       "/home/mike/Documents/Org/20251029054846-physics.org"
       "/home/mike/Documents/Org/20251029055039-latex.org"
       "/home/mike/Documents/Org/20251029055243-computer_science_degree.org"
       "/home/mike/Documents/Org/20251029055409-academic_upgrading.org"
       "/home/mike/Documents/Org/20251029055530-homework.org"
       "/home/mike/Documents/Org/20251029060337-how_do_special_isomers_work.org"
       "/home/mike/Documents/Org/20251029161614-chemical_bonding.org"
       "/home/mike/Documents/Org/20251029161705-ionic_bonds.org"
       "/home/mike/Documents/Org/20251029162245-ions.org"
       "/home/mike/Documents/Org/20251029192122-why_do_electrons_use_subshell_4s_before_3d.org"
       "/home/mike/Documents/Org/20251029192552-what_is_the_energy_source_that_electrons_need_to_transfer_to_another_atom.org"
       "/home/mike/Documents/Org/20251029192656-when_were_subshell_orbitals_discovered.org"
       "/home/mike/Documents/Org/20251029193050-is_group_13_interchangeable_with_group_3_on_the_periodic_table.org"
       "/home/mike/Documents/Org/20251029193356-is_the_4d_subshell_part_of_the_fourth_or_fifth_shell_of_the_atom.org"
       "/home/mike/Documents/Org/20251029193500-can_all_elements_form_a_chemical_bond.org"
       "/home/mike/Documents/Org/20251029193717-what_do_covalent_bonds_actually_look_like.org"
       "/home/mike/Documents/Org/20251029193906-were_the_single_letter_elements_named_first.org"
       "/home/mike/Documents/Org/20251029194003-the_periodic_table.org"
       "/home/mike/Documents/Org/20251029205640-matter.org"
       "/home/mike/Documents/Org/20251029205828-elements.org"
       "/home/mike/Documents/Org/20251029205912-how_did_they_first_determine_the_atomic_mass_of_elements.org"
       "/home/mike/Documents/Org/20251029205954-atomic_mass.org"
       "/home/mike/Documents/Org/20251029210203-how_did_dmitri_mendeleev_know_the_number_of_protons_for_each_element_in_the_periodic_table.org"
       "/home/mike/Documents/Org/20251029210234-the_periodic_table.org"
       "/home/mike/Documents/Org/20251029210546-what_are_artificial_elements.org"
       "/home/mike/Documents/Org/20251029210905-scientic_laws_principles.org"
       "/home/mike/Documents/Org/20251029211132-periodic_law_properties_of_elements_repeat_in_periodic_functions_of_their_atomic_number.org"
       "/home/mike/Documents/Org/20251029211258-what_are_the_properties_of_the_different_groups_on_the_periodic_table.org"
       "/home/mike/Documents/Org/20251029211416-how_are_these_groups_used_in_the_world.org"
       "/home/mike/Documents/Org/20251029211709-john_dalton_s_atomic_theory.org"
       "/home/mike/Documents/Org/20251029211820-law_of_multiple_proportions.org"
       "/home/mike/Documents/Org/20251029212539-what_energy_does_matter_possess.org"
       "/home/mike/Documents/Org/20251029212635-what_is_the_difinition_of_matter.org"
       "/home/mike/Documents/Org/20251029212712-chemical_changes.org"
       "/home/mike/Documents/Org/20251029212841-physical_changes.org"
       "/home/mike/Documents/Org/20251029213037-physical_properties_of_elements.org"
       "/home/mike/Documents/Org/20251029213258-chemical_properties.org"
       "/home/mike/Documents/Org/20251029213508-classification_of_matter.org"
       "/home/mike/Documents/Org/20251029213633-pure_substances.org"
       "/home/mike/Documents/Org/20251029213644-mixtures.org"
       "/home/mike/Documents/Org/20251029213829-chemistry_is_the_study_of_changes_in_matter_physical_and_chemical.org"
       "/home/mike/Documents/Org/20251029213917-theories_say_why_laws_say_what.org"
       "/home/mike/Documents/Org/20251029214100-how_long_does_it_take_for_copper_powder_and_oxygen_take_to_undergo_a_chemical_change.org"
       "/home/mike/Documents/Org/20251029214258-why_do_molecules_elements_feel_the_need_to_compound_in_the_first_place_what_determines_weather_a_reaction_occurs_or_not.org"
       "/home/mike/Documents/Org/20251029214449-law_of_conservation_of_mass.org"
       "/home/mike/Documents/Org/20251029214707-law_of_definite_composition.org"
       "/home/mike/Documents/Org/20251029215935-why_was_it_originally_hypothesized_that_atoms_had_a_positive_and_a_negative_charge.org"
       "/home/mike/Documents/Org/20251029220507-millikan_s_oil_dropplets_experiment.org"
       "/home/mike/Documents/Org/20251031220322-covalent_radii.org"
       "/home/mike/Documents/Org/20251031221203-what_are_some_trends_seen_across_the_periodic_table.org"
       "/home/mike/Documents/Org/20251031224853-naming_ionic_compounds.org"
       "/home/mike/Documents/Org/20251031225305-cation.org"
       "/home/mike/Documents/Org/20251031225334-anion.org"
       "/home/mike/Documents/Org/20251031230410-valence_shell.org"
       "/home/mike/Documents/Org/20251101103112-electronegativity.org"
       "/home/mike/Documents/Org/20251101103208-valence_shell.org"
       "/home/mike/Documents/Org/20251101103909-principle_energy_levels.org"
       "/home/mike/Documents/Org/20251101104126-molecules.org"
       "/home/mike/Documents/Org/20251101104542-compounds.org"
       "/home/mike/Documents/Org/20251101104714-metallic_bonds.org"
       "/home/mike/Documents/Org/20251101122823-what_is_the_inert_pair_effect.org"
       "/home/mike/Documents/Org/20251101123037-orbitals.org"
       "/home/mike/Documents/Org/20251101124514-electron_affinity.org"
       "/home/mike/Documents/Org/20251101124832-gases.org"
       "/home/mike/Documents/Org/20251101125259-ionization_energy.org"
       "/home/mike/Documents/Org/20251101131342-oxidation_state.org"
       "/home/mike/Documents/Org/20251101132233-what_is_the_shielding_effect.org"
       "/home/mike/Documents/Org/20251101134923-electron_subshells.org"
       "/home/mike/Documents/Org/20251101134953-hund_s_rule.org"
       "/home/mike/Documents/Org/20251101135901-degenerate_subshells.org"
       "/home/mike/Documents/Org/20251101151553-atomic_radii.org"
       "/home/mike/Documents/Org/20251101153104-electron_shells.org"
       "/home/mike/Documents/Org/20251101155115-transition_metals.org"
       "/home/mike/Documents/Org/20251101155900-how_to_determine_an_elements_perpensity_to_form_a_positive_or_a_negative_ion.org"
       "/home/mike/Documents/Org/20251101160213-naming_ionic_compounds_do_i_need_to_include_the_charge_of_my_ions_in_the_form_of_roman_numerals_within_parenthesis_i_e_ⅱ.org"
       "/home/mike/Documents/Org/20251101185823-why_did_albert_einstein_call_galileo_galilei_the_father_of_modern_science.org"
       "/home/mike/Documents/Org/20251101185842-galileo_galilei.org"
       "/home/mike/Documents/Org/20251101185856-albert_einstein.org"
       "/home/mike/Documents/Org/20251102095854-life.org"
       "/home/mike/Documents/Org/20251102095948-ideas.org"
       "/home/mike/Documents/Org/20251102100026-my_custom_designed_todo_list.org"
       "/home/mike/Documents/Org/20251102103423-iupac_international_union_of_pure_and_applied_chemistry.org"
       "/home/mike/Documents/Org/20251102111432-how_were_atoms_formed.org"
       "/home/mike/Documents/Org/20251102173554-polyatomic_ions.org"
       "/home/mike/Documents/Org/20251102173634-polyatomic_ionic_bonds.org"
       "/home/mike/Documents/Org/20251103122956-what_s_the_benefit_of_a_stable_atom.org"
       "/home/mike/Documents/Org/20251103124924-polar_substances.org"
       "/home/mike/Documents/Org/20251103125059-characteristics_of_polar_substances.org"
       "/home/mike/Documents/Org/20251103125156-polar_bonds.org"
       "/home/mike/Documents/Org/20251103125356-electrolytes.org"
       "/home/mike/Documents/Org/20251103130355-multi_valent_ions.org"
       "/home/mike/Documents/Org/20251103130517-organic_compounds.org"
       "/home/mike/Documents/Org/20251103130542-zinc.org"
       "/home/mike/Documents/Org/20251103135731-why_does_zinc_shed_it_s_s_subshell_before_it_s_d_subshell.org"
       "/home/mike/Documents/Org/20251103210024-projectile_motion.org"
       "/home/mike/Documents/Org/20251103210049-greek_symbols.org"
       "/home/mike/Documents/Org/20251103215058-projectiles.org"
       "/home/mike/Documents/Org/20251103215123-gravity.org"
       "/home/mike/Documents/Org/20251103215308-trajectory.org"
       "/home/mike/Documents/Org/20251103215939-mass.org"
       "/home/mike/Documents/Org/20251103220303-horizontal_motion.org"
       "/home/mike/Documents/Org/20251103220331-uniform_motion.org"
       "/home/mike/Documents/Org/20251104103946-shit_that_needs_to_get_done.org"
       "/home/mike/Documents/Org/20251104104004-build_a_better_cat_litter_box_enclosure.org"
       "/home/mike/Documents/Org/20251104104020-organize_all_of_my_fucking_cables.org"
       "/home/mike/Documents/Org/20251104104054-figure_out_how_to_minimize_electronic_coil_whine_in_my_office_either_through_new_electronics_or_with_sound_dampening_enclosure.org"
       "/home/mike/Documents/Org/20251104104130-emacs.org"
       "/home/mike/Documents/Org/20251104104137-org_mode.org"
       "/home/mike/Documents/Org/20251104104159-prettify_checkboxes.org"
       "/home/mike/Documents/Org/20251104104258-implement_strikethrough_for_my_completed_task_items.org"
       "/home/mike/Documents/Org/20251104105114-figure_out_how_to_make_source_blocks_look_nicer_more_like_doom_or_obsidian.org"
       "/home/mike/Documents/Org/20251104105207-yassnippets_no_longer_tab_completes_needs_to_be_fixed.org"
       "/home/mike/Documents/Org/20251104131358-describing_the_kinematics_formulas.org"
       "/home/mike/Documents/Org/20251104131440-kinematics.org"
       "/home/mike/Documents/Org/20251104174121-how_was_the_fractional_abundance_of_atoms_determined.org"
       "/home/mike/Documents/Org/20251104175446-isotopes.org"
       "/home/mike/Documents/Org/20251104175726-mass_spectrometer.org"
       "/home/mike/Documents/Org/20251104180334-magnetic_field.org"
       "/home/mike/Documents/Org/20251104180628-charge.org"
       "/home/mike/Documents/Org/20251104180912-fractional_abundanc.org"
       "/home/mike/Documents/Org/20251104201940-aristotle.org"
       "/home/mike/Documents/Org/20251104202156-lucippus.org"
       "/home/mike/Documents/Org/20251104203401-radioactivity.org"
       "/home/mike/Documents/Org/20251104203804-j_j_thompson.org"
       "/home/mike/Documents/Org/20251104204858-cathode_ray.org"
       "/home/mike/Documents/Org/20251104205307-vacuum.org"
       "/home/mike/Documents/Org/20251105221231-polar_covelant_bond.org"
       "/home/mike/Documents/Org/20251105221844-linus_pauling.org"
       "/home/mike/Documents/Org/20251105223119-pauling_scale.org"
       "/home/mike/Documents/Org/20251106082608-effective_nuclear_charge.org"
       "/home/mike/Documents/Org/20251106083730-electrostatic.org"
       "/home/mike/Documents/Org/20251106110122-monatomic_ions.org"
       "/home/mike/Documents/Org/20251106110855-carbon.org"
       "/home/mike/Documents/Org/20251106110919-hydrogen.org"
       "/home/mike/Documents/Org/20251106120333-photons.org"
       "/home/mike/Documents/Org/20251106134057-sub_atomic.org"
       "/home/mike/Documents/Org/20251106135229-atomic_mass_units.org"
       "/home/mike/Documents/Org/20251108140308-electromagnetic_interferance.org"
       "/home/mike/Documents/Org/20251108140359-set_up_my_3d_printer.org"
       "/home/mike/Documents/Org/20251108142519-fix_big_brother_printer.org"
       "/home/mike/Documents/Org/20251108143052-building_an_electrical_distribution_system_for_my_workshop.org"
       "/home/mike/Documents/Org/20251108151920-add_drawer_liner_to_my_workshop_drawers.org"
       "/home/mike/Documents/Org/20251109092156-3d_printing.org"
       "/home/mike/Documents/Org/20251109142931-gridfinity.org"
       "/home/mike/Documents/Org/20251110125202-garage.org"
       "/home/mike/Documents/Org/20251110125259-home_organization.org"
       "/home/mike/Documents/Org/20251110125608-work_van.org"
       "/home/mike/Documents/Org/20251112140748-gases.org"
       "/home/mike/Documents/Org/20251114165558-shit_to_get_done_before_i_return_to_work.org"
       "/home/mike/Documents/Org/20251114170111-hyprland.org"
       "/home/mike/Documents/Org/20251114171334-furnace_take_off_for_garage.org"
       "/home/mike/Documents/Org/20251114180659-org_roam.org"
       "/home/mike/Documents/Org/20251114182642-air_resistance.org"
       "/home/mike/Documents/Org/20251114182926-vertical_motion.org"
       "/home/mike/Documents/Org/20251114183708-sir_isaac_newton.org"
       "/home/mike/Documents/Org/20251114183803-three_laws_of_motion.org"
       "/home/mike/Documents/Org/20251114184813-ballistics.org"
       "/home/mike/Documents/Org/20251114184915-parabola.org"
       "/home/mike/Documents/Org/20251114185217-total_velocity.org"
       "/home/mike/Documents/Org/20251114185259-resultant.org"
       "/home/mike/Documents/Org/20251114195610-vector.org"
       "/home/mike/Documents/Org/20251114195624-total_velocity.org"
       "/home/mike/Documents/Org/20251114195642-velocity.org"
       "/home/mike/Documents/Org/20251115112913-trigonometry.org"
       "/home/mike/Documents/Org/20251116174444-lattice.org"
       "/home/mike/Documents/Org/20251117142442-chemistry.org"
       "/home/mike/Documents/Org/20251117143424-nuclear_physics.org"
       "/home/mike/Documents/Org/20251117143820-micheal_faraday.org"
       "/home/mike/Documents/Org/20251117144256-gold_foil_experiment.org"
       "/home/mike/Documents/Org/20251117144500-alpha_particles.org"
       "/home/mike/Documents/Org/20251117174347-compendium_of_chemical_terminology.org"
       "/home/mike/Documents/Org/20251118215040-gifts.org"
       "/home/mike/Documents/Org/20251118222915-org_agenda.org"
       "/home/mike/Documents/Org/20251119152740-noble_gases.org"
       "/home/mike/Documents/Org/20251119154059-empiral_formula.org"
       "/home/mike/Documents/Org/20251119154154-molecular_formula.org"
       "/home/mike/Documents/Org/20251119155612-lee_cronin_s_3d_printer_for_medications.org"
       "/home/mike/Documents/Org/20251120130359-net_force.org"
       "/home/mike/Documents/Org/20251120131704-law_of_acceleration.org"
       "/home/mike/Documents/Org/20251121114947-note_taking.org"
       "/home/mike/Documents/Org/20251121120905-significant_digits.org"
       "/home/mike/Documents/Org/20251121121300-terms.org"
       "/home/mike/Documents/Org/20251121121339-standard_units.org"
       "/home/mike/Documents/Org/20251121122510-anatomy_of_an_answer.org"
       "/home/mike/Documents/Org/20251121122754-how_do_you_mathematically_get_s_2.org"
       "/home/mike/Documents/Org/20251121123912-commutative.org"
       "/home/mike/Documents/Org/20251121124213-pre_course_knowledge_question_about_gravity.org"
       "/home/mike/Documents/Org/20251121134416-friction.org"
       "/home/mike/Documents/Org/20251122114856-isomers.org"
       "/home/mike/Documents/Org/20251122115619-chemical_reaction.org"
       "/home/mike/Documents/Org/20251122121046-spacial_isomers.org"
       "/home/mike/Documents/Org/20251122121741-enantiomers.org"
       "/home/mike/Documents/Org/20251122122156-superimpose.org"
       "/home/mike/Documents/Org/20251122122514-moles.org"
       "/home/mike/Documents/Org/20251122124212-avogradro_s_number.org"
       "/home/mike/Documents/Org/20251122141246-macroscopic.org"
       "/home/mike/Documents/Org/20251122141355-microscopic.org"
       "/home/mike/Documents/Org/20251122143544-molar_mass.org"
       "/home/mike/Documents/Org/20251122155543-molarity.org"
       "/home/mike/Documents/Org/20251122155711-solute.org"
       "/home/mike/Documents/Org/20251122155745-solvent.org"
       "/home/mike/Documents/Org/20251122155935-solution.org"
       "/home/mike/Documents/Org/20251122160334-homogeneous_mixture.org"
       "/home/mike/Documents/Org/20251122161018-aqueous_solution.org"
       "/home/mike/Documents/Org/20251122161109-concentration.org"
       "/home/mike/Documents/Org/20251122161353-dilute.org"
       "/home/mike/Documents/Org/20251122163519-factor_label_method.org"
       "/home/mike/Documents/Org/20251123124604-solubility.org"
       "/home/mike/Documents/Org/20251123124636-substance.org"
       "/home/mike/Documents/Org/20251123124738-coefficient.org"
       "/home/mike/Documents/Org/20251123124913-acid.org"
       "/home/mike/Documents/Org/20251123125016-precipitate.org"
       "/home/mike/Documents/Org/20251123125059-reactant.org"
       "/home/mike/Documents/Org/20251123125225-product.org"
       "/home/mike/Documents/Org/20251123132259-acid_base_reaction.org"
       "/home/mike/Documents/Org/20251123132639-base.org"
       "/home/mike/Documents/Org/20251123132754-stoichiometry.org"
       "/home/mike/Documents/Org/20251123132838-strong_acid.org"
       "/home/mike/Documents/Org/20251123132946-strong_base.org"
       "/home/mike/Documents/Org/20251123133032-weak_acid.org"
       "/home/mike/Documents/Org/20251123133139-weak_base.org"
       "/home/mike/Documents/Org/20251123134952-salt.org"
       "/home/mike/Documents/Org/20251123135247-saturated.org"
       "/home/mike/Documents/Org/20251123142041-particle.org"
       "/home/mike/Documents/Org/20251123142843-oxidation_reduction_reaction_redox.org"
       "/home/mike/Documents/Org/20251123142932-oxidation.org"
       "/home/mike/Documents/Org/20251123143024-reduction.org"
       "/home/mike/Documents/Org/20251124132839-covalent_bond.org"
       "/home/mike/Documents/Org/20251124133733-the_octet_rule.org"
       "/home/mike/Documents/Org/20251124133935-maximum_number_of_electrons_per_shell.org"
       "/home/mike/Documents/Org/20251124134224-average_atomic_mass.org"
       "/home/mike/Documents/Org/20251124134519-how_did_scientists_accurately_assertain_elements_before_atomic_theory_was_properly_developed.org"
       "/home/mike/Documents/Org/20251124134639-how_can_they_determine_the_ammount_of_electrons_surrounding_an_atom.org"
       "/home/mike/Documents/Org/20251124134742-shape_of_the_periodic_table.org"
       "/home/mike/Documents/Org/20251124135439-heat.org"
       "/home/mike/Documents/Org/20251124135449-electricity.org"
       "/home/mike/Documents/Org/20251124140510-bronze.org"
       "/home/mike/Documents/Org/20251124140611-alloy.org"
       "/home/mike/Documents/Org/20251125102121-emacs_calc.org"
       "/home/mike/Documents/Org/20251125105213-python.org"
       "/home/mike/Documents/Org/20251125105221-django.org"
       "/home/mike/Documents/Org/20251125105248-javascript.org"
       "/home/mike/Documents/Org/20251125110946-projects.org"
       "/home/mike/Documents/Org/20251125111008-christmas_break_2025.org"
       "/home/mike/Documents/Org/20251125111044-django.org"
       "/home/mike/Documents/Org/20251125111307-mikesnotes.org"
       "/home/mike/Documents/Org/20251125112057-adderall.org"
       "/home/mike/Documents/Org/20251125135854-org_babel.org"
       "/home/mike/Documents/Org/20251125145327-life.org"
       "/home/mike/Documents/Org/20251125145543-top_floor.org"
       "/home/mike/Documents/Org/20251125145647-main_floor.org"
       "/home/mike/Documents/Org/20251125145730-places_to_organize.org"
       "/home/mike/Documents/Org/20251125145901-pranks.org"
       "/home/mike/Documents/Org/20251125150018-health.org"
       "/home/mike/Documents/Org/20251125150210-books.org"
       "/home/mike/Documents/Org/20251125150238-goals.org"
       "/home/mike/Documents/Org/20251125150351-finances.org"
       "/home/mike/Documents/Org/20251125150616-emacs_flashcards_plugin.org"
       "/home/mike/Documents/Org/20251125150637-emacs_todo_display_device.org"
       "/home/mike/Documents/Org/20251125150656-emacs_canvas_tool.org"
       "/home/mike/Documents/Org/20251125150816-photography.org"
       "/home/mike/Documents/Org/20251125150931-birds.org"
       "/home/mike/Documents/Org/20251125151135-anxiety.org"
       "/home/mike/Documents/Org/20251125151237-stuff_i_want.org"
       "/home/mike/Documents/Org/20251125151351-stephen_hawking.org"
       "/home/mike/Documents/Org/20251125151933-tech.org"
       "/home/mike/Documents/Org/20251125152106-zealot.org"
       "/home/mike/Documents/Org/20251125153446-school.org"
       "/home/mike/Documents/Org/20251125154651-intermolecular_force.org"
       "/home/mike/Documents/Org/20251125154841-deposition.org"
       "/home/mike/Documents/Org/20251125155003-dipole_dipole_attraction.org"
       "/home/mike/Documents/Org/20251125155041-dipoles.org"
       "/home/mike/Documents/Org/20251125155145-hydrogen_bonding.org"
       "/home/mike/Documents/Org/20251125155430-induced_dipole.org"
       "/home/mike/Documents/Org/20251125161920-instantaneous_dipole.org"
       "/home/mike/Documents/Org/20251125162414-static_friction_stiction.org"
       "/home/mike/Documents/Org/20251125162740-van_der_waals.org"
       "/home/mike/Documents/Org/20251125164845-why_is_static_friction_greater_than_kinetic_friction.org"
       "/home/mike/Documents/Org/20251125165035-asperities.org"
       "/home/mike/Documents/Org/20251125165213-adhesive_force.org"
       "/home/mike/Documents/Org/20251125195646-dispersion_force.org"
       "/home/mike/Documents/Org/20251125200214-cohesive_force.org"
       "/home/mike/Documents/Org/20251125201856-kinetic_energy.org"
       "/home/mike/Documents/Org/20251125202236-phase_of_matter.org"
       "/home/mike/Documents/Org/20251125202444-condensate.org"
       "/home/mike/Documents/Org/20251125202757-melting.org"
       "/home/mike/Documents/Org/20251125202805-vaporization.org"
       "/home/mike/Documents/Org/20251125203207-intramolecular_force.org"
       "/home/mike/Documents/Org/20251126080230-thermal_energy.org"
       "/home/mike/Documents/Org/20251126080354-temperature.org"
       "/home/mike/Documents/Org/20251126080434-quantitative.org"
       "/home/mike/Documents/Org/20251126080717-lattice_energy.org"
       "/home/mike/Documents/Org/20251126080734-energy.org"
       "/home/mike/Documents/Org/20251126080947-joule.org"
       "/home/mike/Documents/Org/20251126081511-newton.org"
       "/home/mike/Documents/Org/20251126082647-calorie.org"
       "/home/mike/Documents/Org/20251126082758-water.org"
       "/home/mike/Documents/Org/20251126083308-bond_energy_bond_disssociation_energy.org"
       "/home/mike/Documents/Org/20251126083531-endothermic_process.org"
       "/home/mike/Documents/Org/20251126083656-exothermic_process.org"
       "/home/mike/Documents/Org/20251126083854-work.org"
       "/home/mike/Documents/Org/20251126084006-pressure.org"
       "/home/mike/Documents/Org/20251126084015-volume.org"
       "/home/mike/Documents/Org/20251126084343-ideal_gas.org"
       "/home/mike/Documents/Org/20251126084452-gas_laws.org"
       "/home/mike/Documents/Org/20251126084538-ideal_gas_constant_r.org"
       "/home/mike/Documents/Org/20251126084856-international_system_of_units.org"
       "/home/mike/Documents/Org/20251126085617-atmosphere_atm.org"
       "/home/mike/Documents/Org/20251126085735-ideal_gas_law.org"
       "/home/mike/Documents/Org/20251126090118-solid.org"
       "/home/mike/Documents/Org/20251126090419-kinetic_molecular_theory.org"
       "/home/mike/Documents/Org/20251126090933-pascal.org"
       "/home/mike/Documents/Org/20251126091303-boyle_s_law.org"
       "/home/mike/Documents/Org/20251126091703-absolute_zero.org"
       "/home/mike/Documents/Org/20251126091806-charles_s_law.org"
       "/home/mike/Documents/Org/20251126092516-avogadro_s_law.org"
       "/home/mike/Documents/Org/20251126095030-dipole_moment.org"
       "/home/mike/Documents/Org/20251126095232-polarity.org"
       "/home/mike/Documents/Org/20251126095743-double_bond.org"
       "/home/mike/Documents/Org/20251126100601-molecular_structure.org"
       "/home/mike/Documents/Org/20251126100752-nomenclature.org"
       "/home/mike/Documents/Org/20251126101454-polar_molecule.org"
       "/home/mike/Documents/Org/20251126101931-pure_covalent_bond.org"
       "/home/mike/Documents/Org/20251126102433-valence_shell_electron_pair_repulsion_theory.org"
       "/home/mike/Documents/Org/20251126102453-theory.org"
       "/home/mike/Documents/Org/20251126102914-aufbau_principle.org"
       "/home/mike/Documents/Org/20251126103151-core_electron.org"
       "/home/mike/Documents/Org/20251126103204-electron.org"
       "/home/mike/Documents/Org/20251126105409-angular_momentum_quantum_number.org"
       "/home/mike/Documents/Org/20251126110509-dalton.org"
       "/home/mike/Documents/Org/20251126110834-postulates.org"
       "/home/mike/Documents/Org/20251126111251-hypothesis.org"
       "/home/mike/Documents/Org/20251126112030-heterogeneous_mixture.org"
       "/home/mike/Documents/Org/20251126112256-law.org"
       "/home/mike/Documents/Org/20251126115254-liquid.org"
       "/home/mike/Documents/Org/20251126120233-kelvin_k.org"
       "/home/mike/Documents/Org/20251126141240-ph.org"
       "/home/mike/Documents/Org/20251126141545-hydronium.org"
       "/home/mike/Documents/Org/20251126141650-poh.org"
       "/home/mike/Documents/Org/20251126141725-hydroxide.org"
       "/home/mike/Documents/Org/20251126141856-acidic.org"
       "/home/mike/Documents/Org/20251126142228-basic.org"
       "/home/mike/Documents/Org/20251126143526-spontaneous_process.org"
       "/home/mike/Documents/Org/20251126143704-dissociation.org"
       "/home/mike/Documents/Org/20251126143757-dissolution.org"
       "/home/mike/Documents/Org/20251126143818-ionic_compound.org"
       "/home/mike/Documents/Org/20251126144134-polarizability.org"
       "/home/mike/Documents/Org/20251126144251-entropy.org"
       "/home/mike/Documents/Org/20251126145019-dissolution.org"
       "/home/mike/Documents/Org/20251126145034-diffusion.org"
       "/home/mike/Documents/Org/20251126155815-periodic_law.org"
       "/home/mike/Documents/Org/20251126180138-diatomic_molecules.org"
       "/home/mike/Documents/Org/20251126190352-.org"
       "/home/mike/Documents/Org/20251127114520-productivity.org"
       "/home/mike/Documents/Org/20251127120318-logarithms.org"
       "/home/mike/Documents/Org/20251127132602-mnemonic.org"
       "/home/mike/Documents/Org/20251127144308-pythagorean_therum.org"
       "/home/mike/Documents/Org/20251127150603-archwiki.org"
       "/home/mike/Documents/Org/20251127150648-don_t_repeat_yourself_principle.org"
       "/home/mike/Documents/Org/20251127154542-art.org"
       "/home/mike/Documents/Org/20251127154638-kanagawa_wave.org"
       "/home/mike/Documents/Org/20251127154714-vincent_van_gogh.org"
       "/home/mike/Documents/Org/20251127154914-casettefuturism.org"
       "/home/mike/Documents/Org/20251127154957-cyberpunk.org"
       "/home/mike/Documents/Org/20251128174904-fountain_pens.org"
       "/home/mike/Documents/Org/20251206091245-self_hosting.org"
       "/home/mike/Documents/Org/20251206091823-software_reccomendations_for_irfaan.org"
       "/home/mike/Documents/Org/Braidy's-Budget.org"
       "/home/mike/Documents/Org/Emacs org tutorial.org"
       "/home/mike/Documents/Org/Life.org" "/home/mike/Documents/Org/journal.org"
       "/home/mike/Documents/Org/daily/2025-11-01.org"
       "/home/mike/Documents/Org/daily/2025-11-02.org"
       "/home/mike/Documents/Org/daily/2025-11-04.org"
       "/home/mike/Documents/Org/daily/2025-11-09.org"
       "/home/mike/Documents/Org/daily/2025-11-10.org"
       "/home/mike/Documents/Org/daily/2025-11-14.org"
       "/home/mike/Documents/Org/daily/2025-11-17.org"
       "/home/mike/Documents/Org/daily/2025-11-18.org"
       "/home/mike/Documents/Org/daily/2025-11-19.org"
       "/home/mike/Documents/Org/daily/2025-11-22.org"
       "/home/mike/Documents/Org/daily/2025-11-24.org"
       "/home/mike/Documents/Org/daily/2025-11-25.org"
       "/home/mike/Documents/Org/daily/2025-11-26.org"
       "/home/mike/Documents/Org/daily/2025-11-27.org"
       "/home/mike/Documents/Org/daily/2025-11-28.org"
       "/home/mike/Documents/Org/daily/2025-12-06.org"))
   '(org-link-translation-function 'toc-org-unhrefify)
   '(org-num-face nil)
   '(org-pretty-entities nil)
   '(org-startup-with-latex-preview t)
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
                          white-sand-theme wiki-summary winum
                          yasnippet-classic-snippets yasnippet-snippets yatemplate
                          zen-and-art-theme zenburn-theme zonokai-emacs zotero
                          zotra))
   '(zotero-auth-token #s(zotero-auth-token "" "" nil nil) t))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(default ((t (:background nil))))
   '(org-checkbox ((t (:background "#00000000" :box nil))))
   '(org-code ((t (:inherit shadow :foreground "thistle"))))
   '(org-level-1 ((t nil)))
   '(org-level-2 ((t nil)))
   '(org-level-3 ((t nil)))
   '(org-level-4 ((t nil)))
   '(org-level-5 ((t nil)))
   '(org-level-7 ((t nil)))
   '(org-level-8 ((t nil)))
   '(org-verbatim ((t (:inherit shadow :foreground "LightBlue1")))))
  )
