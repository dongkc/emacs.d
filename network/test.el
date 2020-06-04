
(setq tcp-server-list-processes-enabled t)
(setq tcp-server-trace-enabled t)
(setq tcp-server-trace-popup-enabled nil)


;; tcp-server settings
(setq tcp-server-list (quote (("127.0.0.1" 8000 tcp-receive-filter))))

(defun tcp-receive-filter (proc message)
  "process the received message"
  (message (binary-to-hex message))
    (tcp-server-trace proc (concat "R:" (binary-to-hex message))))

(setq binary-data
      [ 192 168 1 100 -192 168 1 101 01 28 21 32
            160 134 1 0 5 1 0 0 2 0 0 0])

(defun binary-to-hex2(binary)
  "convert binary array to hex string"
  (interactive)
          (seq-mapn (lambda (elt)
                      ;; (format "%02X" (abs elt) )) binary-data) " ")
                      (format "%02X" (abs elt) )) binary)
  )


(defun binary-to-hex(binary)
  "convert binary array to hex string"
  (interactive)
  (mapconcat 'identity
          (seq-mapn (lambda (elt)
                      ;; (format "%02X" (abs elt) )) binary-data) " ")
                      (format "%02X" (logand 255 elt) )) binary) " ")
  )

(message (binary-to-hex binary-data))

(message (format "%x" binary-data))