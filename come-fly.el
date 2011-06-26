;;; come-fly.el --- minor mode for the Sinatra web mini-framework

;; Copyright (C) 2011 David Miller

;; Authors: David Miller
;; URL:
;; Version: 0.1
;; Created: 2011-06-26
;; Keywords: ruby, sinatra, project, convenience, web, framework
;; EmacsWiki:

;; This file is NOT part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;
;; Sinatra:
;;
;; Come fly with me, let's fly, let's fly away
;; If you can use some exotic booze
;; There's a bar in far Bombay
;; Come fly with me, let's fly, let's fly away
;;
;; Commentary:
;;
;; This minor mode provides support for Sinatra projects.
;;
;; Started mostly to provide an alternative to Eric Schulte's sinatra.el
;; With font-lock keywords for routes, and comint buffer for the server
;; (mostly to allow ruby-debug interaction).
;;

;;; Code:


;;
;; Module level requires
;;
(require 'cl)

;;
;; Regexping.
;;
;; Sinatra:
;;
;; Come fly with me, let's float down to Peru
;; In llama land there's a one-man band
;; And he'll toot his flute for you
;; Come fly with me, let's take off in the blue
;;
;; Commentary:
;;
;; In the context of Sinatra projects, route functions e.g. get
;; are essentially builtins - it'd be neat to understand them as
;; such and perform the relevant syntax highlighting.
;;

(defvar come-fly-font-lock-keywords
  (list
   '("\\(?:delete\\|get\\|options\\|p\\(?:\\(?:os\\|u\\)t\\)\\)" . font-lock-builtin-face))
  "Font lock matchers for Sinatra routes - used by `come-fly-minor-mode'")

(defvar come-fly-imenu-generic-expression
  '(("get"
     "get \\(.*\\) do") 1)
  "Imenu regexp for Sinatra projects")

;;
;; Userland Functions
;;
;; Sinatra:
;;
;; Once I get you up there where the air is rarified
;; We'll just glide, starry-eyed
;; Once I get you up there I'll be holding you so near
;; You may hear angels cheer 'cause we're together
;;
;; Commentary:
;;
;; Functions that users are likely to run. Stuff like the server.
;;

(defun sinatra-server (&optional edit-cmd-args)
  "Run the sinatra project. - note for this to work you should make your file
executable and inlude a shebang."
  (interactive "P")
  (let* ((script (buffer-file-name))
         (command (if edit-cmd-args
                      (read-string "Run : " (concat script " "))
                    script)))
    (apply 'make-comint "sinatra-server" (list command)))
  (message "Sinatra has taken the stage in *sinatra-server*"))

;;
;; Minor Mode
;;
;; Sinatra
;;
;; Weather-wise it's such a lovely day
;; You just say the words and we'll beat the birds
;; Down to Acapulco Bay
;; It's perfect for a flying honeymoon, they say
;; Come fly with me, let's fly, let's fly away
;;
;; Commentary:
;;
;; Define the mode function, and hooks
;;

(defvar come-fly-minor-mode-hook nil
  "Hook for customising come-fly minor mode.")

;;;###autoload
(define-minor-mode come-fly-minor-mode
  "Enable Sinatra minor mode providing Emacs support for working
with the Sinatra web mini-framework."
  :initial nil
  :lighter " S!"
  )

(defun come-fly-mode ()
  "Enable come-fly mode, a minor mode for editing Sinatra projects"
  (interactive)
  (come-fly-minor-mode t)
  (run-hooks 'come-fly-minor-mode-hook)
  (font-lock-add-keywords nil come-fly-font-lock-keywords)
  (setq imenu-generic-expression
        come-fly-imenu-generic-expression)
  (imenu-add-menubar-index))

;;
;; Sinatra:
;;
;; Once I get you up there where the air is rarified
;; We'll just glide, starry-eyed
;; Once I get you up there I'll be holding you so near
;; You may hear angels cheer 'cause we're together
;;
;; Weather-wise it's such a lovely day
;; You just say the words and we'll beat the birds
;; Down to Acapulco Bay
;; It's perfect for a flying honeymoon, they say
;; Come fly with me, let's fly, let's fly
;; Pack up, let's fly away!!

(provide 'come-fly)
;;; come-fly.el ends here
