

.PHONY: new
new:
	perl bin/new-article

.PHONY: start
start:
	hugo server --buildDrafts --buildFuture --disableFastRender -d built
