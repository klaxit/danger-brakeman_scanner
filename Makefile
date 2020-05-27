BE ?= bundle exec
VERSION = $$(ruby -r ./lib/version.rb -e 'puts DangerBrakemanScanner::VERSION')
.PHONY: default
default: spec

.PHONY: publish
publish: clean spec
	git tag v$(VERSION)
	git push origin v$(VERSION)
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
	rm -f *.gem
