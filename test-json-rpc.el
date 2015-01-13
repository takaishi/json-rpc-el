(require 'ert)
(require 'json-rpc)

(ert-deftest json-rpc:join-plist ()
  (should (equal '("owner=takaishi_r")
				 (json-rpc:join-plist "=" '(:owner "takaishi_r"))))
  )

(ert-deftest json-rpc ()
  (should (equal "{\"jsonrpc\":\"1.0\"}"
				 (json-rpc:make-data '(:jsonrpc "1.0"))))
  (should (equal "{\"jsonrpc\":\"1.0\", \"method\":\"getinfo\"}"
				 (json-rpc:make-data '(:jsonrpc "1.0" :method "getinfo"))))
  (should (equal "{\"params\":[]}"
				 (json-rpc:make-data '(:params nil))))
  (should (equal "{\"params\":[\"owner=takaishi_r\"]}"
				 (json-rpc:make-data '(:params (:owner "takaishi_r")))))
  (should (equal "{\"params\":[\"1000\"]}"
				 (json-rpc:make-data '(:params ("1000")))))
  ;; (should (equal "{\"params\":[\"1000\"]}"
  ;; 				 (json-rpc:make-data '(:params (1000)))))
  (should (equal "{\"params\":[\"owner=takaishi_r&changetime=..\"]}"
				 (json-rpc:make-data '(:params (:owner "takaishi_r" :changetime "..")))))
  )

(ert-run-tests-batch-and-exit)
