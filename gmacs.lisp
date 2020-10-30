;; the kilo editor

(in-package :gmacs)

(defmacro with-mode-setup (bindings &body body)
  "enable & disable echoing and raw mode"
  `(charms:with-curses ()
     (let* ,bindings
       (disable-echoing)
       (enable-raw-input)
       (enable-extra-keys *standard-window*)
       ,@body)))


(defun run (file)
  "this is the entry-point of the editor"
  (with-mode-setup
      ((scr (make-window
             (max-x *standard-window*)
             (max-y *standard-window*)
             0 0))
       (buffer (lines file))
       (offset 0))
    (display-frame
     (fill-empty-lines scr buffer)
     scr)
    (awhile (get-char scr)
      (cond ((eql it +down+)
             (incf offset))
            ((eql it +up+)
             (decf offset)))
      (display-frame
              (fill-empty-lines scr buffer)
              scr
              :offset offset))
    (clear-window scr)
    (refresh-window scr)))
