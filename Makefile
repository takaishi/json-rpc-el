#!/usr/bin/make

EMACS    = emacs --batch --quick --directory .
WGET     = wget --timestamping

all: test

test: ert.el
	$(EMACS) --eval '(load-file "test-json-rpc.el")'

ert.el:
	$(WGET) --output-document=$@ \
	http://git.savannah.gnu.org/cgit/emacs.git/plain/lisp/emacs-lisp/ert.el
