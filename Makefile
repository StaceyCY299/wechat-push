PACKAGES := "push"

.PHONY: build
build:
	docker build . -f Dockerfile --tag sajor:wechat-push

.PHONY: run
run:
	docker run --name wechat-push -d -p9999:9999 wechat-push
