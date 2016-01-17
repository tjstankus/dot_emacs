;; the built-in package manager
(require 'package)

;; popular package repositories
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; disable toolbar
(tool-bar-mode -1)

;; load evil mode package into memory
(require 'evil)
;; call main mode function, load immediatedly upon opening in all buffers
(evil-mode t)


;;
;; from http://blog.aaronbieber.com/2015/05/24/from-vim-to-emacs-in-fourteen-days.html
;;
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.

Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

;; Make sure to have downloaded archive description.
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

;; Activate installed packages
(package-initialize)

;; Assuming you wish to install the listed packages
(ensure-package-installed 'evil 'helm 'projectile 'org)
