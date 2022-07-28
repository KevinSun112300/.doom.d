;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 22))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; common theme list: doom-one doom-one-light doom-city-lights doom-nord-light
;; modify doom-theme variable, then run M-x doom/reload-them
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/home/sun/share/workdoc/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(after! org
  (setq org-todo-keywords '((sequence "TODO(t)" "PROJ(p)" "NEXT(n!)" "WAIT(w!)" "HOLD(h!)" "|" "DONE(d!)" "KILL(k)")
                            (sequence "[ ](T)" "[-](S)" "[?](W)" "|" "[X](D)")))
  (setq org-todo-keyword-faces '(("TODO" . +org-todo-active)
                                 ("NEXT" . +org-todo-onhold)
                                 ("[-]" . +org-todo-active)
                                 ("STRT" . +org-todo-active)
                                 ("[?]" . +org-todo-onhold)
                                 ("WAIT" . +org-todo-onhold)
                                 ("HOLD" . +org-todo-onhold)
                                 ("PROJ" . +org-todo-project)))
  )
(after! projectile
  (pushnew! projectile-project-root-files "pom.xml")
  (projectile-register-project-type 'maven '("pom.xml")
          ;;:project-file "pom.xml"
				  :compile "mvn package -Dmaven.test.skip=true"
				  :test "mvn test"
				  :run "mvn spring-boot:run"
				  :test-suffix "Tests"
          :src-dir "src/main/java"
          :test-dir "src/test/java"
          )
  (setq projectile-create-missing-test-files t)
)

(after! cc-mode
  (set-company-backend! 'java-mode 'company-meghanada 'company-dabbrev-code)
  )

(setq +lookup-provider-url-alist
      '(
        ("Baidu" "https://www.baidu.com/s?wd=%s")
        ("Google" +lookup--online-backend-google "https://google.com/search?q=%s")
        ("Github" "https://github.com/search?ref=simplesearch&q=%s")
        ("Doom Emacs issues" "https://github.com/hlissner/doom-emacs/issues?q=is%%3Aissue+%s")
        ("Google images" "https://www.google.com/images?q=%s")
        ("Google maps" "https://maps.google.com/maps?q=%s")
        ("Project Gutenberg" "http://www.gutenberg.org/ebooks/search/?query=%s")
        ("DuckDuckGo" +lookup--online-backend-duckduckgo "https://duckduckgo.com/?q=%s")
        ("DevDocs.io" "https://devdocs.io/#q=%s")
        ("StackOverflow" "https://stackoverflow.com/search?q=%s")
        ("Youtube" "https://youtube.com/results?aq=f&oq=&search_query=%s")
        ("Wolfram alpha" "https://wolframalpha.com/input/?i=%s")
        ("Wikipedia" "https://wikipedia.org/search-redirect.php?language=en&go=Go&search=%s")))

;;; set chinese font
(if (display-graphic-p) (dolist (charset '(kana han cjk-misc bopomofo))
   (set-fontset-font (frame-parameter nil 'font) charset
                     (font-spec :family "WenQuanYi Zen Hei Mono" ))))
;; size 22
(setq doom-font (font-spec :family "WenQuanYi Micro Hei Mono")
      doom-variable-pitch-font (font-spec :family "WenQuanYi Micro Hei Mono")
      doom-unicode-font (font-spec :family "WenQuanYi Zen Hei Mono")
      doom-serif-font (font-spec :family "WenQuanYi Zen Hei Mono")
      doom-big-font (font-spec :family "WenQuanYi Micro Hei Mono"))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

(map! :leader
      (:prefix ("C-a" . "some my keys")
          :desc "avy goto char" "C-y" #'avy-goto-char))
