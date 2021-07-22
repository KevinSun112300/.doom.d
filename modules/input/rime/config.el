;;; input/rime/config.el -*- lexical-binding: t; -*-
(after! rime
  (setq rime-user-data-dir "~/.config/fcitx/rime")
  (setq rime-librime-root "~/.emacs.d.bak/librime")
  (setq rime-posframe-properties
        (list :background-color "#333333"
              :foreground-color "#dcdccc"
              :font "WenQuanYi Micro Hei Mono-14"
              :internal-border-width 10)))

(use-package! posframe
  :after rime
  :config
  (setq default-input-method "rime"
      rime-show-candidate 'posframe))
