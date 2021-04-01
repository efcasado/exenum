.PHONY: all deps compile test

all: deps compile test

deps:
	mix deps.get
	mix deps.compile

compile:
	mix compile

test:
	mix test
