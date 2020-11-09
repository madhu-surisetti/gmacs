(in-package :cl)

(asdf:defsystem #:gmacs
  :description "my very own lisp based text-editor"
  :author "madhu-surisetti"
  :depends-on (#:cl-charms)
  :serial t
  :components ((:file "utils")
               (:file "package")
               (:file "display")
               (:file "gss")
               (:file "gtml")
               (:file "gmacs")))
