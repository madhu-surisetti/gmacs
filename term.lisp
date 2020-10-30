(defvar *console-io* *terminal-io*) ; we will need it later
(ql:quickload 'swank :silent t)
(swank:create-server :port 4005 :dont-close t)
(loop (sleep 1))
