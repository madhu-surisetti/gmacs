;; all these functions act on buffer
;; refresh screen to see those changes

(in-package :gmacs)

(defun nx (n item)                      ; (nx 4 1) => '(1 1 1 1)
  "return a list with n items"
  (let ((lst ()))
    (dotimes (i n)
      (setf lst (append lst (list item))))
    lst))

(defun window-limits (window)           ; (window-limits *standard-window*) => '(max-x max-y)
  (multiple-value-bind (width height)
      (window-dimensions window)
    (list width height)))

(defun max-x (window)
  (car (window-limits window)))

(defun max-y (window)
  (cadr (window-limits window)))

;; lines are part of the file
;; where as rows are part of the screen
;; all lines are rows but not vice-versa
(defun count-empty-rows (window buffer)
  "counts the empty lines on the screen"
  (let ((buf-len (length buffer))
        (max-rows (max-y window)))
    (if (> (- max-rows buf-len) 0)
        (- max-rows buf-len))))

(defun fill-empty-lines (window buffer)
  "write the empty lines with ~ (like vim does)"
  (let ((empty-rows (count-empty-rows window buffer))
        (tilde "~"))
    (if empty-rows                  ; unless there are no empty rows
        (print (append buffer (nx empty-rows tilde)))
        buffer)))

(defun display-frame (buffer window &key (offset 0))
  "render the buffer to terminal"
  (let ((row -1)
        (scr-height (max-y window))
        (buf-len (length buffer)))
    (mapcar #'(lambda (line)
                (print row)
                (write-string-at-point window line 0 (incf row)))
            (subseq buffer offset 8))
    (refresh-window window)))
