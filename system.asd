;;;; SPDX-FileCopyrightText: (#| TMPL_VAR author |#)
;;;; SPDX-License-Identifier: (#| TMPL_VAR license |#)

(defsystem "(#| TMPL_VAR name |#)"
  :description "Describe (#| TMPL_VAR name |#) here"
  :author "(#| TMPL_VAR author |#)"
  :homepage "https://github.com/atlas-engineer/(#| TMPL_VAR name |#)"
  :license  "(#| TMPL_VAR license |#)"
  :version "0.0.0"
  :in-order-to ((test-op (test-op "(#| TMPL_VAR name |#)/tests")))(#| TMPL_IF depends-on |#)
  :depends-on (#| TMPL_VAR dependencies-string |#)(#| /TMPL_IF |#)
  :serial t
  :components ((:file "package")
               (:file "(#| TMPL_VAR name |#)")))

(defsystem "(#| TMPL_VAR name |#)/tests"
  :depends-on (#:(#| TMPL_VAR name |#) #:lisp-unit2)
  :serial t
  :pathname "tests/"
  :components ((:file "package")
               (:file "tests"))
  :perform (test-op (o c)
                    (let* ((*debugger-hook* nil)
                           (test-results (symbol-call :lisp-unit2 :run-tests
                                                      :package :(#| TMPL_VAR name |#)/tests
                                                      :run-contexts (find-symbol "WITH-SUMMARY-CONTEXT" :lisp-unit2))))
                      (when (or
                             (uiop:symbol-call :lisp-unit2 :failed test-results)
                             (uiop:symbol-call :lisp-unit2 :errors test-results))
                        ;; Arbitrary but hopefully recognizable exit code.
                        (quit 18)))))
