
;;; lang/mylisp/autoload.el -*- lexical-binding: t; -*-

;; mvn functions
;;;###autoload
(defun mvn-run-class-my ()
  "Execute a mvn exec:java goal for current file buffer."
  (interactive "")

  (let* ((package (save-excursion
                    (goto-char (point-min))
                    (when (re-search-forward "^\\s *package\\s +\\(.*\\);" (point-max) t)
                      (match-string 1)))
                  )
         (className (file-name-sans-extension
                     (file-name-nondirectory (buffer-file-name))))
         )
    (if package
        (mvn (concat "exec:java -Dexec.mainClass=" package "." className))
      (message "can not read package from this buffer"))
    ))

;;;###autoload
(defun mvn-unit-test-on-functionname ()
  "run mvn test on the function name of the test class,you must put the point on the funcion name ."
  (interactive)
  (save-excursion (let* ((bufferfilename (buffer-file-name))
                         (classname (car (split-string (car (last (split-string buffer-file-name  "/"))) "\\.")))
                         (function-name-begin (progn (skip-chars-backward "-_A-Za-z0-9") (point)))
                         (function-name-end (progn (skip-chars-forward "-_A-Za-z0-9") (point)))
                         (function-name (buffer-substring function-name-begin function-name-end)))
                    (mvn (concat  "test " "-Dtest=" classname "#" function-name)  )))

  )

;;;###autoload
(defun mvn-unit-test-on-functionname-debug ()
  "run mvn test on the function name of the test class,you must put the point on the funcion name ."
  (interactive)
  (save-excursion (let* ((bufferfilename (buffer-file-name))
                         (classname (car (split-string (car (last (split-string buffer-file-name  "/"))) "\\.")))
                         (function-name-begin (progn (skip-chars-backward "-_A-Za-z0-9") (point)))
                         (function-name-end (progn (skip-chars-forward "-_A-Za-z0-9") (point)))
                         (function-name (buffer-substring function-name-begin function-name-end)))
                    (mvn (concat  "test " "-Dmaven.surefire.debug " "-Dtest=" classname "#" function-name)  )))

  )

;;;###autoload
(defun mvn-package-withouttest ()
  "run mvn pckage without unitest ."
  (interactive)
  (let ((default-directory (mvn-find-root mvn-build-file-name)))
    (if default-directory
      (compile (concat mvn-command " package -Dmaven.test.skip=ture "))
      (message "Couldn't find a maven project."))))



;;;###autoload
(defun my/util/copy-string-clipboard (s)
  "copy string to clipboad"
  (if (stringp s)
      (with-temp-buffer
        (insert s)
        (clipboard-kill-region (point-min) (point-max)))
    )

  )
;;;###autoload
(defun  my/work/get-coder-secret()
    "unicom company coder user key key"
    (interactive)
    (my/util/copy-string-clipboard "MzRdC@^8XL5R")
    )
;;;###autoload
(defun  my/work/get-wotvuser-secret()
    "unicom company wotv project coder user key key"
    (interactive)
    (my/util/copy-string-clipboard "Hdljd@1024Ylz^x")
    )
;;;###autoload
(defun  my/work/get-gitlab-key()
    "unicom company wotv project coder user key key"
    (interactive)
    (my/util/copy-string-clipboard "tJkrAmwmLisEi3hnAN4f")
    )
;;;###autoload
(defun  my/work/get-gitlab-username()
    "unicom company wotv project coder user key key"
    (interactive)
    (my/util/copy-string-clipboard "skh7518671@qq.com")
    )
