;;;; SPDX-FileCopyrightText: (#| TMPL_VAR author |#)
;;;; SPDX-License-Identifier: (#| TMPL_VAR license |#)

(defsystem "(#| TMPL_VAR name |#)"
  :description "Describe (#| TMPL_VAR name |#) here"
  :author "(#| TMPL_VAR author |#)"
  :homepage "https://github.com/atlas-engineer/(#| TMPL_VAR name |#)"
  :license  "(#| TMPL_VAR license |#)"
  :version "0.0.0"(#| TMPL_IF depends-on |#)
  :depends-on (#| TMPL_VAR dependencies-string |#)(#| /TMPL_IF |#)
  :serial t
  :components ((:file "package")
               (:file "(#| TMPL_VAR name |#)"))
  :in-order-to ((test-op (test-op "(#| TMPL_VAR name |#)/tests")
                         (test-op "(#| TMPL_VAR name |#)/tests/compilation"))))

(defsystem "(#| TMPL_VAR name |#)/submodules"
  :defsystem-depends-on ("nasdf")
  :class :nasdf-submodule-system)

(defsystem "(#| TMPL_VAR name |#)/tests"
  :defsystem-depends-on ("nasdf")
  :class :nasdf-test-system
  :depends-on ("(#| TMPL_VAR name |#)")
  :targets (:package :(#| TMPL_VAR name |#)/tests)
  :serial t
  :pathname "tests/"
  :components ((:file "package")
               (:file "tests")))

(defsystem "(#| TMPL_VAR name |#)/tests/compilation"
  :defsystem-depends-on ("nasdf")
  :class :nasdf-compilation-test-system
  :depends-on ((#| TMPL_VAR name |#))
  :packages (:(#| TMPL_VAR name |#)))
