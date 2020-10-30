(in-package :cl)

(asdf:defsystem #:gmacs
  :description "my very own lisp based text-editor"
  :author "madhu-surisetti"
  :depends-on (#:cl-charms
               #:utils)
  :serial t
  :components ((:file "package")
               (:file "display")
               (:file "gmacs")))
