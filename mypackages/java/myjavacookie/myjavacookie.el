;;; mypackages/java/myjavacookie/myjavacookie.el -*- lexical-binding: t; -*-

(defun java-package-from-buffer ()
    "get package string from a java class file. based on package declare"
    (interactive)
    (save-excursion
  (goto-char (point-min))
  (when (re-search-forward "^\\s *package\\s +\\(.*\\);" (point-max) t)
    (insert (match-string 1))))

    )

(provide 'myjavacookie)
