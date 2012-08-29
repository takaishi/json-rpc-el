#!/usr/bin/make

EMACS    = emacs --batch --quick --directory .

all: test

test: 
	$(EMACS) --eval '(load-file "test-json-rpc.el")'
