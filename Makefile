.PHONY: help
help: ## Display this help messages
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: newPost
newPost: ## Create new Post. Plz SET title as args. like (`make newPost hogehoge`)
	@hugo new content/post/$(filter-out $@,$(MAKECMDGOALS)).md

.PHONY: server
server: ## Start preview server
	@hugo server -D
%:
	@:
