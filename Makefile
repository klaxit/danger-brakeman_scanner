BE = bundle exec

.PHONY: default
default: spec

.PHONY: publish
publish: clean spec
	gem build
	gem push *.gem

.PHONY: spec
spec: test rubocop docs

.PHONY: test
test:
	$(BE) rspec

.PHONY: rubocop
rubocop:
	$(BE) rubocop

.PHONY: docs
docs:
	$(BE) danger plugins lint

.PHONY: clean
clean:
	rm *.gem
