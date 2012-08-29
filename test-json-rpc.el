(require 'ert)
(require 'json-rpc)

(ert-deftest json-rpc ()
  (should (equal "1" "2")))

(ert-run-tests-batch-and-exit)
