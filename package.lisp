;;;; SPDX-FileCopyrightText: (#| TMPL_VAR author |#)
;;;; SPDX-License-Identifier: (#| TMPL_VAR license |#)

(uiop:define-package :(#| TMPL_VAR name |#)
  (:use :common-lisp)
  (:documentation "Describe `(#| TMPL_VAR name |#)' package here"))

(push :(#| TMPL_VAR name |#) *features*)
