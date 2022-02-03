VERSION ?= 0.0.16
IMAGE ?= quay.io/psturc/scorecard-test-kuttl:${VERSION}

.PHONY: image/build/push
image/build/push:
	docker build -t ${IMAGE} -f image/Dockerfile .
	docker push ${IMAGE}

.PHONY: build
build:
	go build -o scorecard-test-kuttl image/main.go
