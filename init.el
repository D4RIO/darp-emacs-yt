(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(eval-when-compile
    (require 'use-package))

(use-package helm
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-s") 'helm-occur)
  (global-set-key (kbd "C-x C-f") 'helm-find-files))

(use-package multiple-cursors
  :ensure t
  :config
  ;; Multiple Cursors
  (defun darp--add-top-cursor-or-remove-from-bottom ()
    (interactive)
    (let ((last-cursor (mc/furthest-cursor-after-point)))
      (if last-cursor
	  (mc/remove-fake-cursor last-cursor)
	(mc/mark-previous-lines 1))))
  (defun darp--add-bottom-cursor-or-remove-from-top ()
    (interactive)
    (if (mc/furthest-cursor-before-point)
	(mc/remove-fake-cursor (mc/furthest-cursor-before-point))
      (mc/mark-next-lines 1)))
  (global-unset-key (kbd "C-<down-mouse-1>"))
  (global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)
  (global-set-key (kbd "C-M-<down>") 'darp--add-bottom-cursor-or-remove-from-top)
  (global-set-key (kbd "C-M-<up>") 'darp--add-top-cursor-or-remove-from-bottom))

(use-package yasnippet
  :ensure t)

(use-package company
  :ensure t)

(use-package undo-tree
  :ensure t)

(defun modos-de-programacion ()
  (yas-minor-mode 1)
  (linum-mode 1)
  (company-mode 1))

(add-to-list 'prog-mode-hook 'modos-de-programacion)

(defun darp--get-c-var-declaration (TIPO)
  "Retorna una declaración de variable de C según el tipo de retorno de la función (TIPO)"
  (cond
   ((string= TIPO "int")
    "int ret_val = 0;")
   ((string= TIPO "long")
    "long ret_val = 0l;")
   ((not (string= TIPO "void"))
    (concat TIPO " ret_val= INICIALIZAR;"))
   (t "")))

(defun darp--get-c-return-statement (TIPO)
  "Retorna el statement de retorno de una función de C según el tipo de retorno declarado (TIPO)"
  (cond
   ((not (string= TIPO "void"))
    "return ret_val;")
   (t "")))



