(require 'json)

(defun json-rpc:join-plist (glue plist)
  (let (result)
  (while plist
	(push (concat (substring (symbol-name (car plist)) 1) glue (cadr plist))
		  result)
	(setq plist (cddr plist)))
  result))

(defun json-rpc:make-data (plist)
  (if (member :params plist)
	  (if  (plist-get plist :params)
		  (setq plist (plist-put plist :params (vconcat (json-rpc:join-plist "=" (plist-get plist :params)))))
		(setq plist (plist-put plist :params []))))
  (json-encode-plist plist))

(provide 'json-rpc)
