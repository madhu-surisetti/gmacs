(in-package :gmacs)

;; How Display works...
;; You have a document.
;; You look at the doc through a frame.
;; because the whole doc won't fit on the screen.

;; common html tags
;; head, title, body, header,
;; footer, article, section, p,
;; div, span, img, aside,
;; audio, canvas, details, datalist,
;; embed, nav, output, progress,
;; video, ol, ul, li
;; you will need flexbox/grid whatever

;; defdoc is the html tag equivalent of gtml
;; the text inside gtml is just a string
;; whereas the tags modify the interpretation of the string
;; (defdoc name args gtml)


(defmacro defdoc (&body body)
  `(defun ,@body))

(defmacro :gtml ((&key (:title "gtml-page")) &body body)
  `(write-string-at-point screen ,body 0 0))

(defdoc just-a-file (screen file)
  (:gtml "this is just a string!!!!"))
