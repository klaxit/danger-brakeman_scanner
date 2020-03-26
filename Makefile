BE = bundle exec

.PHONY: default
default: test rubocop docs

.PHONY: test
test:
	$(BE) rspec

.PHONY: rubocop
rubocop:
	$(BE) rubocop

.PHONY: docs
docs:
	$(BE) danger plugins lint
