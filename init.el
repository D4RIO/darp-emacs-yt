(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-s") 'helm-occur)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

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
