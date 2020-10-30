;; the kilo editor

(defpackage taylr
  (:use #:cl #:cl-charms))

(in-package #:taylr)

(ql:quickload '(cl-charms bordeaux-threads alexandria))
(ql:quickload '(cl-charms-paint cl-charms-timer) :silent t)


(defmacro with-mode-setup (bindings &body body)
  "enable & disable echoing and raw mode"
  `(charms:with-curses ()
     (let* ,bindings
       (disable-echoing)
       (enable-raw-input)
       (enable-extra-keys *standard-window*)
       ,@body)))


(defun start-editor ()
  "this is the entry-point of the editor"
  (with-mode-setup
      ((scr (make-window
             (max-x *standard-window*)
             (max-y *standard-window*)
             0 0))
       (buffer '("madhu" "vamsi" "surisetti")))
    (display-buffer
     (fill-empty-lines scr buffer)
     scr)
    (get-char scr)
    (clear-window scr)
    (refresh-window scr)))

(start-editor)
