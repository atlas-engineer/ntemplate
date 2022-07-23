;;;; SPDX-FileCopyrightText: (#| TMPL_VAR author |#)
;;;; SPDX-License-Identifier: (#| TMPL_VAR license |#)

(asdf:defsystem #:(#| TMPL_VAR name |#)
  :description "Describe (#| TMPL_VAR name |#) here"
  :author "(#| TMPL_VAR author |#)"
  :license  "(#| TMPL_VAR license |#)"
  :version "0.0.1"
  :serial t(#| TMPL_IF depends-on |#)
  :depends-on (#| TMPL_VAR dependencies-string |#)(#| /TMPL_IF |#)
  :components ((:file "package")
               (:file "(#| TMPL_VAR name |#)")))

(defsystem "(#| TMPL_VAR name |#)/tests"
  :depends-on ((#| TMPL_VAR name |#) lisp-unit2)
  :serial t
  :components ((:file "tests/package")
               (:file "tests/tests"))
  :perform (test-op (o c)
                    (symbol-call :lisp-unit2 :run-tests
                                 :package :(#| TMPL_VAR name |#)/tests
                                 :run-contexts (symbol-function
                                                (read-from-string "lisp-unit2:with-summary-context")))))
